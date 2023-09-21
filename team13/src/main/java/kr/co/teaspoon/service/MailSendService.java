package kr.co.teaspoon.service;

import kr.co.teaspoon.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service("mss")
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
	private int size;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }
 
        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        String authkey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:8081/team13_war/signUpConfirm.me?email=")
            .append(email)
            .append("&authkey=")
            .append(authkey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("dj4231@hanmail.net", "admin");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          return authkey;
    }
}

