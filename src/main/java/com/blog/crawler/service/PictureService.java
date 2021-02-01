package com.blog.crawler.service;


import com.blog.crawler.domain.PictureInfo;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-20 16:40
 **/
public interface PictureService {
    /**
     * 查询所有图片
     * @return
     */
    List<PictureInfo> findPictures();

    /**
     * 分页查询
     * @param currentPage 当前页 从0开始
     * @param pageSize 每页行数
     * @return
     */
    Page<PictureInfo> findPicturesByPage(int currentPage, int pageSize);

    /**
     * 通过id查询图片信息
     * @param id
     * @return
     */
    PictureInfo findPicturesById(String id);

    /**
     * 通过类别查询
     * @param type
     * @return
     */
    List<PictureInfo> findPicturesByType(String type);

    /**
     * 按条件分页查询
     * @param currentPage 当前页 从0开始
     * @param pageSize 每页行数
     * @param pictureInfo 条件
     * @return
     */
    Page<PictureInfo> findPicturesPageByCondition(int currentPage, int pageSize, PictureInfo pictureInfo);

}
