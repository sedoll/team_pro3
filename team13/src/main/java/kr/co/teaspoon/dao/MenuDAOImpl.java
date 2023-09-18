package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Menu;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public Menu getMenu(String sc_name) {
        return sqlSession.selectOne("menu.getSchool", "%"+sc_name+"%");
    }
}
