package com.blog.applet.service;

import com.blog.applet.vo.Page;
import com.blog.notes.entity.Essays;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-29 15:23
 **/
public interface AppEssaysService {

    Page<Essays> getEssaysList(int currPage, int pageSize);
    int addEssays(Essays essays);
    Page<Essays> searchAppEssays(@Param("searchKey") String searchKey, @Param("offSet") int offSet, @Param("pageSize") int pageSize);

}
