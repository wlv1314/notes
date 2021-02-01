package com.blog.applet.dao;

import com.blog.notes.entity.Essays;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-07-01 15:17
 **/
@Mapper
public interface SearchDao {
    int searchAppEssaysCount(@Param("searchKey") String searchKey);
    List<Essays> searchAppEssays(@Param("searchKey") String searchKey,@Param("offSet") int offSet,@Param("pageSize") int pageSize);

}
