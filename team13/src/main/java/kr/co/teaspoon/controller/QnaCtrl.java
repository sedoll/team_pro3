package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Qna;
import kr.co.teaspoon.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
@RequestMapping("/qna/*")
public class QnaCtrl {

    @Autowired
    private QnaService qnaService;

    @Autowired
    HttpSession session; // 세션 생성

    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @GetMapping("list.do")		// board/list.do
    public String getBoardList(Model model) throws Exception {
        List<Qna> qnaList = qnaService.qnaList();
        model.addAttribute("qnaList", qnaList);
        return "/qna/qnaList";
    }

    @GetMapping("detail.do")	// qna/detail.do?bno=1
    public String getqnaDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Qna dto = qnaService.qnaDetail(bno);
        List<Qna> comment = qnaService.commentList(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("comment", comment);
        System.out.println(comment.toString());
        return "/qna/qnaDetail";
    }

    @GetMapping("qnapw.do")
    public String qnaPw(HttpServletRequest request, Model model) throws Exception {
        model.addAttribute("bno", request.getParameter("bno"));
        return "/qna/qnaPw";
    }

    @PostMapping("check.do")
    public String signIn(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        String pw = request.getParameter("pw");
        boolean check = qnaService.check(bno, pw);
        if(check) { // 비밀번호 일치
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호 확인');</script>");
            out.flush();
            Qna dto = qnaService.qnaDetail(bno);
            List<Qna> comment = qnaService.commentList(bno);
            model.addAttribute("dto", dto);
            model.addAttribute("comment", comment);
            System.out.println(comment.toString());
            return "/qna/qnaDetail";
        } else { // 비밀번호 불 일치
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
            out.flush();
            model.addAttribute("bno", bno);
            return "/qna/qnaPw";
        }
    }


    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/qna/qnaInsert";
    }

    @RequestMapping(value="insert.do", method = RequestMethod.POST)
    public String memberWrite(Qna qna, Model model) throws Exception {
        System.out.println(qna.toString());
        qna.setAuthor((String) session.getAttribute("sid"));
        if(qna.getPw() != null && !qna.getPw().equals("")) {
            String ppw = qna.getPw();
            String pw = pwEncoder.encode(ppw);
            qna.setPw(pw);
        }
        qnaService.qnaInsert(qna);
        return "redirect:list.do";
    }

    @PostMapping("commentInsert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setAuthor(request.getParameter("id"));
        dto.setBno(Integer.parseInt(request.getParameter("bno")));
        dto.setContent(request.getParameter("content"));
        qnaService.commentInsert(dto);
        return "redirect:detail.do?bno="+dto.getBno();
    }

    @GetMapping("delete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        qnaService.qnaDelete(bno);
        qnaService.commentDeleteAll(bno);
        return "redirect:list.do";
    }

    @GetMapping("comDelete.do")
    public String qnaComDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        int par = Integer.parseInt(request.getParameter("par"));
        Qna dto = new Qna();
        dto.setPar(par);
        qnaService.qnaDelete(bno);
        return "redirect:/qna/detail.do?bno="+dto.getPar();
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Qna dto = qnaService.qnaDetail(bno);
        model.addAttribute("dto", dto);
        return "/qna/qnaEdit";
    }

    @PostMapping("edit.do")
    public String qnaEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Qna dto = new Qna();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        qnaService.qnaEdit(dto);
        return "redirect:list.do";
    }

    @GetMapping("commentEdit.do")
    public String editCommentForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Qna dto = qnaService.qnaDetail(bno);
        model.addAttribute("dto", dto);
        return "/qna/qnaComEdit";
    }

    @PostMapping("commentEdit.do")
    public String qnaCommentEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        int par = Integer.parseInt(request.getParameter("par"));
        Qna dto = new Qna();
        dto.setBno(bno);
        dto.setPar(par);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        System.out.println(dto.toString());
        qnaService.qnaEdit(dto);
        return "redirect:/qna/detail.do?bno="+dto.getPar();
    }
}
