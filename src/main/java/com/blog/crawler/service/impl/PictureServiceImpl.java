package com.blog.crawler.service.impl;

import com.blog.crawler.dao.PictureDao;
import com.blog.crawler.domain.PictureInfo;
import com.blog.crawler.service.PictureService;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-20 16:43
 **/
@Service
public class PictureServiceImpl implements PictureService {

    @Resource
    private PictureDao pictureDao;

    /**
     * 查询所有图片
     * @return
     */
    @Override
    public List<PictureInfo> findPictures() {
        return pictureDao.findAll();
    }

    /**
     * 分页查询
     * @param currentPage 当前页 从0开始
     * @param pageSize 每页行数
     * @return
     */
    @Override
    public Page<PictureInfo> findPicturesByPage(int currentPage, int pageSize) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        Page<PictureInfo> all = pictureDao.findAll(pageable);
        return all;
    }

    /**
     * 通过id查询图片信息
     * @param id
     * @return
     */
    @Override
    public PictureInfo findPicturesById(String id) {
        PictureInfo pictureInfo = pictureDao.findById(id).get();
        return pictureInfo;
    }

    /**
     * 通过类别查询
     * @param type
     * @return
     */
    @Override
    public List<PictureInfo> findPicturesByType(String type) {
        PictureInfo pictureInfo=new PictureInfo();
        pictureInfo.setType(type);
        Example example=Example.of(pictureInfo);
        return pictureDao.findAll(example);
    }

    /**
     * 按条件分页查询
     * @param currentPage 当前页 从0开始
     * @param pageSize 每页行数
     * @param pictureInfo 条件
     * @return
     */
    @Override
    public Page<PictureInfo> findPicturesPageByCondition(int currentPage, int pageSize, PictureInfo pictureInfo) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        Example<PictureInfo> of = Example.of(pictureInfo);
        return pictureDao.findAll(of, pageable);
    }
}
