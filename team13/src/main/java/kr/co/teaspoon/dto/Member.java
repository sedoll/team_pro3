package kr.co.teaspoon.dto;

import lombok.Data;

@Data
public class Member {
    private String id;
    private String pw;
    private String name;
    private String email;
    private String tel;
    private String addr1;
    private String addr2;
    private String postcode;
    private String regdate;
    private String birth;
    private int pt;
    private int visited;
    private int job;
}
