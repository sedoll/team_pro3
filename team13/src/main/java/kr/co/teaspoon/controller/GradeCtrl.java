package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Grade;
import kr.co.teaspoon.dto.Infomation;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.GradeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

// /grade/gradeList.do
@Controller
@RequestMapping("/grade/*")
public class GradeCtrl {
    @Autowired
    private GradeServiceImpl gradeService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")
    public String gradeList(HttpServletResponse response, HttpServletRequest request ,Model model) throws Exception {
        System.out.println("버튼 클릭");

        if(session.getAttribute("sid") != null && !"".equals(session.getAttribute("sid"))) {
            List<Grade> gradeList = gradeService.gradeList();
            model.addAttribute("gradeList", gradeList);
            model.addAttribute("sid",(String)session.getAttribute("sid"));
            System.out.println("gradeList : "+gradeList.toString());
            return "/grade/gradeList";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 페이지는 회원만 접근 가능합니다.');</script>");
            out.flush();
            return "/index";
        }
    }

    @GetMapping("gradedetail.do")	//info/detail.do?bno=1
    public String gradeDetail(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        Grade grade = gradeService.gradeDetail(no);
        model.addAttribute("grade", grade);
        return "/grade/gradeDetail";
    }

    @GetMapping("gradeinsert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/grade/gradeInsert";
    }

    @PostMapping("gradeinsert.do")
    public String gradeInsert(HttpServletRequest request, Model model) throws Exception {
        Grade grade = new Grade();
        //grade.setNo(Integer.parseInt(request.getParameter("no")));
        grade.setSname(request.getParameter("sname"));
        grade.setPid(request.getParameter("pid"));
        grade.setKor(Integer.parseInt(request.getParameter("kor")));
        grade.setMath(Integer.parseInt(request.getParameter("math")));
        grade.setEng(Integer.parseInt(request.getParameter("eng")));
        grade.setSocial(Integer.parseInt(request.getParameter("social")));
        grade.setScience(Integer.parseInt(request.getParameter("science")));
        grade.setExam(request.getParameter("exam"));
        grade.setTname(request.getParameter("tname"));
        String id = (String) session.getAttribute("sid");
        System.out.println(id);
        grade.setTid(id);
        System.out.println(grade.toString());
        gradeService.gradeInsert(grade);
        return "redirect:list.do";
    }

    @GetMapping("gradedelete.do")
    public String gradeDelete(HttpServletRequest request, Model model) throws Exception {
    int no = Integer.parseInt(request.getParameter("no"));
        gradeService.gradeDelete(no);
        return "redirect:list.do";
    }

    @GetMapping("gradeedit.do")
    public String updateForm(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        Grade grade = gradeService.gradeDetail(no);
        model.addAttribute("grade", grade);
        return "/grade/gradeEdit";
    }

    @PostMapping("gradeedit.do")
    public String gradeEdit(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        Grade grade = new Grade();
        grade.setExam(request.getParameter("exam"));
        grade.setKor(Integer.parseInt(request.getParameter("kor")));
        grade.setMath(Integer.parseInt(request.getParameter("math")));
        grade.setEng(Integer.parseInt(request.getParameter("eng")));
        grade.setSocial(Integer.parseInt(request.getParameter("social")));
        grade.setScience(Integer.parseInt(request.getParameter("science")));
        grade.setNo(no);
        gradeService.gradeEdit(grade);
        return "redirect:list.do";
    }

}
