package com.blog.notes.controller;

import com.blog.notes.entity.Essays;
import com.blog.notes.service.impl.EssaysServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:03
 **/
@Controller
public class EssaysController {

    @Resource
    private EssaysServiceImpl essaysService;

    @PostMapping("addessays")
    @ResponseBody
    public Map<String,Object> addEssays(Essays essays){
        System.out.println(essays.toString());
        Map<String,Object> map=new HashMap<>();
        essays.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
        int i = essaysService.addEssays(essays);
        if(i>0){
            map.put("msg", "随笔添加成功!");
        }else{
            map.put("msg", "随笔添加失败!");
        }
        return map;
    }
}
