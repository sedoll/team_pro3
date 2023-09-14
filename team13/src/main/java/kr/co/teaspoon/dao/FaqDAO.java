package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Faq;

import java.util.List;

public interface FaqDAO {
    public List<Faq> faqList() throws Exception;
}
