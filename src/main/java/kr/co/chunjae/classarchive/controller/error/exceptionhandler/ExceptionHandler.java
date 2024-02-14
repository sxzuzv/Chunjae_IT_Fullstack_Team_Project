package kr.co.chunjae.classarchive.controller.error.exceptionhandler;

import java.lang.annotation.*;

@Target(ElementType.METHOD) // Method에서 사용할 것임을 의미한다.
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ExceptionHandler {
    Class<? extends Throwable>[] value() default {};
}
