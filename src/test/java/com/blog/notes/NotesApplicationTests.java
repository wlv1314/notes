package com.blog.notes;

import com.blog.notes.dao.UserDao;
import com.blog.notes.entity.User;
import com.blog.notes.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NotesApplicationTests {

    @Resource
    private MailService mailService;
    @Resource
    private UserDao userDao;

    @Test
    public void contextLoads() {
        LocalDateTime now = LocalDateTime.now();
        for(int i=0;i<10000;i++) {
            List<User> emps=new ArrayList<User>();

            for(int j=0;j<1000;j++) {
                User emp=new User();
                emp.setUserName("test"+i+j);
                emp.setPassword("test"+j);
                emp.setEmail("11");
                emps.add(emp);
            }
            int changed=userDao.batchInsert(emps);
            System.out.println("#"+i+" changed="+changed);
        }
        LocalDateTime last = LocalDateTime.now();
        Duration between = Duration.between(now, last);
        System.out.println("耗时:"+between.toMinutes());
    }

}
