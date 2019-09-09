package com.blog.notes.dao;

import com.blog.notes.entity.Essays;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    List<Essays> findAllEssaysLimit(int userId);
    List<Essays> findAllEssays(@Param("userId") int userId,@Param("offSet") int offSet,@Param("pageSize") int pageSize);
    int count(int userId);
    Essays findEssaysById(int essaysId);
}
