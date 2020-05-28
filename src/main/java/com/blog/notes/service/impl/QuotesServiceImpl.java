package com.blog.notes.service.impl;

import com.blog.notes.dao.QuotesDao;
import com.blog.notes.entity.Quotes;
import com.blog.notes.service.QuotesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-27 15:49
 **/
@Service
public class QuotesServiceImpl implements QuotesService {

    @Resource
    private QuotesDao quotesDao;

    @Override
    public List<Quotes> getQuotes() {
        List<Quotes> quotes = quotesDao.getQuotes();
        return quotes;
    }
}
