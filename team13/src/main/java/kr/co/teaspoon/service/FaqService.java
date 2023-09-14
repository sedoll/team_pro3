package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Faq;

import java.util.List;

public interface FaqService {
    public List<Faq> faqList() throws Exception;
}