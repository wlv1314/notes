package com.blog.crawler.mongo;

import org.springframework.boot.autoconfigure.mongo.MongoProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * MongoDB配置类
 * @program: pbs
 * @description
 * @author: wl
 * @create: 2019-08-12 14:24
 **/
@Configuration
public class MongoConfig {
    @Bean(name="crawlerMongoProperties")
    @Primary
    @ConfigurationProperties(prefix="spring.data.mongodb.crawler")
    public MongoProperties crawlerMongoProperties() {
        System.out.println("-------------------- crawlerProperties init ---------------------");
        return new MongoProperties();
    }
}
