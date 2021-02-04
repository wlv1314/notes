package com.blog.notes;

import com.blog.crawler.dao.PictureDao;
import com.blog.crawler.domain.PictureInfo;
import com.blog.notes.dao.UserDao;
import com.blog.notes.entity.User;
import com.blog.notes.service.MailService;
import com.blog.notes.util.FastDFSClient;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NotesApplicationTests {

    @Resource
    private MailService mailService;
    @Resource
    private UserDao userDao;
    @Autowired
    private FastDFSClient fastDFSClient;
    @Resource
    private PictureDao pictureDao;
    @Value("${IMAGE_SERVER_URL}")
    private String IMAGE_SERVER_URL;

    @Test
    public void contextLoads() {
    }
    @Test
    public void testImgToMysql() {
        List<PictureInfo> all = pictureDao.findBySiteIsNull();
        for (int i = 0; i < all.size(); i++) {
            try {
                PictureInfo pictureInfo = all.get(i);
                if(!StringUtils.isEmpty(pictureInfo.getSite())){
                    continue;
                }
                String url=pictureInfo.getSrc();
                String imageName = url.substring(url.lastIndexOf("/") + 1, url.length());
                URL uri = new URL(url);
                // 打开连接
                URLConnection con = uri.openConnection();
                //设置请求超时为5s
                con.setConnectTimeout(5 * 1000);
                con.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
                // 输入流
                InputStream is = con.getInputStream();
                byte[] bytes = IOUtils.toByteArray(is);
                System.out.println(imageName + ":--下载完成"+pictureInfo.getId());
                is.close();
                String extName=imageName.substring(imageName.lastIndexOf(".")+1);
                String s = fastDFSClient.uploadFile(bytes, extName);
                String dfsUrl=IMAGE_SERVER_URL+s;
                pictureInfo.setSite(dfsUrl);
                pictureInfo.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")));
                pictureDao.save(pictureInfo);
                Thread.sleep(1000);
            } catch (Exception e) {
                System.out.println("下载错误"+e);
            }
        }
    }

    @Test
    public void testFastDFS() throws Exception {
        File file=new File("C:\\Users\\ldl\\Desktop\\love1.jpg");
        byte[] bytes = FileUtils.readFileToByteArray(file);
        String s = fastDFSClient.uploadFile(bytes, "jpg");
        System.out.println(s);
    }

}
