package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
    private int report_id;
    private int board_bno;
    private String reporter;
    private String reason;
    private String report_date;
    private String board_type;

}
