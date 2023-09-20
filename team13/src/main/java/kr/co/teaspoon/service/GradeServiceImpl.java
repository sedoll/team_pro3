package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.GradeDAOImpl;
import kr.co.teaspoon.dto.Grade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService{
    @Autowired
    private GradeDAOImpl gradeDAO;

    @Override
    public List<Grade> gradeList() throws Exception {
        return gradeDAO.gradeList();
    }

    @Override
    public Grade gradeDetail(int no) throws Exception {
        return gradeDAO.gradeDetail(no);
    }

    @Override
    public void gradeInsert(Grade grade) throws Exception {
        gradeDAO.gradeInsert(grade);
    }

    @Override
    public void gradeDelete(int no) throws Exception {
        gradeDAO.gradeDelete(no);
    }

    @Override
    public void gradeEdit(Grade grade) throws Exception {
        gradeDAO.gradeEdit(grade);
    }

    @Override
    public void totGrade(String sname) throws Exception {
        gradeDAO.totGrade(sname);
    }

    @Override
    public void avgGrade(String sname) throws Exception {
        gradeDAO.avgGrade(sname);
    }
}
