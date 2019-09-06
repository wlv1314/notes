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
    private int userId;
    private String essaysTitle;
    private String essaysContent;
    private String createTime;


}
