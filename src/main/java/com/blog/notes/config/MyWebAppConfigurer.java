package com.blog.notes.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 资源映射路径
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-06-18 11:49
 **/
//@Configuration
public class MyWebAppConfigurer implements WebMvcConfigurer {

//    /**上传地址*/
//    @Value("${file.upload.path}")
//    private String filePath;
//    /**显示相对地址*/
//    @Value("${file.upload.path.relative}")
//    private String fileRelativePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**").
                addResourceLocations("file:F://images/");
    }
}
