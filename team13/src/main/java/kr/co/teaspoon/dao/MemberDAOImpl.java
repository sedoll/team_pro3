package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAOImpl implements MemberDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Member> memberList() throws Exception {
        return sqlSession.selectList("member.memberList");
    }

    @Override
    public Member getMember(String id) throws Exception {
        return sqlSession.selectOne("member.getMember", id);
    }

    @Override
    public int memberCount() throws Exception {
        return sqlSession.selectOne("member.memberCount");
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        sqlSession.insert("member.memberInsert", member);
    }

    @Override
    public void memberUpdate(Member member) throws Exception {
        sqlSession.update("member.memberUpdate", member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        sqlSession.delete("member.memberDelete", id);
    }

    @Override
    public Member signIn(String id) throws Exception {
        return sqlSession.selectOne("member.signIn", id);
    }

    @Override
    public Member loginCheck(String id) throws Exception {
        return sqlSession.selectOne("member.loginCheck", id);
    }

    @Override
    public Member login(String id) throws Exception {
        return sqlSession.selectOne("member.login", id);
    }
}
