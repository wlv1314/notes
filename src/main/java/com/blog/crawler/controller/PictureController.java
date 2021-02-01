package com.blog.crawler.controller;

import com.blog.crawler.domain.BaseResult;
import com.blog.crawler.domain.PictureInfo;
import com.blog.crawler.service.PictureService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-20 16:38
 **/
@Controller
@Slf4j
public class PictureController {

    @Resource
    private PictureService pictureService;


//    @RequestMapping("/findPictures")
    public BaseResult findPictures(){
        List<PictureInfo> pictures = pictureService.findPictures();
        return BaseResult.ok(pictures);
    }

    @PostMapping("/findPictures")
    @ResponseBody
    public Map findPictures(@RequestParam(value = "currPage",defaultValue = "1")int currPage,@RequestParam(value = "type")String type ,HttpServletRequest request) {
//        Page<PictureInfo> picturesByPage = pictureService.findPicturesByPage(currPage, 12);
        log.info("图片类型:"+type+"页码:"+currPage);
        PictureInfo pictureInfo = new PictureInfo();
        pictureInfo.setType(type);
        Page<PictureInfo> picturesByPage = pictureService.findPicturesPageByCondition(currPage-1, 12, pictureInfo);
        Map map=new HashMap();
        map.put("page", currPage);
        map.put("totalPage", picturesByPage.getTotalPages());
        map.put("pageSize", 12);
        map.put("list", picturesByPage.getContent());
        return map;
    }

    /**
     * 随机5张轮播图
     * @return
     */
    @PostMapping("/getPics")
    @ResponseBody
    public BaseResult getPicsLunBo() {
        List<PictureInfo> result = new ArrayList<>();
        List<PictureInfo> pictures = pictureService.findPictures();
        Random random=new Random();
        int[] arrInt = new int[5];
        //生成1~100以内的随机数
        for (int i = 0; i <arrInt.length ; i++) {
            arrInt[i] = -1;
        }
        //初始数组下标
        int index = 0;
        //如果指针元素小于数组长度则一直循环
        while (index < arrInt.length){
            int num = random.nextInt(pictures.size()-1);
            //如果数组中不包含这个元素则赋值给数组
            if(!contains(arrInt,num)){
                arrInt[index++] = num;
                System.out.println(num);
                result.add(pictures.get(num));
            }
        }
        log.info("轮播图片数量:"+result.size());
        log.info("轮播图片数量:"+result.size()+",总数量:"+pictures.size());
        return new BaseResult(result);
    }

    //传一个数组对象与一个值进行对比
    public static boolean contains(int[] arr, int key){

        for (int i = 0; i < arr.length ; i++) {
            //如果相等返回true
            if (arr[i] == key){
                return true;
            }
        }
        return false;
    }


}
