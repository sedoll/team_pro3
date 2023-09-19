package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Qna;

import java.util.List;

public interface QnaService {
    public List<Qna> qnaList() throws Exception;
    public Qna qnaDetail(int bno) throws Exception;
    public void qnaInsert(Qna dto) throws Exception;
    public void qnaDelete(int bno) throws Exception;
    public void qnaEdit(Qna dto) throws Exception;
    public void commentInsert(Qna dto) throws Exception;
    public List<Qna> commentList(int bno) throws Exception;
    public void commentDeleteAll(int bno) throws Exception;
    public boolean check(int bno, String pw) throws Exception;
}
