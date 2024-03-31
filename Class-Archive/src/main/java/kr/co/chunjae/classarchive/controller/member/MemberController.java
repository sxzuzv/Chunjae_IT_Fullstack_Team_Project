package kr.co.chunjae.classarchive.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.member.MemberDTO;
import kr.co.chunjae.classarchive.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

// MemberController 클래스
@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {
  // MemberService 클래스 주입
  private final MemberService memberService;

  @GetMapping("/login")
  public String loginForm(){

    return "/common/login";
  }
  // 로그인 요청 처리 메서드
  @PostMapping("/login")
  public String login(@RequestParam("memberId") String memberId,
                      @RequestParam("password") String password, HttpSession session) {
    // 로그인 처리 결과를 받아옴
    boolean result = memberService.login(memberId, password, session);
    if (result) {
      return "redirect:/";
    }
    // 로그인 실패하면 로그인 페이지로 리다이렉트
    else {
      return "redirect:/login";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpServletRequest request) {
    //세션을 삭제
    HttpSession session = request.getSession(false);
    // session이 null이 아니라는건 기존에 세션이 존재했었다는 뜻이므로
    // 세션이 null이 아니라면 session.invalidate()로 세션 삭제해주기.
    if(session != null) {
      session.invalidate();
    }
    return "redirect:/";
  }
}