package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Grade {
    private int no;
    private String sname;
    private String pid;
    private int kor;
    private int math;
    private int eng;
    private int social;
    private int science;
    private String exam;
    private String tname;
    private String tid;
    private String regdate;
}
