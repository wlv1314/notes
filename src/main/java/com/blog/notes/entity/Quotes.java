package com.blog.notes.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: notes
 * @description
 * @author: wl
 * @create: 2020-05-27 15:47
 **/
@Data
public class Quotes implements Serializable {

    private int quotesId;
    private String quotesAuthor;
    private String quotesContent;
}
