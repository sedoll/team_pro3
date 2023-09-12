package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Sample;
import kr.co.teaspoon.service.SampleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/sample2/*")
public class SampleCtrl2 {
    private static final Logger logger = LoggerFactory.getLogger(SampleCtrl2.class);

    @Autowired
    private SampleService sampleService;

    @RequestMapping("list.do")
    public String sampleList(Model model) throws Exception {
        List<Sample> samList = sampleService.sampleList();
        model.addAttribute("sampleList", samList);
        return "/sample2/sampleList";
    }
}
