package com.blog.notes.dao;

import com.blog.notes.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-05 14:39
 **/
@Mapper
public interface UserDao {
    int addUser(User user);
    User findUserByUserName(User user);

    int batchInsert(List<User> users);
}
