package com.blog.notes.entity;

import lombok.Data;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:04
 **/
@Data
public class Essays {
    private int essaysId;
    private Integer userId;
    private String essaysTitle;
    private String essaysContent;
    private String createTime;
    private Integer checkPermissions;
    private Integer praise;
    private String userImg;



}
