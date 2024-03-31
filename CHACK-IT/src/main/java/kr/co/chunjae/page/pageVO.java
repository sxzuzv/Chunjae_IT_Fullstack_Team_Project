package kr.co.chunjae.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class pageVO {
    private int page;       // 현재 페이지 (출력 페이지)
    private int maxPage;    // 전체 페이지 개수
    private int startPage;  // 현재 페이지 기준 시작 페이지 값
    private int endPage;    // 현재 페이지 기준 마지막 페이지 값
}
