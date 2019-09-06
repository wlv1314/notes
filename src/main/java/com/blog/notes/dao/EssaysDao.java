package com.blog.notes.dao;

import com.blog.notes.entity.Essays;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:39
 **/
@Mapper
public interface EssaysDao {
    int addEssays(Essays essays);
    List<Essays> findAllEssays(int userId);
}
