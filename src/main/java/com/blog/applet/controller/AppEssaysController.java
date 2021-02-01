package com.blog.applet.controller;

import com.blog.applet.service.AppEssaysService;
import com.blog.applet.vo.NotesResult;
import com.blog.applet.vo.Page;
import com.blog.notes.entity.Essays;
import com.blog.notes.service.impl.EssaysServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-28 17:44
 **/
@RestController
@RequestMapping("/app")
public class AppEssaysController {

    @Resource
    private AppEssaysService appEssaysService;
    private static final int PAGE_SIZE=5;


    @PostMapping("/essaysList")
    public NotesResult getEssaysList(@RequestParam(value = "currPage",defaultValue = "1")int currPage,@RequestParam("pageSize") int pageSize){
        Page<Essays> essaysList = appEssaysService.getEssaysList(currPage, pageSize);
        return new NotesResult(essaysList);
    }
    @PostMapping("/addEssays")
    public NotesResult addEssays(@RequestBody Essays essays){
        essays.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
        int i = appEssaysService.addEssays(essays);
        if(i>0){
            return new NotesResult(200,"添加成功",i);
        }
        return new NotesResult(300,"添加失败",i);
    }
}
