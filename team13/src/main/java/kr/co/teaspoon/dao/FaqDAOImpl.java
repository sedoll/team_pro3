package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Faq;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FaqDAOImpl implements FaqDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Faq> faqList() throws Exception {
        return sqlSession.selectList("faq.faqList");
    }
}
