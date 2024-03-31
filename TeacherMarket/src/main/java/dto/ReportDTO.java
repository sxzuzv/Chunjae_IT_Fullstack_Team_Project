package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@ToString

public class ReportDTO {
    private int reportId;
    private String userId;
    private int brdId;
    private String reportTitle;
    private String reportContent;
    private LocalDate regDate;
    private LocalDate modDate;
    private String answer;
}
