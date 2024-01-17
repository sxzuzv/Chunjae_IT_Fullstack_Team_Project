package kr.co.chunjae.security;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.security.mapper.SecurityMemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {

  @Setter(onMethod_ = @Autowired)
  private SecurityMemberMapper mapper;


  @Test
  public void testRead() {

    MemberVO vo = mapper.read("admin90");

    log.info(vo);

    vo.getAuthList().forEach(authVO -> log.info(authVO));

  }

}