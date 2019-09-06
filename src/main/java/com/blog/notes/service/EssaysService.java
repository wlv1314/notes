package com.blog.notes.service;

import com.blog.notes.entity.Essays;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:37
 **/
public interface EssaysService {
    int addEssays(Essays essays);
    List<Essays> findAllEssays(int userId);
}
