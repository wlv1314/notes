package com.blog.notes.controller;

import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
import com.blog.notes.service.impl.EssaysServiceImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2019-09-06 13:03
 **/
@Controller
public class EssaysController {

    @Resource
    private EssaysServiceImpl essaysService;

    @PostMapping("addessays")
    @ResponseBody
    public Map<String,Object> addEssays(Essays essays){
        System.out.println(essays.toString());
        Map<String,Object> map=new HashMap<>();
        essays.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
        int i = essaysService.addEssays(essays);
        if(i>0){
            map.put("msg", "随笔添加成功!");
        }else{
            map.put("msg", "随笔添加失败!");
        }
        return map;
    }

    @GetMapping("essaysList")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> news(@RequestParam("currPage")int currPage, HttpServletRequest request) {
        System.out.println("currPage:"+currPage);
        User currUser = (User) request.getSession().getAttribute("currUser");
        System.out.println("userId:"+currUser.getUserId());
        Map<String, Object> map = new HashMap<String, Object>();
        if(currUser==null){
            map.put("msg", "login please!!!");
            return new ResponseEntity<Map<String, Object>>(
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }

        int pageSize = 5;// 每页显示条数

        try {
            int count = essaysService.count(currUser.getUserId());// 获取总条目数
            System.out.println("count:"+count);
            int totalPage = count / pageSize;// 计算总页数
            if (count % pageSize != 0) {// 不满一页的数据按一页计算
                totalPage++;
            }

            if (currPage > totalPage)// 当页数大于总页数，直接返回
                return null;

            int offset = (currPage - 1) * pageSize;// 计算sql需要的起始索引
            List<Essays> list = essaysService.findAllEssays(currUser.getUserId(),offset, pageSize);// 根据起始索引和页面大小去查询数据
            System.out.println("list:"+list.size()+"  ---  "+list.toString());

            // 封装数据，并返回
            map.put("page", currPage);
            map.put("pageSize", pageSize);
            map.put("totalPage", totalPage);
            map.put("list", list);

            return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

        } catch (Exception e) {
            System.out.println("获取分页数据失败"+e);
            return new ResponseEntity<Map<String, Object>>(
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
