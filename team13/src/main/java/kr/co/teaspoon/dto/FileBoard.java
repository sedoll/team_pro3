package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileBoard {
    private int postNo;
    private String title;
    private String content;
    private String regdate;
    private int visited;
}
