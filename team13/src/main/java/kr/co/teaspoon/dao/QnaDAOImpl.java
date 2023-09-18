package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Qna;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QnaDAOImpl implements QnaDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Qna> qnaList() throws Exception {
        return sqlSession.selectList("qna.qnaList");
    }

    @Override
    public Qna qnaDetail(int bno) throws Exception {
        sqlSession.update("qna.countUp", bno);
        return sqlSession.selectOne("qna.qnaDetail", bno);
    }

    @Override
    public void qnaInsert(Qna dto) throws Exception {
        sqlSession.insert("qna.qnaInsert", dto);
    }

    @Override
    public void qnaDelete(int bno) throws Exception {
        sqlSession.delete("qna.qnaDelete", bno);
    }

    @Override
    public void qnaEdit(Qna dto) throws Exception {
        sqlSession.update("qna.qnaEdit", dto);
    }

    @Override
    public void commentInsert(Qna dto) throws Exception {
        sqlSession.insert("qna.commentInsert", dto);
    }

    @Override
    public List<Qna> commentList(int bno) throws Exception {
        return sqlSession.selectList("qna.commentList", bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        sqlSession.delete("qna.commentDeleteAll", bno);
    }
}
