package kr.co.chunjae.classarchive.service.member;

import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.member.MemberDTO;
import kr.co.chunjae.classarchive.mapper.member.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {
  // MemberMapper 인터페이스 주입
  private final MemberMapper memberMapper;

  // 로그인 처리 메서드
  public Boolean login(String memberId, String password, HttpSession session) {
    // 아이디로 회원 정보 조회
    MemberDTO member = memberMapper.selectMemberById(memberId);
    if (member != null && member.getPassword().equals(password)) {
      member.setPassword("");
      session.setAttribute("memberInfo", member);
      return true;
    }
    else {
      return false;
    }
  }
}