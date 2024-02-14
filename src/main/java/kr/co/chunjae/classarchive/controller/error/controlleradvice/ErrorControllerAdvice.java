package kr.co.chunjae.classarchive.controller.error.controlleradvice;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.chunjae.classarchive.controller.error.exceptionhandler.ExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import java.util.concurrent.TimeoutException;

@Slf4j
@ControllerAdvice
public class ErrorControllerAdvice {
    /**
     *
     * @param exception
     * @param request
     * @return
     */

//    @ResponseStatus(HttpStatus.FORBIDDEN) // 상태 코드를 제어한다.
//    @ExceptionHandler(TimeoutException.class)
//    public String handle(TimeoutException exception, HttpServletRequest request) {
//        return "error/error";
//    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String defaultErrorHandler(Exception ex, Model model) {
        log.error("An error occurred: ", ex);
        model.addAttribute("error", ex.getMessage());  // You can customize the error message if needed
        return "error/error";  // Assuming error.jsp is in the '/error/' path
    }
}
