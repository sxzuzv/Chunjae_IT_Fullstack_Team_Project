package kr.co.chunjae.security;


import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.security.domain.CustomUser;
import kr.co.chunjae.security.mapper.SecurityMemberMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

  @Setter(onMethod_ = { @Autowired })
  private SecurityMemberMapper memberMapper;
  @Override
  public UserDetails loadUserByUsername(String memberId)
          throws UsernameNotFoundException {

    log.warn("Load User By memberId : " + memberId);
    // userName means userid
    MemberVO vo = memberMapper.read(memberId);
    log.warn("queried by member mapper: " + vo);
    return vo == null ? null : new CustomUser(vo);
  }
}