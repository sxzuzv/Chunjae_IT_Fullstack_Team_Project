package kr.co.chunjae.security;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.security.mapper.SecurityMemberMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
  @Setter(onMethod_ = { @Autowired})
  private SecurityMemberMapper memberMapper;
  private final CustomUserDetailsService userService;

  public CustomLoginSuccessHandler (CustomUserDetailsService userService) {
    this.userService = userService;
  }

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                      Authentication authentication) throws IOException, ServletException{


    log.warn("Login Success");
    String username = ((UserDetails) authentication.getPrincipal()).getUsername();
    log.info(username);

    MemberVO memberVO=memberMapper.login(username);

    HttpSession session = request.getSession();
    session.setAttribute("isLogOn", true);
    session.setAttribute("memberInfo",memberVO);



    List<String> roleNames = new ArrayList<>();

    authentication.getAuthorities().forEach(authority -> {

      roleNames.add(authority.getAuthority());

    });

    // Security가 요청을 가로챈 경우 사용자가 원래 요청했던 URI 정보를 저장한 객체
    RequestCache requestCache = new HttpSessionRequestCache();
    SavedRequest savedRequest = requestCache.getRequest(request, response);
    String uri ="/main/main.do";
    // 있을 경우 URI 등 정보를 가져와서 사용
    if(savedRequest != null){
      uri = savedRequest.getRedirectUrl();

      // 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
      requestCache.removeRequest(request, response);
    }
    response.sendRedirect(uri);

  }

}
