package kr.co.chunjae.admin.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class NoticeVO {
    private int brdId;          // 게시물 번호
    private String title;       // 제목
    private String memberId;    // 작성자 아이디 (공지사항의 경우, 관리자만 작성 가능)
    private String content;     // 내용
    private int cate;           // 카테고리 분류 (1 : 공지사항)
    private String regDate;       // 작성일
    private int viewCnt;        // 조회수
}
