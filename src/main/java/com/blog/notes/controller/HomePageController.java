package com.blog.notes.controller;

import com.blog.notes.dao.UserDao;
import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
import com.blog.notes.service.EssaysService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
    @Resource
    private EssaysService essaysService;

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
    public ModelAndView login(User user,HttpServletRequest request){
        User findUser = userDao.findUserByUserName(user);
        System.out.println("findUser:"+findUser);
        ModelAndView model=new ModelAndView();
        model.setViewName("index");
        model.addObject("currUser", findUser);
        model.addObject("loginStatus", "success");
        request.getSession().setAttribute("currUser", findUser);
        return model;
    }

    @RequestMapping("logout")
    public String logOut(HttpServletRequest request){
        System.out.println("logout");
        request.getSession().invalidate();
        return "redirect:index";
    }

    @RequestMapping("essays")
    public String essays(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("essays");
        Object loginUser = request.getSession().getAttribute("currUser");
        System.out.println(loginUser);
        if(loginUser==null){
            request.setAttribute("isLogin", false);
            System.out.println("重新登录");
            return "redirect:index";
        }else{
            request.setAttribute("currUser", loginUser);
            User user=(User)loginUser;
            List<Essays> allEssays = essaysService.findAllEssays(user.getUserId());
            request.setAttribute("allEssays", allEssays);
            System.out.println("随笔");
            return "essays";
        }
    }


}
