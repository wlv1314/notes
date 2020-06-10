package com.blog.notes.service;

import com.blog.notes.entity.Quotes;

import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-27 15:46
 **/
public interface QuotesService {

    List<Quotes> getQuotes();
}
