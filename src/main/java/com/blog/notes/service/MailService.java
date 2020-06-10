package com.blog.notes.service;

/**
 * @program: redis
 * @description
 * @author: wl
 * @create: 2019-06-06 15:42
 **/
public interface MailService {
    //简单文本邮件
    void sendSimpleMail(String to, String subject, String content);
    //html邮件
    void sendHTMLMail(String to, String subject, String content);
    //带附件的邮件
    void sendAttachmentsMail(String to, String subject, String content, String filePath);
    //带有静态资源的邮件
    void sendInlineResourceMail(String to, String subject, String content, String rscPath, String rscId);
}
