package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Menu;
import kr.co.teaspoon.service.MenuServiceImpl;
import kr.co.teaspoon.service.MenuServiceImpl2;
import kr.co.teaspoon.util.Week;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/menu/*")
public class MenuCtrl {
    @Autowired
    private MenuServiceImpl menuService;

    @Autowired
    private MenuServiceImpl2 menuService2;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")		// board/list.do
    public String boardList(Model model) throws Exception {
        return "/menu/menuList";
    }

    @PostMapping("list.do")		// board/list.do
    public String getBoardList(HttpServletRequest request, Model model) {
        try {
            String sc_name = request.getParameter("name");
            System.out.println(sc_name);
            Menu dto = menuService2.getMenu(sc_name);
            System.out.println(dto.toString());

            List<String> ddishList; // 식단
            List<String> mlsvList; // 날짜
            List<String> orplcList; // 원산지
            List<String> calList; // 칼로리
            List<String> ntrList; // 영양

            Week week = new Week();

            List<String> date = week.getDate();

            String codeS = dto.getSc_code();
            String codeK = dto.getEo_code();
            String schoolName = dto.getSc_name();

            int minValue = 1;
            int maxValue = 5;

            menuService.menuServiceSet(codeS, codeK, date, minValue, maxValue);
            ddishList = menuService.getDdishList();
            mlsvList = menuService.getMlsvList();
            orplcList = menuService.getOrplcList();
            calList = menuService.getCalList();
            ntrList = menuService.getNtrList();

            model.addAttribute("schoolName", schoolName);
            model.addAttribute("ddishList", ddishList);
            model.addAttribute("mlsvList", mlsvList);
            model.addAttribute("orplcList", orplcList);
            model.addAttribute("calList", calList);
            model.addAttribute("ntrList", ntrList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "/menu/menuList";
        }
    }
}
