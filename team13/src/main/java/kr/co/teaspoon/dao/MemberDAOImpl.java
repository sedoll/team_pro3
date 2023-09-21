package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardlistVO;
import kr.co.teaspoon.dto.CommentlistVO;
import kr.co.teaspoon.dto.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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



    /*내가 쓴 글*/


    @Override
    public List<BoardlistVO> getWriteList(String id) {
        return sqlSession.selectList("member.getWriteList" , id);
    }

    @Override
    public List<CommentlistVO> getWriteComment(String id) {
        return sqlSession.selectList("getWriteComment", id);
    }


    /*자유게시판*/
    @Override
    public List<BoardlistVO> getWriteList1(String id) {
        return sqlSession.selectList("member.getWriteList1" , id);
    }
    /*선생님 게시판*/
    @Override
    public List<BoardlistVO> getWriteList2(String id) {
        return sqlSession.selectList("member.getWriteList2", id);
    }
    /*학부모*/
    @Override
    public List<BoardlistVO> getWriteList3(String id) {
        return sqlSession.selectList("member.getWriteList3", id);
    }
    @Override
    public List<BoardlistVO> getWriteList4(String id) {
        return sqlSession.selectList("member.getWriteList4", id);
    }
    @Override
    public List<BoardlistVO> getWriteList5(String id) {
        return sqlSession.selectList("member.getWriteList5", id);
    }
    @Override
    public List<BoardlistVO> getWriteList6(String id) {
        return sqlSession.selectList("member.getWriteList6", id);
    }
    @Override
    public List<BoardlistVO> getWriteList7(String id) {
        return sqlSession.selectList("member.getWriteList7", id);
    }

    /*자유게시판 댓글*/
    @Override
    public List<CommentlistVO> getWriteComment1(String id) {
        return sqlSession.selectList("getWriteComment1", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment2(String id) {
        return sqlSession.selectList("getWriteComment2", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment3(String id) {
        return sqlSession.selectList("getWriteComment3", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment4(String id) {
        return sqlSession.selectList("getWriteComment4", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment5(String id) {
        return sqlSession.selectList("getWriteComment5", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment6(String id) {
        return sqlSession.selectList("getWriteComment6", id);
    }
    @Override
    public List<CommentlistVO> getWriteComment7(String id) {
        return sqlSession.selectList("getWriteComment7", id);
    }

    @Override
    public Member selectMember(String email) throws Exception {
        return sqlSession.selectOne("member.selectMember", email);
    }

    @Override
    public int pwUpdate(Member member) throws Exception{
        return sqlSession.update("member.pwUpdate", member);
    }

    @Override
    public void updateAuthStatus(Map<String, Integer> map) throws Exception{
        sqlSession.update("member.updateAuthStatus", map);
    }


    @Override
    public List<Board> myReportList(String id) throws Exception {
        return sqlSession.selectList("member.myReportList",id);
    }

    @Override
    public void boardReportCancel(int bno) throws Exception {
        sqlSession.delete("member.boardReportCancel", bno);
    }

    @Override
    public void teaReportCancel(int bno) throws Exception {
        sqlSession.delete("member.teaReportCancel", bno);
    }

    @Override
    public void parReportCancel(int bno) throws Exception {
        sqlSession.delete("member.parReportCancel", bno);
    }








}
