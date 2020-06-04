package com.blog.notes.entity;

import lombok.Data;

/**
 * 评论
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-03 13:43
 **/
@Data
public class Comment {

    private Integer commentId;
    //当前用户id
    private Integer currUserId;
    //发起评论的用户id
    private Integer commentUserId;
    //评论文章id
    private Integer essaysId;
    //评论内容
    private String comment;
    //用户
    private User user;
    private String createTime;
}
