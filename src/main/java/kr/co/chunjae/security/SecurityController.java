package kr.co.chunjae.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class SecurityController {



  @GetMapping("/customLogout")
  public void doLogout(){
    log.info("custom Logout");
  }


}
