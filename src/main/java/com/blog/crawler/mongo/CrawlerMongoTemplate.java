// ***********************************************
//
// 文件名(FileName)：RcvMongoTemplate.java
//
// 功能描述(Description)：操作TRANSFER_RCVPACK库的mongotemplate
//
// 数据表
//
// 作者(Author)：王亮
//
// 创建日期(Created Date)：2019-10-18
//
// 修改记录(Revision Record)：
//
// ***********************************************
package com.blog.crawler.mongo;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.mongo.MongoProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.data.mongodb.core.convert.DefaultMongoTypeMapper;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.core.mapping.MongoMappingContext;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import java.util.ArrayList;
import java.util.List;

/**
 * 操作mongo库的mongotemplate
 * @program: pbs
 * @description
 * @author: wl
 * @create: 2019-08-12 11:21
 **/
@Configuration
@EnableMongoRepositories(basePackages = "com.blog.crawler.dao", mongoTemplateRef = "crawlerTemplate")
public class CrawlerMongoTemplate {

	@Autowired
    @Qualifier("crawlerMongoProperties")
    private MongoProperties mongoProperties;
	

    @Primary
    @Bean(name = "crawlerTemplate")
    public MongoTemplate crawlerTemplate() {
    	MongoDbFactory rateFactory = crawlerFactory(this.mongoProperties);
        MappingMongoConverter converter = new MappingMongoConverter(rateFactory, new MongoMappingContext());
        converter.setTypeMapper(new DefaultMongoTypeMapper(null));
    	return new MongoTemplate(rateFactory,converter);
    }

    @Primary
    @Bean(name = "crawlerGridFs")
    public GridFsTemplate crawlerGridFsTemplate() throws Exception {
        MongoDbFactory firstFactory = crawlerFactory(this.mongoProperties);
        MappingMongoConverter converter = new MappingMongoConverter(firstFactory, new MongoMappingContext());
        return new GridFsTemplate(firstFactory, converter);
    }
    
	@Bean
    @Primary
    public MongoDbFactory crawlerFactory(MongoProperties mongoProperties) {

        ServerAddress serverAdress = new ServerAddress(mongoProperties.getHost(),mongoProperties.getPort());
        List<MongoCredential> mongoCredentials=new ArrayList<>();
        if (mongoProperties.getUsername() == null || mongoProperties.getAuthenticationDatabase() == null || mongoProperties.getPassword() == null){
            return new SimpleMongoDbFactory(new MongoClient(serverAdress,mongoCredentials), mongoProperties.getDatabase());
        }else {
            mongoCredentials.add(MongoCredential.createCredential(mongoProperties.getUsername(),mongoProperties.getAuthenticationDatabase(),mongoProperties.getPassword()));

            return new SimpleMongoDbFactory(new MongoClient(serverAdress,mongoCredentials), mongoProperties.getDatabase());
        }

    }
}
