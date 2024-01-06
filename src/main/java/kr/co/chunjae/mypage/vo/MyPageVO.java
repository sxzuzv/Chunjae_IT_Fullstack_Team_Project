package kr.co.chunjae.mypage.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPageVO {
	private String memberId;	// 회원 아이디
	private String beginDate;	// 시작일
	private String endDate;		// 종료일

}
