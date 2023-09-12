package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.json.JSONObject;
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
@RequestMapping("/member/*")
public class MemberCtrl {
    @Autowired
    private MemberService memberService; // 서비스 생성

    @Autowired
    HttpSession session; // 세션 생성

    // spring security 이용
    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }
    
    // 관리자 회원 상세
    @GetMapping("detail.do")	// board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberDetail";
    }
    
    // 마이페이지
    @GetMapping("mypage.do")
    public String mypage(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

    //회원정보 변경
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String memberUpdate(Member mem, Model model) throws Exception {
        String pwd = "";
        if(mem.getPw().length()<=16) {
            pwd = pwEncoder.encode(mem.getPw());
            mem.setPw(pwd);
        }
        System.out.println(mem.toString());
        memberService.memberUpdate(mem);
        return "redirect:/";
    }


    //회원 가입 - 약관 동의 페이지 로딩
    @GetMapping("term.do")
    public String getAgree(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        return "/member/term";
    }
    //회원 가입 - 회원가입폼 페이지 로딩
    @PostMapping("join.do")
    public String getJoin(HttpServletRequest request, Model model) throws Exception {
        String job = request.getParameter("job");
        model.addAttribute("job", job);
        return "/member/join";
    }
    //회원 가입 - Ajax로 아이디 중복 체크
    @RequestMapping(value="idCheck.do", method=RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member mem = memberService.getMember(id);
        boolean result = false;
        if(mem!=null){
            result = false;
        } else {
            result = true;
        }

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    //회원 가입 - 회원 가입 처리
    @RequestMapping(value="insert.do", method = RequestMethod.POST)
    public String memberWrite(Member member, Model model) throws Exception {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        return "redirect:/";
    }

    // 회원 탈퇴, 강퇴
    @GetMapping("delete.do")
    public String memberDelete(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        return "/member/memberList";
    }

    //로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/loginForm";
    }
    
    // 로그인 시도
    @PostMapping("signin.do")
    public String signIn(HttpServletResponse response, HttpServletRequest request,Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        boolean check = memberService.loginCheck(id, pw);
        if(check) { // 로그인 성공
            Member mem = new Member();
            mem = memberService.getMember(id);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 성공');</script>");
            out.flush();
            session.setAttribute("sid", id);
            session.setAttribute("job", mem.getJob());
            return "/index";
        } else { // 로그인 실패
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 실패');</script>");
            out.flush();
            return "/member/loginForm";
        }
    }
    
    // 로그아웃
    @GetMapping("logout.do")
    public String logout() throws Exception {
        session.invalidate();
        return "/index";
    }

}
