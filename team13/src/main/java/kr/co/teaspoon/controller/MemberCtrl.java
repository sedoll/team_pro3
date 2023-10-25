package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardlistVO;
import kr.co.teaspoon.dto.CommentlistVO;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/member/*")
public class MemberCtrl {
    @Autowired
    private MemberService memberService; // 서비스 생성

    @Autowired
    HttpSession session; // 세션 생성

    @Autowired
    JavaMailSender mailSender;

    // spring security 이용
    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    //로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/loginForm";
    }

    // 로그인 시도
    @PostMapping("signin.do")
    public String signIn(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        boolean check = memberService.loginCheck(id, pw);
        if (check) { // 로그인 성공
            Member mem = new Member();
            mem = memberService.getMember(id);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 성공');</script>");
            out.flush();
            session.setAttribute("sid", id);
            session.setAttribute("job", mem.getJob());
            System.out.println(mem.getJob());
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
    public String logout(HttpServletResponse response,Model model) throws Exception {
        session.invalidate();

        //ScriptAlertUtils.alert(response,"로그아웃 되었습니다");

        model.addAttribute("msg", "로그아웃 되었습니다");
        model.addAttribute("url", "/");

        return "/include/redirect";
    }

    /*회원목록*/
    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }

    // 관리자 회원 상세
    @GetMapping("detail.do")    // board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberDetail";
    }


    //회원 가입 - 학부모 , 선생 선택
    @GetMapping("term.do")
    public String getAgree(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        return "/member/term";
    }

    //회원 가입 - 회원가입폼 페이지 로딩
    @PostMapping("join.do")
    public String getJoin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String job = request.getParameter("job");
        model.addAttribute("job", job);
        return "/member/join";
    }

    //회원 가입 - Ajax로 아이디 중복 체크
    @RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member mem = memberService.getMember(id);
        boolean result = false;
        if (mem != null) {
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
    @RequestMapping(value = "insert.do", method = RequestMethod.POST)
    public String memberWrite(HttpServletResponse response, Member member, Model model) throws Exception {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        model.addAttribute("msg", "완료되었습니다.");
        model.addAttribute("url", "/");
        return "/include/redirect";

    }

    // 마이페이지 메인
    @GetMapping("mypage.do")
    public String mypage(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/myPage/myPageindex";
    }


    /*회원 정보 수정*/
    @GetMapping("update.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        System.out.println(member.toString());
        return "/member/myPage/memberUpdate";
    }

    @PostMapping("update.do")
    public String memberEdit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String postcode = request.getParameter("postcode");
        String birth = request.getParameter("birth");


        Member member = new Member();

        member.setId(id);
        member.setPw(pw);
        member.setName(name);
        member.setEmail(email);
        member.setTel(tel);
        member.setAddr1(addr1);
        member.setAddr2(addr2);
        member.setPostcode(postcode);
        member.setBirth(birth);

        memberService.memberUpdate(member);
        model.addAttribute("member", member);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원님의 정보가 수정되었습니다.');</script>");
        out.flush();

        return "/member/myPage/memberUpdate";
    }

/*    @RequestMapping(value = "update.do", method = RequestMethod.POST)
    public String memberUpdate(Member member,Model model) throws Exception{
        String pwd ="";
        if(member.getPw().length() <= 16){
            pwd = pwEncoder.encode(member.getPw());
            member.setPw(pwd);
        }
        memberService.memberUpdate(member);
        return "redirect:list.do";
    }*/


    // 회원 탈퇴 전 비밀번호 입력 로딩
    @GetMapping("delete.do")
    public String pwCheckForm(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        //memberService.memberDelete(id);
        return "/member/myPage/memberDelete";
    }


    //회원 탈퇴 - Ajax로 비밀번호 일치 체크
    @RequestMapping(value = "pwCheck.do", method = RequestMethod.POST)
    public void pwCheck(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletResponse response, Model model) throws Exception {

        Member mem = memberService.getMember(id);
        boolean result = false;

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (encoder.matches(pw, mem.getPw())) {//넘겨받은 비밀번호와 user객체에 암호화된 비밀번호와 비교
            result = true;
        } else {
            result = false;
        }

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }


    //회원 탈퇴 전 숙지사항 폼뷰
    @RequestMapping("withdrawForm.do")
    public String withdrawForm(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        //memberService.memberDelete(id);
        return "/member/myPage/withdraw";
    }

    //회원 탈퇴 처리
    @GetMapping("withdraw.do")
    public String memberdelete(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        session.invalidate();

        model.addAttribute("msg", "회원 탈퇴가 처리되었습니다");
        model.addAttribute("url", "/");
        return "/include/redirect";
    }


    /*내가 쓴 글*/
    @RequestMapping(value = "/writtenList.do")
    public String writtenList(HttpSession session, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        System.out.println("id:  " + id);

        Member member = memberService.getMember(id);
        model.addAttribute("member", member);

        /*자유게시판*/
        List<BoardlistVO> boardlist = memberService.getWriteList1(id);
        if (boardlist != null) {
            model.addAttribute("boardlist", boardlist);
            System.out.println(boardlist.toString());
        }

        /*선생님 게시판*/
        List<BoardlistVO> boardtealist = memberService.getWriteList2(id);
        if (boardtealist != null) {
            model.addAttribute("boardtealist", boardtealist);
        }

        /*학부모 게시판*/
        List<BoardlistVO> boardparlist = memberService.getWriteList3(id);
        if (boardparlist != null) {
            model.addAttribute("boardparlist", boardparlist);
        }

//        /* 자료실 */
//        List<BoardlistVO> boardfreelist = memberService.getWriteList4(id);
//        if (boardfreelist != null) {
//            model.addAttribute("boardfreelist", boardfreelist);
//        }


        /* 자유게시판 댓글 */
        List<CommentlistVO> board_comlist = memberService.getWriteComment1(id);
        if (board_comlist != null) {
            model.addAttribute("board_comlist", board_comlist);
        }

        /*  List<CommentlistVO> c_listfd = memberService.getWriteComment2(id);
        if(c_listfd != null ) {
            model.addAttribute("c_listfd", c_listfd);
        }

        List<CommentlistVO> c_listfa = memberService.getWriteComment3(id);
        if(c_listfa != null ) {
            model.addAttribute("c_listfa", c_listfa);
        }

        List<CommentlistVO> c_listah = memberService.getWriteComment4(id);
        if(c_listah != null ) {
            model.addAttribute("c_listah", c_listah);
        }
        List<BoardlistVO> b_listco = memberService.getWriteList5(id);
        if(b_listco != null ) {
            model.addAttribute("b_listco", b_listco);
        }
        List<CommentlistVO> c_listco = memberService.getWriteComment5(id);
        if(c_listco != null ) {
            model.addAttribute("c_listco", c_listco);
        }
        List<BoardlistVO> b_listp = memberService.getWriteList6(id);
        if(b_listp != null ) {
            model.addAttribute("b_listp", b_listp);
        }
        List<CommentlistVO> c_listp = memberService.getWriteComment6(id);
        if(c_listp != null ) {
            model.addAttribute("c_listp", c_listp);
        }
        List<BoardlistVO> b_listm = memberService.getWriteList7(id);
        if(b_listm != null ) {
            model.addAttribute("b_listm", b_listm);
        }
        List<CommentlistVO> c_listm = memberService.getWriteComment7(id);
        if(c_listm != null ) {
            model.addAttribute("c_listm", c_listm);
        }*/

        return "/member/myPage/memberWritten2";

    }

    @RequestMapping(value = "/pw_find.do", method = RequestMethod.GET)
    public String pw_find() {
        return "/member/pw_find";
    }

    //메일 보내기
    @RequestMapping(value = "/pw_auth.do")
    public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = (String) request.getParameter("email");
        String name = (String) request.getParameter("name");

        Member mem = memberService.selectMember(email);
        System.out.println(mem);

        if (mem != null) {
            Random r = new Random();
            int num = r.nextInt(999999); // 랜덤난수설정

            if (mem.getName().equals(name)) {
                session.setAttribute("email", mem.getEmail());

                String setfrom = "spospotv@naver.com"; // naver
                String tomail = email; //받는사람
                String title = "[티스푼] 비밀번호변경 인증 이메일 입니다";
                String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
                        + "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); //

                try {
                    MimeMessage message = mailSender.createMimeMessage();
                    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

                    messageHelper.setFrom(setfrom);
                    messageHelper.setTo(tomail);
                    messageHelper.setSubject(title);
                    messageHelper.setText(content);

                    mailSender.send(message);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

                ModelAndView mv = new ModelAndView();
                mv.setViewName("/member/pw_auth");
                mv.addObject("num", num);
                return mv;
            } else {
                ModelAndView mv = new ModelAndView();
                mv.setViewName("/member/pw_find");
                return mv;
            }
        } else {
            ModelAndView mv = new ModelAndView();
            mv.setViewName("/member/pw_find");
            return mv;
        }

    }

    //이메일 인증번호 확인
    @RequestMapping(value = "/pw_set.do", method = RequestMethod.POST)
    public String pw_set(@RequestParam(value = "email_injeung") String email_injeung,
                         @RequestParam(value = "num") String num, Model model, HttpServletResponse response) throws Exception {

        if (email_injeung.equals(num)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('인증번호가 일치합니다.');</script>");
            out.flush();
            return "/member/pw_new";

        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('인증번호가 다릅니다. 다시 입력해주세요.');</script>");
            out.flush();
            return "/member/pw_auth";

        }

    }

    //비밀번호 재설정
    @RequestMapping(value = "/pw_new.do", method = RequestMethod.POST)
    public String pw_new(Member member, HttpSession session, HttpServletResponse response, Model model) throws Exception {
        System.out.println("session email : " + session.getAttribute("email"));
        System.out.println("pw : " + member.getPw());

        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);

        int result = memberService.pwUpdate(member);

        if (result == 1) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호가 재설정 되었습니다.');</script>");
            out.flush();

            return "/member/loginForm";

        } else {
            System.out.println("pw_update" + result);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호가 다릅니다. 다시 입력해주세요.');</script>");
            out.flush();


            return "/member/pw_new";
        }
    }



    @GetMapping("/signUpConfirm.me")
    public ModelAndView signUpConfirm(@RequestParam HashMap<String, Integer> map, ModelAndView mav) throws Exception {
        //email, authKey 가 일치할경우 authStatus 업데이트
        System.out.println("connection  email :" + map.get("email"));
        System.out.println("connection  authkey :" + map.get("authkey"));
        memberService.updateAuthStatus(map);
        System.out.println("connection  email2 :" + map.get("email"));
        mav.addObject("display", "/member/loginForm");
        mav.setViewName("/member/loginForm");
        return mav;
    }







    //신고한 게시글 목록
    @GetMapping("myReportList.do")
    public String myReportList(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        List<Board> boardList = memberService.myReportList(id);
        model.addAttribute("boardList", boardList);
        System.out.println(boardList.toString());
        return "/member/myPage/myReportList";
    }
    @GetMapping("myReportCancel.do")
    public String myReportCancel(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        int bno = Integer.parseInt(request.getParameter("bno"));
        String category = request.getParameter("category");

        if (category.equals("board")) {
            memberService.boardReportCancel(bno);
            return "redirect:myReportList.do";
        } else if (category.equals("boardTea")) {
            memberService.teaReportCancel(bno);
            return "redirect:myReportList.do";
        } else if (category.equals("boardPar")) {
            memberService.parReportCancel(bno);
            return "redirect:myReportList.do";
        } else {
            return "redirect:myReportList.do";
        }

    }

}
