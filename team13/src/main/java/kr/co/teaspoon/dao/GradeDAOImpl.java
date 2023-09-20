package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Grade;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GradeDAOImpl implements GradeDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Grade> gradeList() throws Exception {
        return sqlSession.selectList("grade.gradeList");
    }

    @Override
    public Grade gradeDetail(int no) throws Exception {
        return sqlSession.selectOne("grade.gradeDetail", no);
    }

    @Override
    public void gradeInsert(Grade grade) throws Exception {
        sqlSession.insert("grade.gradeInsert", grade);
    }

    @Override
    public void gradeDelete(int no) throws Exception {
        sqlSession.delete("grade.gradeDelete", no);
    }

    @Override
    public void gradeEdit(Grade grade) throws Exception {
        sqlSession.update("grade.gradeEdit", grade);
    }

    @Override
    public void totGrade(String sname) throws Exception {
        sqlSession.selectOne("grade.totGrade", sname);
    }

    @Override
    public void avgGrade(String sname) throws Exception {
        sqlSession.selectOne("grade.avgGrade", sname);
    }
}
