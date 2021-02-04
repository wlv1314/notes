package com.blog.crawler.dao;

import com.blog.crawler.domain.PictureInfo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-20 16:45
 **/
@Repository
public interface PictureDao extends MongoRepository<PictureInfo,String> {
    /**
     * site不为空
     * @return
     */
    @Query(value = "{'site':{'$ne':null}}")
    List<PictureInfo> findBySiteNotNull();

    /**
     * site为空
     * @return
     */
    List<PictureInfo> findBySiteIsNull();
}
