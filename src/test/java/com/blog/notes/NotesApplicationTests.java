package com.blog.notes;

import com.blog.notes.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NotesApplicationTests {

    @Resource
    private MailService mailService;

    @Test
    public void contextLoads() {
        mailService.sendSimpleMail("1245080925@qq.com", "随笔", "这是验证码");
    }

}
