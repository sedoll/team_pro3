package kr.co.teaspoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

// 메인페이지 이동
@Controller
public class HomeCtrl {
    // http:localhost:8081/pro03_war -> / -> /WEB-INF/views/index.jsp
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Locale locale, Model model) {
        return "/index";
    }
}
