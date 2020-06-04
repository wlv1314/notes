package com.blog.notes.controller;

import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
import com.blog.notes.service.EssaysService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-25 15:20
 **/
@Controller
public class SearchController {

    @Resource
    private EssaysService essaysService;

    @RequestMapping("search")
    @ResponseBody
    public ModelAndView searchInfo(String searchName,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        ModelAndView modelAndView=new ModelAndView();
        User user = (User) loginUser;
        List<Essays> essays = essaysService.findEssaysBySearchName(searchName,user);
        modelAndView.setViewName("searchList");
        modelAndView.addObject("list", essays);
        modelAndView.addObject("currUser", loginUser);
        modelAndView.addObject("searchName", searchName);
        request.setAttribute("currUser", loginUser);
        return modelAndView;
    }

    @GetMapping("searchInfo/{essaysId}")
    @ResponseBody
    public ModelAndView findEssaysContentByEssaysId(@PathVariable int essaysId,ModelAndView modelAndView, HttpServletRequest request){
        System.out.println("搜索也id"+essaysId);
        Object loginUser = request.getSession().getAttribute("currUser");
        Essays essaysByEssaysId = essaysService.findEssaysByEssaysId(essaysId);
        modelAndView.setViewName("showessays");
        modelAndView.addObject("ebei", essaysByEssaysId);
        modelAndView.addObject("currUser", loginUser);
        request.setAttribute("currUser", loginUser);
        return modelAndView;
    }
}
