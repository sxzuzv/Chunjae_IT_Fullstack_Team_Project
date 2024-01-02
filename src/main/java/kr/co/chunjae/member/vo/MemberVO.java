package kr.co.chunjae.member.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;


@Getter
@Setter
@ToString
@NoArgsConstructor
@Component("memberVO")
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberGender;
	private String memberBirth;
	private String memberBirthGn;
	private String memberHp;
	private String smsstsYn;
	private String memberEmail;
	private String emailstsYn;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String joinDate;
	private String delYn;
}

