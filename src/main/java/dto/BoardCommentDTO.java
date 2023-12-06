package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@ToString
public class BoardCommentDTO {
    private int comId;
    private int parentId;
    private int comDepth;
    private String comContent;
    private String userId;
    private LocalDate regDate;
    private LocalDate modDate;
}
