package com.blog.notes.entity;

import lombok.Data;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-05 14:37
 **/
@Data
public class User {
    private int userId;
    private String userName;
    private String password;
    private String conformPassword;
    private String email;
}
