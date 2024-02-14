package kr.co.chunjae.classarchive.controller.error.controlleradvice;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface ControllerAdvice {
    // Controller에 대하여 전역적으로 Exception 설정이 가능하다.
    // ErrorController와 ControllerAdvice 모두 에러 처리가 설정돼 있는 상태라면?
    // ControllerAdvice의 동작이 먼저 이루어지며, 에러 처리에 실패한 경우 ErrorController의 작업이 처리된다.
}
