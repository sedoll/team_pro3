package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Infomation;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InfoUniDAOImpl implements InfoDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Infomation> infoList() throws Exception {
        return sqlSession.selectList("infoUni.infoList");
    }

    @Override
    public Infomation infoDetail(int bno) throws Exception {
        sqlSession.update("infoUni.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("infoUni.infoDetail", bno);
    }

    @Override
    public void infoInsert(Infomation dto) throws Exception {
        sqlSession.insert("infoUni.infoInsert", dto);
    }

    @Override
    public void infoDelete(int bno) throws Exception {
        sqlSession.delete("infoUni.infoDelete", bno);
    }

    @Override
    public void infoEdit(Infomation dto) throws Exception {
        sqlSession.update("infoUni.infoEdit", dto);
    }
}
