package com.blog.notes.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-28 11:29
 **/
@ControllerAdvice
public class MyExceptionHandler {

    @ExceptionHandler(value =Exception.class)
    public String exceptionHandler(Exception e){
        System.out.println("-----------------进去全局异常处理----------------");
        System.out.println("未知异常！原因是:"+e);
        System.out.println("-----------------进去全局异常处理----------------");
        return "error";
    }
}
