package kr.co.chunjae.security;


import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

  @Setter(onMethod_ = { @Autowired })
  private SqlSession sqlSession;

  @Override
  public UserDetails loadUserByUsername(String userName)
          throws UsernameNotFoundException {

    log.warn("Load User By UserName : " + userName);
    // userName means userid
    MemberVO vo = sqlSession.selectOne("mapper.member.read", userName);
    log.warn("queried by member mapper: " + vo);
    return vo == null ? null : new CustomUser(vo);
  }
}