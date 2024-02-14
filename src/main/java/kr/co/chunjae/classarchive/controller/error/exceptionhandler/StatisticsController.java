package kr.co.chunjae.classarchive.controller.error.exceptionhandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.concurrent.TimeoutException;

@Slf4j
@Controller
@RequestMapping("/statistics")
@RequiredArgsConstructor
public class StatisticsController {
    // @GetMapping("/check/exception")
    // 해당 Controller 내에서 잡고 싶은 Exception을 설정한다.
    @ExceptionHandler(value = Exception.class)
    public String whtToDoException() throws Exception {
        // ...
        return "notfound";
    }

    // @GetMapping("/check/time-out")
    // 해당 Controller 내에서 잡고 싶은 Exception을 설정한다. (EntityNotFoundException => JPA 설정 필요)
    // @ExceptionHandler(value = {TimeoutException.class, EntityNotFoundException.class})
    @ExceptionHandler(value = TimeoutException.class)
    public String notFoundException() throws Exception {
        // ...
        return "timeoutException";
    }
}
