package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardlistVO;
import kr.co.teaspoon.dto.CommentlistVO;
import kr.co.teaspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
        try{
            boolean check = pwEncoder.matches(pw, member.getPw()); // 입력된 비밀번호와 db의 암호화된 비밀번호 비교
            if(check) {
                comp = true;
            }
        } catch (Exception e) {
            
        }
        return comp;
    }
    
    // Ajax로 로그인 처리 (컨트롤러)
    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }

    /*비밀번호 찾기 할때 */
    @Override
    public Member selectMember(String email) throws Exception {
        System.out.println(email);
        Member member = memberDAO.selectMember(email);
        if(member != null) {
            System.out.println("전화번호 : " + member.getTel());
            StringBuffer str = new StringBuffer(member.getTel());
            str.insert(0, "0");

            String phone = str.substring(0);
            if(phone.substring(0,2).equals("00")) {
                phone = phone.substring(1);
            }
            member.setTel(phone);

            System.out.println("전화번호는 : " + member.getTel());
        }
        System.out.println(member);
        return member;
    }


    @Override
    public int pwUpdate(Member member) throws Exception {
        int result = memberDAO.pwUpdate(member);

        return result;
    }

    @Override
    public void updateAuthStatus ( Map<String, Integer> map) throws Exception{
        memberDAO.updateAuthStatus(map);
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

    @Override
    public List<Board> myReportList(String id) throws Exception {
        return memberDAO.myReportList(id);
    }

    @Override
    public void boardReportCancel(int bno) throws Exception {
        memberDAO.boardReportCancel(bno);
    }

    @Override
    public void teaReportCancel(int bno) throws Exception {
        memberDAO.teaReportCancel(bno);
    }

    @Override
    public void parReportCancel(int bno) throws Exception {
        memberDAO.parReportCancel(bno);
    }
}
