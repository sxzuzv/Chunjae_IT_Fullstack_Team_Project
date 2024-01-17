package kr.co.chunjae.member.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.util.List;


@Getter
@Setter
@ToString
@NoArgsConstructor
@Component("memberVO")
public class MemberVO {
	private String memberId;		// 회원 아이디
	private String memberPw;		// 비밀번호
	private String memberName;		// 이름
	private String memberGender;	// 성별
	private String memberBirthY;	// 생년월일 : 연도
	private String memberBirthM;	// 생년월일 : 월
	private String memberBirthD;	// 생년월일 : 일
	private String memberBirthGn;	// 양력 or 음력
	private String memberHp1;		// 휴대전화 : 010
	private String memberHp2;		// 휴대전화 : 중간 번호 4자리
	private String memberHp3;		// 휴대전화 : 마지막 번호 4자리
	private String smsstsYn;		// 문자 수신 동의 여부
	private String memberEmail1;	// 이메일 : '_____'@
	private String memberEmail2;	// 이메일 : @'_____.___'
	private String emailstsYn;		// 이메일 수신 동의 여부
	private String zipcode;			// 우편번호
	private String roadAddress;		// 도로명
	private String jibunAddress;	// 지번
	private String namujiAddress;	// 나머지 주소
	private String joinDate;		// 가입일
	private String delYn;			// 탈퇴 여부

	private List<AuthVO> authList;
}

