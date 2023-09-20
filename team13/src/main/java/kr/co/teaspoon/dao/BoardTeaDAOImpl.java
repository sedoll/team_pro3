package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardTeaDAOImpl implements BoardDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList() throws Exception {
        return sqlSession.selectList("boardTea.boardList");
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        sqlSession.update("board.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("boardTea.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("boardTea.boardInsert", dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("boardTea.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("boardTea.boardEdit", dto);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        sqlSession.insert("boardTea.commentInsert", dto);
    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return sqlSession.selectList("boardTea.commentList", bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        sqlSession.delete("boardTea.commentDeleteAll", bno);
    }
}
