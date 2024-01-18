package kr.co.chunjae.member.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.util.List;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;



@Getter
@Setter
@ToString
@NoArgsConstructor
@Component("memberVO")
public class MemberVO {
	@Pattern(regexp = "^[A-Za-z]{1}[A-Za-z0-9]{4,16}$" ,message = "아이디는 4~16자리. 영어와 숫자만 입력해주세요")
	private String memberId;		// 회원 아이디
	@NotNull
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}" ,message = "비밀번호는 8~16자리 영문 대 소문자, 숫자 , 특수문자를 사용하세요")
	private String memberPw;		// 비밀번호
	@Pattern(regexp = "[가-힣]{2,15}$", message = "한글을 입력하세요")
	private String memberName;		// 이름
	private String memberGender;	// 성별
	private String memberBirthY;	// 생년월일 : 연도
	private String memberBirthM;	// 생년월일 : 월
	private String memberBirthD;	// 생년월일 : 일
	private String memberBirthGn;	// 양력 or 음력
	@Pattern(regexp = "\\d{3}", message="첫번째칸:3자리를 입력 하세요")
	private String memberHp1;		// 휴대전화 : 010
	@Pattern(regexp = "\\d{3,4}", message="두번째칸:3자리에서 4자리를 입력 하세요")
	private String memberHp2;		// 휴대전화 : 중간 번호 4자리
	@Pattern(regexp = "\\d{4}", message="세번째칸:4자리 숫자를 입력 하세요")
	private String memberHp3;		// 휴대전화 : 마지막 번호 4자리
	private String smsstsYn;		// 문자 수신 동의 여부
	@Pattern(regexp = "[0-9a-zA-Z]+[_a-z0-9-]", message = "첫번째칸:영문 이나 숫자로 입력해야 합니다")
	private String memberEmail1;	// 이메일 : '_____'@
	@Pattern(regexp = "([\\da-z\\.-]+)\\.([a-z\\.]{2,6})", message = "두번째칸:이메일 형식을 지켜 주세요")
	private String memberEmail2;	// 이메일 : @'_____.___'
	private String emailstsYn;		// 이메일 수신 동의 여부
	@Pattern(regexp = "\\d{5}", message="5자리 숫자를 입력 하세요")
	private String zipcode;			// 우편번호
	@Pattern(regexp = "^[0-9가-힣 ,()-]{3,50}$", message ="주소를 입력해주세요")
	private String roadAddress;		// 도로명
	@Pattern(regexp = "^[0-9가-힣 ,()-]{3,50}$", message ="주소를 입력해주세요")
	private String jibunAddress;	// 지번
	@Pattern(regexp = "^[0-9가-힣 ,()-]{3,50}$", message ="주소를 입력해주세요")
	private String namujiAddress;	// 나머지 주소
	private String joinDate;		// 가입일
	private String delYn;			// 탈퇴 여부
	private List<AuthVO> authList;
}

