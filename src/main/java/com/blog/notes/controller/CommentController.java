package com.blog.notes.controller;

import com.blog.notes.entity.Comment;
import com.blog.notes.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:03
 **/
@Controller
public class CommentController {

    @Resource
    private CommentService commentService;


    /**
     * 评论
     * @param essaysId
     * @param request
     * @return
     */
    @PostMapping("comments/{essaysId}")
    @ResponseBody
    public Map commentsByEssaysId(@PathVariable int essaysId, HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        List<Comment> comments = commentService.findCommentsByEssaysId(essaysId);
        Map map=new HashMap();
        map.put("comments", comments);
        map.put("currUser", loginUser);
        request.setAttribute("currUser", loginUser);
        return map;
    }

    @PostMapping("addComment")
    @ResponseBody
    public Map addComment(Comment comment){
        Map map=new HashMap();
        comment.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
        int i = commentService.addComment(comment);
        if(i>0){
            map.put("msg", "评论成功!");
        }else{
            map.put("msg", "评论失败!");
        }
        return map;
    }


}
