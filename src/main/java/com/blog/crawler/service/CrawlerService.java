package com.blog.crawler.service;

import com.blog.crawler.domain.PictureInfo;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @program: crawler
 * @description
 * @author: wl
 * @create: 2021-01-12 17:56
 **/
@Service
public class CrawlerService {

    @Resource(name = "crawlerTemplate")
    private MongoTemplate crawlerTemplate;
    @Resource(name = "crawlerGridFs")
    private GridFsTemplate crawlerGridFs;

    //https://www.yeitu.net/tag/nvyanyuan/
    // 地址http://www.netbian.com/meinv
    //https://unsplash.com/images/feelings/happy
    //https://stocksnap.io/search/wallpaper
    //https://visualhunt.com/photos/travel/
    private static final String URL = "https://cupcake.nilssonlee.se/";
    // 编码
    private static final String ECODING = "utf-8";
    // 获取img标签正则
    private static final String IMGURL_REG = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
//    private static final String IMGURL_REG = "<img.*src=(.*?)[^>]*?>";
    // 获取src路径的正则
//    private static final String IMGSRC_REG = "(?x)(src|SRC|background|BACKGROUND)=('|\")/?(([\\w-]+/)*([\\w-]+\\.(jpg|JPG|png|PNG|gif|GIF)))('|\")";
//    private static final String IMGSRC_REG = "[a-zA-z]+://[^\\s]*";
    private static final String IMGSRC_REG = "[a-zA-z]+://[^\\s]*";
    private static final String IMGALT_REG = "^alt=*\"$";
    private static final String IMGTITLE_REG = "^alt=*\"$";
    // img本地保存路径
    private static final String SAVE_PATH = "E:\\crawler\\img";

    private static final String AURL_REG = "<a.*href\\s*=\\s*(.*?)[^>]*?>";

    /**
     * @param url      要抓取的网页地址
     * @param encoding 要抓取网页编码
     * @return
     */
    public String getHtmlResourceByUrl(String url, String encoding) {
        URL urlObj = null;
        HttpURLConnection uc = null;
        InputStreamReader isr = null;
        BufferedReader reader = null;
        StringBuffer buffer = new StringBuffer();
        // 建立网络连接
        try {
            urlObj = new URL(url);
            // 打开网络连接
            uc =(HttpURLConnection) urlObj.openConnection();
//            uc.setRequestProperty("Accept","text/html");
//            uc.setRequestProperty("Accept-Charset", "utf-8");
//            uc.setRequestProperty("Accept-Encoding", "gzip");
//            uc.setRequestProperty("Accept-Language", "zh-CN,zh");
            uc.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
            // 建立文件输入流
            isr = new InputStreamReader(uc.getInputStream(), encoding);
            // 建立缓存导入 将网页源代码下载下来
            reader = new BufferedReader(isr);
            // 临时
            String temp = null;
            while ((temp = reader.readLine()) != null) {// 一次读一行 只要不为空就说明没读完继续读
                // System.out.println(temp+"\n");
                buffer.append(temp + "\n");
            }
            System.out.println("爬取结束:"+buffer.toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关流
            if (isr != null) {
                try {
                    isr.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer.toString();
    }

    /**
     * 获取网页代码保存到本地
     *
     * @param url 网络地址
     * @param encoding 编码格式
     *
     */
    public void getJobInfo(String url, String encoding) {
        // 拿到网页源代码
        String html = getHtmlResourceByUrl(url, encoding);
        try {
            File fp = new File("E:\\crawler\\codeing.txt");
            //判断创建文件是否存在
            if (fp.exists()) {
                fp.mkdirs();
            }
            OutputStream os = new FileOutputStream(fp);          //建立文件输出流
            os.write(html.getBytes());
            os.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 下载图片
     *
     * @param listImgSrc
     */
    public void Download(List<PictureInfo> listImgSrc) {
        int count = 0;
        try {
            for (int i = 0; i < listImgSrc.size(); i++) {
                try {
                    PictureInfo pictureInfo = listImgSrc.get(i);
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
                    // 1K的数据缓冲
                    byte[] bs = new byte[1024];
                    // 读取到的数据长度
                    int len;
                    // 输出的文件流
                    String src = url.substring(URL.length());
                    int index = src.lastIndexOf('/');
                    String fileName = src.substring(0, index + 1);
                    File sf = new File(SAVE_PATH + fileName);
                    if (!sf.exists()) {
                        sf.mkdirs();
                    }
                    OutputStream os = new FileOutputStream(sf.getPath() + "\\" + imageName);
                    System.out.println(++count + ".开始下载:" + url);
                    // 开始读取
                    while ((len = is.read(bs)) != -1) {
                        os.write(bs, 0, len);
                    }
                    // 完毕，关闭所有链接
                    os.close();
                    is.close();
                    System.out.println(imageName + ":--下载完成");
                    pictureInfo.setImgName(imageName);
                    String md5 = DigestUtils.md5DigestAsHex(new FileInputStream(sf.getPath() + "\\" + imageName));
                    pictureInfo.setMd5(md5);
                    try {
                        crawlerTemplate.insert(pictureInfo, "t_picture");
                        crawlerGridFs.store(new FileInputStream(sf.getPath() + "\\" + imageName), imageName);
                    } catch (Exception e) {
                        System.out.println("唯一索引"+e);
                    }
                    Thread.sleep(1500);
                } catch (IOException e) {
                    System.out.println("下载错误"+e);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("下载失败"+e);
        }
    }

    /**
     * 得到网页中图片的地址-推荐
     * 使用jsoup
     * @param htmlStr html字符串
     * @return List<String>
     */
    public List<PictureInfo> getImgStrJsoup(String htmlStr) {
        List<PictureInfo> pics = new ArrayList<PictureInfo>();
        //获取网页的document树
        Document imgDoc = Jsoup.parse(htmlStr);
        //获取所有的img
        Elements alts = imgDoc.select("img[src]");
        for (Element alt : alts) {
            PictureInfo p=new PictureInfo();
            p.setSrc(alt.attr("src"));
            p.setAlt(alt.attr("alt"));
            p.setTitle(alt.attr("title"));
            pics.add(p);
        }
        return pics;
    }

    /**
     * 得到网页中图片的地址
     * 使用正则
     * @param htmlStr html字符串
     * @return List<String>
     */
    public List<PictureInfo> getImgStrRegix(String htmlStr) {
        List<PictureInfo> pics = new ArrayList<PictureInfo>();
        String img = null;
        Pattern p_image;
        Matcher m_image;
        p_image = Pattern.compile(IMGURL_REG, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            // 得到<img />数据-多个img
            img = m_image.group(0);
            // 匹配<img>中的src数据
            Matcher m = Pattern.compile(IMGSRC_REG).matcher(img);
            while (m.find()) {
                PictureInfo p=new PictureInfo();
                String imgUrl = m.group(0);
                if(StringUtils.isEmpty(imgUrl)){
                    continue;
                }
                if(imgUrl.startsWith("\"")||imgUrl.startsWith("\'")||imgUrl.endsWith("\"")||imgUrl.endsWith("\'")){
                    imgUrl=imgUrl.replace("\"", "").replace("\'", "");
                }
                //判断是否有http://+网址
                if (!imgUrl.contains("http://") && !imgUrl.contains("https://")) {
                    imgUrl = URL + imgUrl;
                }
                p.setSrc(imgUrl);
                pics.add(p);
            }
        }
        return pics;
    }

    /**
     * 下载css文件
     *
     * @param URL 网络地址
     */
    private void DownCss(String URL) throws ClientProtocolException, IOException {
        // 创建httpclient实例
        CloseableHttpClient httpclient = HttpClients.createDefault();
        // 创建httpget实例
        HttpGet httpget = new HttpGet(URL);
        // 执行get请求
        CloseableHttpResponse response = httpclient.execute(httpget);
        HttpEntity entity = response.getEntity();
        // 获取返回实体
        String content = EntityUtils.toString(entity, ECODING);
        // 解析网页 得到文档对象
        Document doc = Jsoup.parse(content);
        // 获取指定的 <img />
        Elements elements = doc.select("head link");
        for (int i = 0; i < elements.size(); i++) {
            Element element = elements.get(i);
            // 获取 <img /> 的 src
            String url = element.attr("href");
            // 再发请求最简单了，并由于该链接是没有 https:开头的，得人工补全 ✔
            HttpGet PicturehttpGet = new HttpGet(URL + url);
            CloseableHttpResponse pictureResponse = httpclient.execute(PicturehttpGet);
            HttpEntity pictureEntity = pictureResponse.getEntity();
            InputStream inputStream = pictureEntity.getContent();
            // 使用 common-io 下载图片到本地，注意图片名不能重复 ✔
            //获取url字符串最后一个/之后的所有，也就是图片名称和格式
            String css = url.substring(url.lastIndexOf("/") + 1);
            FileUtils.copyToFile(inputStream, new File("e://cskt//templates//css//" + css));
            pictureResponse.close(); // pictureResponse关闭
        }
        response.close(); // response关闭
        httpclient.close(); // httpClient关闭
    }

    public static void main(String[] args) throws ClientProtocolException, IOException {
        //获得html文本内容
//        String HTML = CrawlerService.getHtmlResourceByUrl(URL, ECODING);
        //获取图片src的url地址
//        List<String> imgSrc = CrawlerService.getImgStr(HTML);
        //下载图片
//        CrawlerService.Download(imgSrc);
        //下载css样式
//        CrawlerService.DownCss(URL);
        //保存网页源码
//        getJobInfo(URL, ECODING);
    }


}
