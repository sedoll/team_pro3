package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.QnaDAO;
import kr.co.teaspoon.dto.Qna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

    @Autowired
    private QnaDAO qnaDAO;

    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Qna> qnaList() throws Exception {
        return qnaDAO.qnaList();
    }

    @Override
    public Qna qnaDetail(int bno) throws Exception {
        return qnaDAO.qnaDetail(bno);
    }

    @Override
    public void qnaInsert(Qna dto) throws Exception {
        qnaDAO.qnaInsert(dto);
    }

    @Override
    public void qnaDelete(int bno) throws Exception {
        qnaDAO.qnaDelete(bno);
    }

    @Override
    public void qnaEdit(Qna dto) throws Exception {
        qnaDAO.qnaEdit(dto);
    }

    @Override
    public void commentInsert(Qna dto) throws Exception {
        qnaDAO.commentInsert(dto);
    }

    @Override
    public List<Qna> commentList(int bno) throws Exception {
        return qnaDAO.commentList(bno);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        qnaDAO.commentDeleteAll(bno);
    }

    @Override
    public boolean check(int bno, String pw) throws Exception {
        boolean comp = false;
        Qna qna = qnaDAO.qnaDetail(bno);
        boolean check = pwEncoder.matches(pw, qna.getPw()); // 입력된 비밀번호와 db의 암호화된 비밀번호 비교
        if(qna != null && check) {
            comp = true;
        }
        return comp;
    }
}
