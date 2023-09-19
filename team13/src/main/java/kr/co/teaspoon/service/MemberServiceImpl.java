package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
import kr.co.teaspoon.dto.BoardlistVO;
import kr.co.teaspoon.dto.CommentlistVO;
import kr.co.teaspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberDAO memberDAO;
    
    // spring security 이용
    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberDAO.getMember(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberDAO.memberCount();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberUpdate(Member member) throws Exception {
        memberDAO.memberUpdate(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public Member signIn(String id) throws Exception {
        return memberDAO.signIn(id);
    }
    
    // 서비스에서 로그인 처리
    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        Member member = memberDAO.loginCheck(id);
        boolean check = pwEncoder.matches(pw, member.getPw()); // 입력된 비밀번호와 db의 암호화된 비밀번호 비교
        if(member != null && check) {
            comp = true;
        }
        return comp;
    }
    
    // Ajax로 로그인 처리 (컨트롤러)
    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }






    /*내가 쓴 글*/
    @Override
    public List<BoardlistVO> getWriteList(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList(id);
        if(list!=null) {
            System.out.println("list");
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }

    /*자유게시판*/@Override
    public List<BoardlistVO> getWriteList1(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList1(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }


    /*선생님게시판*/
    @Override
    public List<BoardlistVO> getWriteList2(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList2(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }

    /*학부모 게시판*/
    @Override
    public List<BoardlistVO> getWriteList3(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList3(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }

    @Override
    public List<BoardlistVO> getWriteList4(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList4(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<BoardlistVO> getWriteList5(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList5(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<BoardlistVO> getWriteList6(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList6(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<BoardlistVO> getWriteList7(String id) {
        List<BoardlistVO> list = memberDAO.getWriteList7(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment1(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment1(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment2(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment2(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment3(String id) {
        List<CommentlistVO> list =memberDAO.getWriteComment3(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment4(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment4(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment5(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment5(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment6(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment6(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
    @Override
    public List<CommentlistVO> getWriteComment7(String id) {
        List<CommentlistVO> list = memberDAO.getWriteComment7(id);
        if(list!=null) {
            System.out.println(list);
        }
        return list;
    }
}
