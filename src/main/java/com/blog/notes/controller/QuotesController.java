package com.blog.notes.controller;

import com.blog.notes.entity.Quotes;
import com.blog.notes.service.QuotesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-27 15:44
 **/
@Controller
public class QuotesController {

    @Resource
    private QuotesService quotesService;

    @RequestMapping("getQuotes")
    @ResponseBody
    public Map getQuotes(){
        List<Quotes> quotes = quotesService.getQuotes();
        Random random=new Random();
        int randomInt = random.nextInt(quotes.size());
        Map map=new HashMap();
        map.put("quotes", quotes.get(randomInt));
        return map;
    }
}
