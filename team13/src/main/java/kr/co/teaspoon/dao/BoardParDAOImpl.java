package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardParDAOImpl implements BoardDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList() throws Exception {
        return sqlSession.selectList("boardPar.boardList");
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        sqlSession.update("board.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("boardPar.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("boardPar.boardInsert", dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("boardPar.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("boardPar.boardEdit", dto);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        sqlSession.insert("boardPar.commentInsert", dto);
    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return sqlSession.selectList("boardPar.commentList", bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        sqlSession.delete("boardPar.commentDeleteAll", bno);
    }
}
