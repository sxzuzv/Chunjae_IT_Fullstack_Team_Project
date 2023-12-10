package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;


@Getter
@Setter
@ToString
public class BoardDTO extends ProductDTO {
    private int brdId;

    private String userId;

    private String title;

    private String content;

    private String ofile;

    private String sfile;

    private LocalDate regDate;

    private int cateMain;

    private int cateSub;

    private int viewCnt;

    private String closed;

}
