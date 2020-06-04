package com.blog.notes.service;

import com.blog.notes.entity.Comment;

import java.util.List;

/**
 * 评论
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-03 13:42
 **/
public interface CommentService {

    List<Comment> findCommentsByEssaysId(int essaysId);
    int addComment(Comment comment);
    void deleteCommentByEssaysId(int essaysId);

}
