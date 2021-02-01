package com.blog.applet.controller;

import com.blog.applet.service.AppEssaysService;
import com.blog.applet.vo.NotesResult;
import com.blog.applet.vo.Page;
import com.blog.notes.entity.Essays;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-07-01 15:01
 **/
@RestController
@RequestMapping("/app")
public class AppSearchController {

    @Resource
    private AppEssaysService essaysService;

    @PostMapping("/search")
    public NotesResult search(@RequestParam("currPage")int currPage, @RequestParam("pageSize") int pageSize,
                              @RequestParam("searchKey")String searchKey){
        Page<Essays> essaysPage = essaysService.searchAppEssays(searchKey, currPage, pageSize);

        return new NotesResult(essaysPage);
    }
}
