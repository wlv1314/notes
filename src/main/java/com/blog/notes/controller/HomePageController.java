package com.blog.notes.controller;

import com.blog.notes.dao.UserDao;
import com.blog.notes.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-04 17:11
 **/
@Controller
public class HomePageController {
    @Resource
    private UserDao userDao;

    @RequestMapping("index")
    public String toIndex(){
        return "index";
    }


    @PostMapping("register")
    public String register(User user){
        int i = userDao.addUser(user);
        System.out.println("addUser:"+i);
        return "redirect:index";
    }

    @PostMapping("login")
    @ResponseBody
    public ModelAndView login(User user){
        User findUser = userDao.findUserByUserName(user);
        System.out.println("findUser:"+findUser);
        ModelAndView model=new ModelAndView();
        model.setViewName("index");
        model.addObject("currUser", findUser);
        model.addObject("loginStatus", "success");
        return model;
    }
}
