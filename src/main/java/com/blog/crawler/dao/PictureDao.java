package com.blog.crawler.dao;

import com.blog.crawler.domain.PictureInfo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-20 16:45
 **/
@Repository
public interface PictureDao extends MongoRepository<PictureInfo,String> {
}
