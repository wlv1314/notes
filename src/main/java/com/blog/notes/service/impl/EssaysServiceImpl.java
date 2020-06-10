package com.blog.notes.service.impl;

import com.blog.notes.dao.EssaysDao;
import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
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
    public List<Essays> findAllEssays(Integer userId,int offSet,int pageSize) {
        return essaysDao.findAllEssays(userId,offSet,pageSize);
    }

    @Override
    public int count(Integer userId) {
        return essaysDao.count(userId);
    }

    @Override
    public Essays findEssaysByEssaysId(int essaysId) {
        return essaysDao.findEssaysByEssaysId(essaysId);
    }

    @Override
    public void deleteEssaysByEssaysId(int essaysId) {
        essaysDao.deleteEssaysByEssaysId(essaysId);
    }


    @Override
    public List<Essays> findEssaysBySearchName(String searchName, User user) {
        Integer userId=null;
        if(user!=null){
            userId=user.getUserId();
        }
        List<Essays> essays = essaysDao.findEssaysBySearchName(searchName,userId);
        if(essays!=null && essays.size()>0){
            return essays;
        }
        return null;
    }

    @Override
    public int updateEssaysByEssaysId(Essays essays) {
        return essaysDao.updateEssaysByEssaysId(essays);
    }

    @Override
    public int addEssaysLike(int essaysId) {
        return essaysDao.addEssaysLike(essaysId);
    }

}
