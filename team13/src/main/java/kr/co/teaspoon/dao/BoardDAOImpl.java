package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Report;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDAOImpl implements BoardDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList() throws Exception {
        return sqlSession.selectList("board.boardList");
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        sqlSession.update("board.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("board.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("board.boardInsert", dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("board.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("board.boardEdit", dto);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        sqlSession.insert("board.commentInsert", dto);
    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return sqlSession.selectList("board.commentList", bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        sqlSession.delete("board.commentDeleteAll", bno);
    }
    @Override
    public List<Board> allCommentList() throws Exception {
        return sqlSession.selectList("board.allCommentList");
    }
    @Override
    public void reportBoard(Report report) throws Exception {
        sqlSession.insert("board.reportBoard", report);
    }

    @Override
    public int checkReported(Report report) throws Exception {
        return sqlSession.selectOne("board.checkReported",report);
    }

    @Override
    public List<Board> boardReportList() throws Exception {
        return sqlSession.selectList("board.boardReportList");
    }

    @Override
    public List<Board> recentReportList() throws Exception {
        return sqlSession.selectList("board.recentReportList");
    }
}
