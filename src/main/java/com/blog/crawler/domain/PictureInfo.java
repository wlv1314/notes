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
    private String src;
    private String imgName;
    private String alt;
    private String title;
    private String info;
    private String site;
    private String md5;
    private String type;

}
