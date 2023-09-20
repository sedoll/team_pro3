package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Grade;

import java.util.List;

public interface GradeService {
    public List<Grade> gradeList() throws Exception;
    public Grade gradeDetail(int no) throws Exception;
    public void gradeInsert(Grade grade) throws Exception;
    public void gradeDelete(int no) throws Exception;
    public void gradeEdit(Grade grade) throws Exception;
    public void totGrade(String sname) throws Exception;
    public void avgGrade(String sname) throws Exception;
}
