package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Board;

import java.util.List;

public interface BoardService {
    public List<Board> boardList() throws Exception;
    public Board boardDetail(int bno) throws Exception;
    public void boardInsert(Board dto) throws Exception;
    public void boardDelete(int bno) throws Exception;
    public void boardEdit(Board dto) throws Exception;
    public void countUp(int bno) throws Exception;
    public List<Board> commentList(int bno) throws Exception;
    public void commentInsert(Board dto) throws Exception;
    public void commentDeleteAll(int bno) throws Exception;
}
