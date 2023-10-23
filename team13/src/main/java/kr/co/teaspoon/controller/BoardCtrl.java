package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.dto.Report;
import kr.co.teaspoon.service.BoardService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/board/*")
public class BoardCtrl {

    @Autowired
    private BoardService boardService;

    @Autowired
    HttpSession session; // 세션 생성

    // 게시판 목록
    @GetMapping("list.do")		// board/list.do
    public String getBoardList(Model model) throws Exception {
        List<Board> boardList = boardService.boardList();
        model.addAttribute("boardList", boardList);
        return "/board/boardList";
    }

    // 게시판 상세
    @GetMapping("detail.do")	// board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardService.boardDetail(bno);
        List<Board> comment = boardService.commentList(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("comment", comment);
        System.out.println(comment.toString());
        return "/board/boardDetail";
    }

    // 게시판 추가 폼 이동
    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/boardInsert";
    }

    // 게시판 추가
    @PostMapping("insert.do")
    public String boardInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor((String) session.getAttribute("sid"));
        boardService.boardInsert(dto);
        return "redirect:/board/list.do";
    }

    // 게시판 댓글 추가
    @PostMapping("commentInsert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setAuthor(request.getParameter("id"));
        dto.setBno(Integer.parseInt(request.getParameter("bno")));
        dto.setContent(request.getParameter("content"));
        boardService.commentInsert(dto);
        return "redirect:/board/detail.do?bno="+dto.getBno();
    }

    // 게시판 글 삭제
    @GetMapping("delete.do")
    public String boardDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardService.boardDelete(bno);
        boardService.commentDeleteAll(bno);
        return "redirect:list.do";
    }

    // 게시판 댓글 삭제
    @GetMapping("comDelete.do")
    public String ComDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        int par = Integer.parseInt(request.getParameter("par"));
        Board dto = new Board();
        dto.setPar(par);
        boardService.boardDelete(bno);
        return "redirect:/board/detail.do?bno="+dto.getPar();
    }

    // 게시판 수정 폼 이동
    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardService.boardDetail(bno);
        model.addAttribute("dto", dto);
        return "/board/boardEdit";
    }

    // 게시판 수정
    @PostMapping("edit.do")
    public String boardEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = new Board();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.boardEdit(dto);
        return "redirect:/board/detail.do?bno="+dto.getBno();
    }

    // 댓글 수정 폼 이동
    @GetMapping("commentEdit.do")
    public String editCommentForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardService.boardDetail(bno);
        model.addAttribute("dto", dto);
        return "/board/ComEdit";
    }

    // 댓글 수정
    @PostMapping("commentEdit.do")
    public String boardCommentEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        int par = Integer.parseInt(request.getParameter("par"));
        Board dto = new Board();
        dto.setBno(bno);
        dto.setPar(par);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        System.out.println(dto.toString());
        boardService.boardEdit(dto);
        return "redirect:/board/detail.do?bno="+dto.getPar();
    }

    //게시글 신고 팝업 창
    @RequestMapping("reportPopup.do")
    public String reportPopup(HttpServletRequest request, Model model) throws Exception {
        return "/board/reportPopup";
    }

    //팝업창에서 게시글 신고 버튼 눌렀을때 처리
    @RequestMapping(value = "report.do", method = RequestMethod.POST)
    public void report(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        int bno = Integer.parseInt(request.getParameter("bno"));

        System.out.println("id "+id);
        System.out.println("rea "+reason);
        System.out.println("bno "+bno);
        Report report = new Report();
        report.setReporter(id);
        report.setReason(reason);
        report.setBoard_bno(bno);
        boolean result = false;
        int chk1 = boardService.checkReported(report);
        if (chk1 == 0) {
            boardService.reportBoard(report);
            result = true;
        } else {
            result = false;
        }


        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
        System.out.println(json.toString());

    }
    @PostMapping(value = "chkReported.do")
    public void chkReported(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        int bno = Integer.parseInt(request.getParameter("bno"));
        Report report = new Report();
        report.setReporter(id);
        report.setBoard_bno(bno);
        System.out.println(report.toString());
        int chk = boardService.checkReported(report);

        boolean result = false;
        if (chk != 0) {
            result = true;
        } else {
            result = false;
        }
        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

}
