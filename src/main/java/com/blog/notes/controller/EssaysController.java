package com.blog.notes.controller;

import com.blog.notes.entity.Essays;
import com.blog.notes.entity.User;
import com.blog.notes.service.CommentService;
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
    @Resource
    private CommentService commentService;

    @PostMapping("addessays")
    @ResponseBody
    public Map<String,Object> addEssays(Essays essays,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        User user=(User)loginUser;
        List<Essays> allEssays = essaysService.findAllEssaysLimit(user.getUserId());
        request.setAttribute("allEssays", allEssays);

        Map<String,Object> map=new HashMap<>();
        String essaysTitle = essays.getEssaysTitle();
        String essaysContent = essays.getEssaysContent();
        if("".equals(essaysTitle)||"".equals(essaysContent)||essaysTitle==null || essaysContent==null){
            map.put("msg", "标题或内容不得为空!");
            return map;
        }
        essays.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
        int i = essaysService.addEssays(essays);
        if(i>0){
            map.put("msg", "随笔添加成功!");
            return map;
        }else{
            map.put("msg", "随笔添加失败!");
            return map;
        }

    }

    @PostMapping("essaysList")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> news(@RequestParam(value = "currPage",defaultValue = "1")int currPage, HttpServletRequest request) {
        User currUser = (User) request.getSession().getAttribute("currUser");
        currUser=new User();
        currUser.setUserId(3);
        Map<String, Object> map = new HashMap<String, Object>();
        if(currUser==null){
            System.out.println("验证登录为空");
            map.put("msg", "login please!!!");
            return new ResponseEntity<Map<String, Object>>(
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }

        int pageSize = 5;// 每页显示条数

        try {
            int count = essaysService.count(currUser.getUserId());// 获取总条目数
            int totalPage = count / pageSize;// 计算总页数x
            if (count % pageSize != 0) {// 不满一页的数据按一页计算
                totalPage++;
            }

            if (currPage > totalPage)// 当页数大于总页数，直接返回
                return null;

            int offset = (currPage - 1) * pageSize;// 计算sql需要的起始索引
            List<Essays> list = essaysService.findAllEssays(currUser.getUserId(),offset, pageSize);// 根据起始索引和页面大小去查询数据

            // 封装数据，并返回
            map.put("page", currPage);
            map.put("pageSize", pageSize);
            map.put("totalPage", totalPage);
            map.put("list", list);

            return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

        } catch (Exception e) {
            System.out.println(e);
            return new ResponseEntity<Map<String, Object>>(
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("news/{essaysId}/{currPage}")
    @ResponseBody
    public ModelAndView findEssaysContentByEssaysId(@PathVariable int essaysId,@PathVariable int currPage, ModelAndView modelAndView,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        Essays essaysByEssaysId = essaysService.findEssaysByEssaysId(essaysId);
        modelAndView.setViewName("showessays");
        modelAndView.addObject("ebei", essaysByEssaysId);
        modelAndView.addObject("currUser", loginUser);
        modelAndView.addObject("currPage", currPage);
        request.setAttribute("currUser", loginUser);
        return modelAndView;
    }

    @PostMapping("deleteEssaysById/{essaysId}")
    @ResponseBody
    public String deleteEssaysContentByEssaysId(@PathVariable int essaysId, ModelAndView modelAndView,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        if(loginUser==null){
            modelAndView.addObject("msg", "login please!!!");
            return "redirect:index";
        }
        //删除随笔
        essaysService.deleteEssaysByEssaysId(essaysId);
        //删除与随笔相关的评论
        commentService.deleteCommentByEssaysId(essaysId);
        modelAndView.setViewName("showessays");
        modelAndView.addObject("currUser", loginUser);
        request.setAttribute("currUser", loginUser);
        return "redirect:myEssays";
    }

    @PostMapping("updateEssays")
    @ResponseBody
    public Map updateEssaysByEssaysId(Essays essays,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("currUser");
        Map map=new HashMap();
        System.out.println(essays);
        int i = essaysService.updateEssaysByEssaysId(essays);
        if(i>0){
            map.put("msg", "更新成功!");
        }else{
            map.put("msg", "更新失败!");
        }
        return map;
    }


    @PostMapping("choicenessList")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> choicenessList(@RequestParam("currPage")int currPage, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();

        int pageSize = 10;// 每页显示条数

        try {
            int count = essaysService.count(null);// 获取总条目数
            int totalPage = count / pageSize;// 计算总页数
            if (count % pageSize != 0) {// 不满一页的数据按一页计算
                totalPage++;
            }

            if (currPage > totalPage)// 当页数大于总页数，直接返回
                return null;

            int offset = (currPage - 1) * pageSize;// 计算sql需要的起始索引
            List<Essays> list = essaysService.findAllEssays(null,offset, pageSize);// 根据起始索引和页面大小去查询数据

            // 封装数据，并返回
            map.put("page", currPage);
            map.put("pageSize", pageSize);
            map.put("totalPage", totalPage);
            map.put("list", list);

            return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

        } catch (Exception e) {
            return new ResponseEntity<Map<String, Object>>(
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @RequestMapping("addEssaysLike")
    @ResponseBody
    public Map addEssaysLike(@RequestParam("essaysId")int essaysId){
        Map map=new HashMap();
        essaysService.addEssaysLike(essaysId);
        Essays essays = essaysService.findEssaysByEssaysId(essaysId);
        map.put("essays", essays);
        return map;
    }


}
