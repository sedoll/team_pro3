package kr.co.teaspoon.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;

@Controller
@RequestMapping("/news/*")
public class NewsCtrl {

    @GetMapping("list.do")
    public String startCrawl(Model model) throws IOException {
        return "/news/newsList";
    }

    @PostMapping("list.do")
    public String Crawl(HttpServletRequest request, Model model) {
        ArrayList<String> titleList = new ArrayList<>(); // 제목
        ArrayList<String> hrefList = new ArrayList<>(); // 상세 링크
        ArrayList<String> companyList = new ArrayList<>(); // 언론사
        ArrayList<String> textList = new ArrayList<>(); // 내용

        String search = request.getParameter("search");

        try {
            // 웹 페이지 URL
            String url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query="+search;

            // 웹 페이지를 가져옴
            Document document = Jsoup.connect(url).get();

            // .bx 클래스에 해당하는 요소를 선택
            Elements bxElements = document.select(".bx");

            // .bx 요소 순회
            for (Element bxElement : bxElements) {
                // .news_tit 요소 추출
                Element newsTitElement = bxElement.selectFirst(".news_tit");
                if (newsTitElement != null) {
                    // 텍스트 출력
                    String title = newsTitElement.text();
                    System.out.println("News Title: " + title);
                    titleList.add(title);

                    // <a> 태그 추출
                    Element aTagElement = newsTitElement.selectFirst("a");
                    if (aTagElement != null) {
                        // href 속성값 출력
                        String hrefValue = aTagElement.attr("href");
                        System.out.println("Href Value: " + hrefValue);
                        hrefList.add(hrefValue);
                    }
                }

                // .info.press 추출
                Element infoPressElement = bxElement.selectFirst(".info.press");
                if (infoPressElement != null) {
                    String company =  infoPressElement.text();
                    System.out.println("Info Press: " + company);
                    companyList.add(company);
                }

                // .api_txt_lines 추출
                Element apiTxtLinesElement = bxElement.selectFirst(".api_txt_lines");
                if (apiTxtLinesElement != null) {
                    String text = apiTxtLinesElement.text();
                    System.out.println("API Text Lines: " + text);
                    textList.add(text);
                }
                // 각 .bx 요소 사이에 구분선 추가
                System.out.println("----------------------------------");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("newsName", search);
        model.addAttribute("titleList", titleList);
        model.addAttribute("urlList", hrefList);
        model.addAttribute("companyList", companyList);
        model.addAttribute("textList", textList);
        return "/news/newsList";
    }
}