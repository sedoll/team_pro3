package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.BoardParDAOImpl;
import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardParServiceImpl implements BoardService{

    @Autowired
    private BoardParDAOImpl boardDAO;

    @Override
    public List<Board> boardList() throws Exception {
        return boardDAO.boardList();
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardDAO.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardDAO.boardInsert(dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardDAO.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardDAO.boardEdit(dto);
    }

    @Override
    public void countUp(int bno) throws Exception {

    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return boardDAO.commentList(bno);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        boardDAO.commentInsert(dto);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        boardDAO.commentDeleteAll(bno);
    }
    @Override
    public List<Board> allCommentList() throws Exception {
        return boardDAO.allCommentList();
    }
    @Override
    public void reportBoard(Report report) throws Exception {
        boardDAO.reportBoard(report);
    }

    @Override
    public int checkReported(Report report) throws Exception {
        return boardDAO.checkReported(report);
    }
    @Override
    public List<Board> boardReportList() throws Exception {
        return boardDAO.boardReportList();
    }
    @Override
    public List<Board> recentReportList() throws Exception {
        return boardDAO.recentReportList();
    }
}
