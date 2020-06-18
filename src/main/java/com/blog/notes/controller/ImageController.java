package com.blog.notes.controller;


import com.blog.notes.util.FastDFSClient;
import etc.org.apache.tools.ant.util.ResourceUtils;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 图片上传
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-17 15:41
 **/
@Controller
public class ImageController {
    @Value("${IMAGE_SERVER_URL}")
    private String IMAGE_SERVER_URL;

    @Autowired
    private FastDFSClient fastDFSClient;

    @RequestMapping("image/upload")
    @ResponseBody
    public Map uploadImage(@RequestParam("upload") MultipartFile file) throws IOException {
        Map map=new HashMap();
        //获取图片的扩展名
        String originalFilename = file.getOriginalFilename();
        String extName=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
        //上传图片，获取文件名和地址
        String url = null;
        try {
            url = fastDFSClient.uploadFile(file.getBytes(), extName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //拼接返回的url
        url=IMAGE_SERVER_URL + url;

        map.put("uploaded", 1);
        map.put("fileName", originalFilename);
        map.put("url", url);
        return map;

    }

}
