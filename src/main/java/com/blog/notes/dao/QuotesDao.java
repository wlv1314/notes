package com.blog.notes.dao;

import com.blog.notes.entity.Quotes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-27 15:50
 **/
@Mapper
public interface QuotesDao {
    List<Quotes> getQuotes();
}
