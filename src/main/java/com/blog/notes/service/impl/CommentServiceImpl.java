package com.blog.notes.service.impl;

import com.blog.notes.dao.CommentDao;
import com.blog.notes.entity.Comment;
import com.blog.notes.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-03 13:42
 **/
@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    @Override
    public List<Comment> findCommentsByEssaysId(int essaysId) {
        List<Comment> comments = commentDao.findCommentByEssaysId(essaysId);
        return comments;
    }

    @Override
    public int addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public void deleteCommentByEssaysId(int essaysId) {
        commentDao.deleteCommentByEssaysId(essaysId);
    }
}
