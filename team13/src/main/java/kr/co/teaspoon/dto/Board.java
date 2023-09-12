package kr.co.teaspoon.dto;

import lombok.Data;

// get, set, 생성자 모두 사용가능하게 하는 코드 Data
@Data
public class Board {
    private int bno;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private int cnt;
    private int lev;
    private int par;
}
