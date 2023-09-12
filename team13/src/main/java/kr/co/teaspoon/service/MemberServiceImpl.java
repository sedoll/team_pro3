package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
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
}
