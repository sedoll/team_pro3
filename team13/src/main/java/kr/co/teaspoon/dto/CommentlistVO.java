package kr.co.teaspoon.dto;

import lombok.*;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommentlistVO {
    private String subject; //제목
    private String content; //내용
    private String write_date; //쓴 날짜
    private String num; //글 번호

}
