package com.blog.notes.service.impl;

import com.blog.notes.dao.EssaysDao;
import com.blog.notes.entity.Essays;
import com.blog.notes.service.EssaysService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:37
 **/
@Service
public class EssaysServiceImpl implements EssaysService {
    @Resource
    private EssaysDao essaysDao;

    @Override
    public int addEssays(Essays essays) {
        return essaysDao.addEssays(essays);
    }

    @Override
    public List<Essays> findAllEssaysLimit(int userId) {
        return essaysDao.findAllEssaysLimit(userId);
    }

    @Override
    public List<Essays> findAllEssays(int userId,int offSet,int pageSize) {
        return essaysDao.findAllEssays(userId,offSet,pageSize);
    }

    @Override
    public int count(int userId) {
        return essaysDao.count(userId);
    }
}
