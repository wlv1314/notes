// ***********************************************
//
// 文件名(FileName)：EasyUIDataGridResult.java
//
// 功能描述(Description)：分页的类
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
package com.blog.applet.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页的类
 * @program: issue_demo
 * @description 分页
 * @author: wl
 * @create: 2019-08-28 10:24
 **/
public class Page<T> implements Serializable {
    public static final int DEFAULT_PAGE_SIZE = 10;
    private static final long serialVersionUID = -4761542745560471766L;
    /**
     * 每页显示个数
     */
    private int pageSize;
    /**
     * 当前页数
     */
    private int currentPage;
    /**
     * 总页数
     */
    private int totalPage;
    /**
     * 总记录数
     */
    private long total;
    /**
     * 结果列表
     */
    private List<T> rows = new ArrayList<T>();

    public Page(){
        this.currentPage = 1;
        this.pageSize = DEFAULT_PAGE_SIZE;
    }
    public Page(int currentPage, int pageSize){
        this.currentPage=currentPage<=0?1:currentPage;
        this.pageSize=pageSize<=0?1:pageSize;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }
    public List<T> getRows() {
        return rows;
    }
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
    /**
     * 设置结果集及总页数
     * @param rows
     */
    public void build(List<T> rows) {
        this.setRows(rows);
        long count =  this.getTotal();
        int divisor = (int) (count / this.getPageSize());
        int remainder = (int) (count % this.getPageSize());
        this.setTotalPage(remainder == 0 ? divisor == 0 ? 1 : divisor : divisor + 1);
    }
}
