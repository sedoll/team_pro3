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

@Controller
@RequestMapping("/grade/*")
public class GradeCtrl {
    @Autowired
    private GradeServiceImpl gradeService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("gradelist.do")
    public String gradeList(HttpServletResponse response, HttpServletRequest request ,Model model) throws Exception {
        if(session.getAttribute("sid") != null && !"".equals(session.getAttribute("sid"))) {
            List<Grade> gradeList = gradeService.gradeList();
            model.addAttribute("gradeList", gradeList);
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
        String sname = request.getParameter("sname");
        Grade grade = gradeService.gradeDetail(sname);
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
        gradeService.gradeInsert(grade);
        return "redirect:gradelist.do";
    }

    @GetMapping("gradedelete.do")
    public String gradeDelete(HttpServletRequest request, Model model) throws Exception {
    int no = Integer.parseInt(request.getParameter("no"));
        gradeService.gradeDelete(no);
        return "redirect:gradelist.do";
    }

    @GetMapping("gradeedit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        String sname = request.getParameter("sname");
        Grade grade = gradeService.gradeDetail(sname);
        model.addAttribute("grade", grade);
        return "/grade/gradeEdit";
    }

    @PostMapping("gradeedit.do")
    public String gradeEdit(HttpServletRequest request, Model model) throws Exception {
        String sname = request.getParameter("sname");
        Grade grade = new Grade();
        grade.setSname(sname);
        grade.setKor(Integer.parseInt(request.getParameter("kor")));
        grade.setMath(Integer.parseInt(request.getParameter("math")));
        grade.setEng(Integer.parseInt(request.getParameter("eng")));
        grade.setSocial(Integer.parseInt(request.getParameter("social")));
        grade.setScience(Integer.parseInt(request.getParameter("science")));
        grade.setExam(request.getParameter("exam"));
        gradeService.gradeEdit(grade);
        return "redirect:gradelist.do";
    }

}
