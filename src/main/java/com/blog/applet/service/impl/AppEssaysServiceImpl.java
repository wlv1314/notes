package com.blog.applet.service.impl;

import com.blog.applet.dao.SearchDao;
import com.blog.applet.service.AppEssaysService;
import com.blog.applet.vo.Page;
import com.blog.notes.dao.EssaysDao;
import com.blog.notes.entity.Essays;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-29 15:27
 **/
@Service
public class AppEssaysServiceImpl implements AppEssaysService {
    @Resource
    private EssaysDao essaysDao;
    @Resource
    private SearchDao searchDao;

    @Override
    public Page<Essays> getEssaysList(int currPage, int pageSize) {
        Page<Essays> page=new Page<Essays>();
        int count = essaysDao.count(null);
        List<Essays> allEssays = essaysDao.findAllEssays(null, (currPage-1)*pageSize, pageSize);
        page.setCurrentPage(currPage);
        page.build(allEssays);
        page.setPageSize(pageSize);
        page.setTotal(count);
        return page;
    }

    @Override
    public int addEssays(Essays essays) {
        int i = essaysDao.addEssays(essays);
        return i;
    }

    @Override
    public Page<Essays> searchAppEssays(String searchKey, int offSet, int pageSize) {
        Page<Essays> page=new Page<Essays>();
        int i = searchDao.searchAppEssaysCount(searchKey);
        List<Essays> essays = searchDao.searchAppEssays(searchKey, (offSet-1)*pageSize, pageSize);
        page.setCurrentPage(offSet);
        page.build(essays);
        page.setPageSize(pageSize);
        page.setTotal(i);
        return page;
    }

}
