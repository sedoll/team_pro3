
package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminCtrl {

    @Autowired
    private MemberService memberService; // 서비스 생성
    @Autowired
    private BoardService boardService; //자유게시판
    @Autowired
    private BoardTeaServiceImpl boardTeaService; //선생님게시판
    @Autowired
    private BoardParServiceImpl boardParService; //학부모게시판
    @Autowired
    private NoticeService noticeService; //공지사항
    @Autowired
    HttpSession session; // 세션 생성


    @GetMapping("adminMain.do")
    public String adminMain(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        List<Board> boardList = boardService.recentReportList();    // 최근 신고 내역 알림창
        model.addAttribute("boardList", boardList); // 최근 신고 내역 알림창

        return "/admin/adminMain";
    }

    //회원 목록
    @RequestMapping(value = "memberList.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/admin/memberList";
    }

    // 관리자 회원 상세
    @GetMapping("memberDetail.do")
    public String getMemberDetail(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/admin/memberDetail";
    }

    // 회원 탈퇴, 강퇴
    @GetMapping("delete.do")
    public String memberDelete(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        return "/admin/memberList";
    }

    //게시판 관리
    //게시판 글 목록
    @GetMapping("boardList.do")
    public String getBoardList(HttpServletRequest request,Model model) throws Exception {
        String category = (String) request.getParameter("category");
        if(category.equals("free")){
            List<Board> boardList = boardService.boardList();
            model.addAttribute("categoryKor", "자유");
            model.addAttribute("category", category); //한글 사용시 에러 나므로 영문값도 전달
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "board");
            return "/admin/boardList";
        } else if (category.equals("teacher")) {
            List<Board> boardList = boardTeaService.boardList();
            model.addAttribute("categoryKor", "선생님");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardTea");
            return "/admin/boardList";
        } else if (category.equals("parent")) {
            List<Board> boardList = boardParService.boardList();
            model.addAttribute("categoryKor", "학부모");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardPar");
            return "/admin/boardList";
        } else {
            return "/admin/adminMain";
        }
    }
    //게시글 삭제
    @GetMapping("boardDelete.do")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        String category = (String) request.getParameter("category");
        if(category.equals("free")){
            boardService.boardDelete(bno);
            boardService.commentDeleteAll(bno);
            return "redirect:boardList.do?category=free";
        } else if (category.equals("teacher")) {
            boardTeaService.boardDelete(bno);
            boardTeaService.commentDeleteAll(bno);
            return "redirect:boardList.do?category=teacher";
        } else if (category.equals("parent")) {
            boardParService.boardDelete(bno);
            boardParService.commentDeleteAll(bno);
            return "redirect:boardList.do?category=parent";
        } else {
            return "/admin/adminMain";
        }
    }

    //댓글 리스트
    @GetMapping("commentList.do")	// board/detail.do?bno=1
    public String getFreeCommentList(HttpServletRequest request, Model model) throws Exception {
        String category = (String) request.getParameter("category");
        if(category.equals("free")){
            List<Board> boardList = boardService.allCommentList();
            model.addAttribute("categoryKor", "자유");
            model.addAttribute("category", category); //한글 사용시 에러 나므로 영문값도 전달
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "board");
            return "/admin/commentList";
        } else if (category.equals("teacher")) {
            List<Board> boardList = boardTeaService.allCommentList();
            model.addAttribute("categoryKor", "선생님");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardTea");
            return "/admin/commentList";
        } else if (category.equals("parent")) {
            List<Board> boardList = boardParService.allCommentList();
            model.addAttribute("categoryKor", "학부모");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardPar");
            return "/admin/commentList";
        } else {
            return "/admin/adminMain";
        }
    }

    //게시판 댓글 삭제
    @GetMapping("CommentDelete.do")
    public String freeCommentDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        String category = (String) request.getParameter("category");
        if(category.equals("free")){
            boardService.boardDelete(bno);
            boardService.commentDeleteAll(bno);
            return "redirect:commentList.do?category=free";
        } else if (category.equals("teacher")) {
            boardTeaService.boardDelete(bno);
            boardTeaService.commentDeleteAll(bno);
            return "redirect:commentList.do?category=teacher";
        } else if (category.equals("parent")) {
            boardParService.boardDelete(bno);
            boardParService.commentDeleteAll(bno);
            return "redirect:commentList.do?category=parent";
        } else {
            return "/admin/adminMain";
        }
    }

    @GetMapping("boardReportList.do")
    public String getBoardReportList(HttpServletRequest request,Model model) throws Exception {
        String category = (String) request.getParameter("category");
        if(category.equals("free")){
            List<Board> boardList = boardService.boardReportList();
            model.addAttribute("categoryKor", "자유");
            model.addAttribute("category", category); //한글 사용시 에러 나므로 영문값도 전달
            model.addAttribute("boardCate", "board");
            model.addAttribute("boardList", boardList);
            return "/admin/boardReportList";
        } else if (category.equals("teacher")) {
            List<Board> boardList = boardTeaService.boardReportList();
            model.addAttribute("categoryKor", "선생님");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardTea");
                return "/admin/boardReportList";
        } else if (category.equals("parent")) {
            List<Board> boardList = boardParService.boardReportList();
            model.addAttribute("categoryKor", "학부모");
            model.addAttribute("category", category);
            model.addAttribute("boardList", boardList);
            model.addAttribute("boardCate", "boardPar");
            return "/admin/boardReportList";
        } else {
            return "/admin/adminMain";
        }

    }
    @GetMapping("boardReportDelete.do")
    public String boardReportDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        String category = (String) request.getParameter("category");
        if (category.equals("free")) {
            boardService.boardDelete(bno);
            boardService.commentDeleteAll(bno);
            return "redirect:boardReportList.do?category=free";
        } else if (category.equals("teacher")) {
            boardTeaService.boardDelete(bno);
            boardTeaService.commentDeleteAll(bno);
            return "redirect:boardReportList.do?category=teacher";
        } else if (category.equals("parent")) {
            boardParService.boardDelete(bno);
            boardParService.commentDeleteAll(bno);
            return "redirect:boardReportList.do?category=parent";
        } else {
            return "/admin/adminMain";
        }
    }

}
