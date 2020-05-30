package com.blog.notes.controller;

import com.blog.notes.dao.UserDao;
import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
import com.blog.notes.service.EssaysService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String toIndex(HttpServletRequest request,@ModelAttribute("loginStatus") String loginStatus){
        Object loginUser = request.getSession().getAttribute("currUser");
        request.setAttribute("currUser", loginUser);
        request.setAttribute("loginStatus", loginStatus);
        return "index";
    }


    @PostMapping("register")
    public String register(User user){
        int i = userDao.addUser(user);
        return "redirect:index";
    }

    @PostMapping("login")
    @ResponseBody
    public ModelAndView login(User user,HttpServletRequest request){
        ModelAndView model=new ModelAndView();
        User findUser = userDao.findUserByUserName(user);
        model.setViewName("index");
        if("".equals(user.getUserName()) ||
                user.getUserName()=="" || user.getPassword()=="" ||
                "".equals(user.getPassword())){
            model.addObject("loginStatus", "err");
            model.addObject("loginMsg", "用户名或密码不能为空!");
        }
        if(findUser==null){
            model.addObject("currUser", findUser);
            model.addObject("loginStatus", "err");
            model.addObject("loginMsg", "用户名不存在!");
        }else{
            if(findUser.getPassword().equals(user.getPassword())){
                model.addObject("currUser", findUser);
                model.addObject("loginStatus", "success");
                request.getSession().setAttribute("currUser", findUser);
            }else{
                model.addObject("loginStatus", "err");
                model.addObject("loginMsg", "密码不正确!");
            }
        }
        return model;
    }

    @RequestMapping("logout")
    public String logOut(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:index";
    }

    @RequestMapping("essays")
    public String essays(HttpServletRequest request, HttpServletResponse response,RedirectAttributes attributes) throws IOException {
        Object loginUser = request.getSession().getAttribute("currUser");
        if(loginUser==null){
            request.setAttribute("isLogin", false);
            attributes.addFlashAttribute("loginStatus", false);
            return "redirect:index";
        }else{
            request.setAttribute("currUser", loginUser);
            User user=(User)loginUser;
            List<Essays> allEssays = essaysService.findAllEssaysLimit(user.getUserId());
            request.setAttribute("allEssays", allEssays);
            return "essays";
        }
    }
    @RequestMapping("myEssays")
    public String myEssays(HttpServletRequest request, HttpServletResponse response,RedirectAttributes attributes) throws IOException {
        Object loginUser = request.getSession().getAttribute("currUser");
        if(loginUser==null){
            attributes.addFlashAttribute("loginStatus", false);
            return "redirect:index";
        }else{
            request.setAttribute("currUser", loginUser);
            return "essaysList";
        }
    }

}
