package kr.co.chunjae.admin.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class NoticeVO {
    private int brdId;
    private String title;
    private String content;
    private Date regDate;
    private int viewCnt;

}
