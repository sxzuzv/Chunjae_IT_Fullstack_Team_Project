//package kr.co.chunjae.classarchive.config;
//
//import kr.co.chunjae.classarchive.dto.member.MemberDTO;
//import kr.co.chunjae.classarchive.mapper.member.MemberMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.stereotype.Component;
//
//@Component
//public class CustomAuthenticationProvider implements AuthenticationProvider {
//  // MemberMapper 인터페이스 주입
//  @Autowired
//  private MemberMapper memberMapper;
//
//  // 인증 처리 메서드
//  @Override
//  public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//    // 사용자가 입력한 아이디와 비밀번호를 받아옴
//    String memberId = authentication.getName();
//    String password = authentication.getCredentials().toString();
//
//    // 아이디로 회원 정보 조회
//    MemberDTO member = memberMapper.selectMemberById(memberId);
//
//    // 회원 정보가 존재하고, 비밀번호가 일치하면 인증 결과를 생성
//    if (member != null && member.getPassword().equals(password)) {
//      // 인증 결과 객체 생성
//      Authentication auth = new UsernamePasswordAuthenticationToken(member, password, member.getAuthorities());
//      // 인증 결과 객체 반환
//      return auth;
//    }
//    // 그렇지 않으면 인증 예외 발생
//    else {
//      throw new BadCredentialsException("Invalid username or password");
//    }
//  }
//
//  // 인증을 지원하는 Authentication 타입을 지정하는 메서드
//  @Override
//  public boolean supports(Class<?> authentication) {
//    // UsernamePasswordAuthenticationToken 타입만 지원
//    return authentication.equals(UsernamePasswordAuthenticationToken.class);
//  }
//}
//
