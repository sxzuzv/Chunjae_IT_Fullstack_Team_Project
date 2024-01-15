package kr.co.chunjae.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@Component("authVO")
public class AuthVO {

  private String memberId;
  private String auth;

}
