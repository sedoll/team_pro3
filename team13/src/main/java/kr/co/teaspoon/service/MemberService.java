package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardlistVO;
import kr.co.teaspoon.dto.CommentlistVO;
import kr.co.teaspoon.dto.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {
    public List<Member> memberList() throws Exception;
    public Member getMember(String id) throws Exception;
    public int memberCount() throws Exception;
    public void memberInsert(Member member) throws Exception;
    public void memberUpdate(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;
    public Member signIn(String id) throws Exception;
    public boolean loginCheck(String id, String pw) throws Exception;
    public Member login(String id) throws Exception;


    /*내가 쓴 글*/
    public List<BoardlistVO> getWriteList(String id);
    public List<BoardlistVO> getWriteList1(String id); //자유
    public List<BoardlistVO> getWriteList2(String id); //선생님
    public List<BoardlistVO> getWriteList3(String id); //학부모
    public List<BoardlistVO> getWriteList4(String id);
    public List<BoardlistVO> getWriteList5(String id);
    public List<BoardlistVO> getWriteList6(String id);
    public List<BoardlistVO> getWriteList7(String id);
    /*내가 쓴 댓글*/
    public List<CommentlistVO> getWriteComment(String id);
    public List<CommentlistVO> getWriteComment1(String id);
    public List<CommentlistVO> getWriteComment2(String id);
    public List<CommentlistVO> getWriteComment3(String id);
    public List<CommentlistVO> getWriteComment4(String id);
    public List<CommentlistVO> getWriteComment5(String id);
    public List<CommentlistVO> getWriteComment6(String id);
    public List<CommentlistVO> getWriteComment7(String id);

    /* 비밀번호 찾기*/
    public Member selectMember(String email) throws Exception;
    public int pwUpdate(Member mem) throws Exception;
    public void updateAuthStatus (Map<String, Integer> map) throws Exception;
  
    //내가 신고한 게시글
    public List<Board> myReportList(String id) throws Exception;
    public  void boardReportCancel(int bno) throws Exception;
    public  void teaReportCancel(int bno) throws Exception;
    public  void parReportCancel(int bno) throws Exception;

}
