package kr.co.chunjae.classarchive.controller.error.errorcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorControllerTemp implements ErrorController {
    // ErrorController를 상속받는다.

    // 요청명 "/error" : Spring 기본 제공 error 페이지, 그 외의 페이지를 이용하고 싶다면 설정 변경이 필요하다.
    @GetMapping("/error")
    public String handlerError() throws Exception {
        return "error/error"; // 각 프로젝트에서 설정한 error 페이지 경로
    }
}
