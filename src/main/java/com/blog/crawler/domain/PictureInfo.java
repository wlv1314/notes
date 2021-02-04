package com.blog.crawler.domain;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-14 13:03
 **/
@Data
@Document(collection = "t_picture")
public class PictureInfo {

    private String id;
    /**
     * 原地址
     */
    private String src;
    private String imgName;
    private String alt;
    private String title;
    private String info;
    /**
     * 位置
     */
    private String site;
    private String md5;
    private String type;
    private String createTime;
    /**
     * 0-删除
     * 1-再用
     */
    private Integer state;

}
