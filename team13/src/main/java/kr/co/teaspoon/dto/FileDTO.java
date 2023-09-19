package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileDTO {
    private int no;
    private int postNo;
    private String saveFolder;
    private String originFile;
    private String saveFile;
    private long fileSize;
    private String uploadDate;
}
