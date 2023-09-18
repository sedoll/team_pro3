package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Notice {
    private int no;
    private String title;
    private String content;
    private String resdate;
    private int cnt;
}
