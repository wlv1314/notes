INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (16, 3, 'win7旗舰版系统怎么禁止远程桌面连接功能', '使用win7系统的用户都知道，它内置有远程桌面连接功能，可以方便远程操控计算机，但是这样也会给电脑带来了很大的不安全，如果你没有什么用的话，可以禁止远程桌面连接功能，下面以win7旗舰版系统为例，给大家分享一下禁止远程桌面连接功能的具体步骤吧。\r\n1、点击“开始——设置——控制面板——管理工具——服务”，本地计算机上的所有服务都显示出来了；\r\n2、找到名称为“Remote Registry Service”、描述为“允许远程注册表操作”的服务，右键点击，选择“属性”；\r\n3、在窗口中点击“常规——启动类型”，由原来的“自动”改为“已禁用”就好了。\r\n4、如果以后想启动此服务，选择“自动”即可。', '2019-09-09T17:51:38', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (18, 3, 'MySQL delete', '虽然现在数据库空间越来越大，但处理数据时候还是有要删除的时候，以下整理了一些最常用的删除语句。\r\n\r\n分成两种 一个是删除指定数据，另一个删除所有数据。\r\n\r\n一、删除指定数据\r\n\r\nDELETE FROM 表名 WHERE 列名=值；\r\n\r\nuse xxx;#进入数据库\r\nshow tables；#查看数据表\r\nselect * from xxx；\r\ndelete from xxx where xx=xx；\r\n如果DELETE FROM 表名 \r\n\r\n后面不加限制，将会删除所有数据，但表结构还在，数据可以找回。\r\n\r\n \r\n\r\n二、删除所有数据（而且找不回来）\r\n\r\nTRUNCATE TABLE 表名；\r\n\r\n \r\n\r\n二者的区别在于前者的表结构还在，数据能找回；truncate语句是直接把表drop掉，然后再创建新的空表格，删除的数据找不回，当然它的执行速度比delete快。\r\n\r\n ', '2020-05-21T11:30:04', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (19, 3, 'MySQL update', 'MySQL-UPDATE语句\r\n功能介绍：用于更新表中的现有数据。亦可用UPDATE语句来更改表中单个行，一组行或所有行的列值。\r\n\r\n复制代码\r\nMySQL-UPDATE语法：\r\n\r\nUPDATE [LOW_PRIORITY] [IGNORE] table_name \r\nSET \r\n    column_name1 = expr1,\r\n    column_name2 = expr2,\r\n    ...\r\nWHERE\r\n    condition;\r\n复制代码\r\n在上面UPDATE语句中：\r\n\r\n第一，在UPDATE关键字后面指定要更新数据的表名。\r\n\r\n第二，SET子句指定要修改的列和新值。要更新多个列，请使用以逗号分隔的列表。\r\n\r\n第三，使用WHERE语句中的条件指定要更新的行。\r\n\r\n    WHERE子句是可选的。 如果省略WHERE子句，则UPDATE语句将更新表中的所有行。\r\n\r\n \r\n\r\nMySQL-UPDATE多列\r\n更新多列中的值，需要在SET子句中指定分配。\r\n\r\n复制代码\r\n实例：\r\n\r\n更新了员工编号1056的姓氏和电子邮件列：\r\nUPDATE employees \r\nSET \r\n    lastname = \'Hill\',\r\n    email = \'mary.hill@yiibai.com\'\r\nWHERE\r\n    employeeNumber = 1056;\r\n复制代码\r\n \r\n\r\nMySQL-UPDATE JOIN语句\r\n在MySQL中，可以在UPDATE语句中使用JOIN子句执行跨表更新。\r\n\r\nJOIN语句作用：查询表中的行(在INNER JOIN的情况下)，\r\n\r\n                         查询另一个表中的相应行 (在LEFT JOIN的情况下)。\r\n\r\n复制代码\r\nUPDATE JOIN语法：\r\n\r\nUPDATE T1, T2,　　　　　　　　　　　　　　　　　　　　　　　　　　　　\r\n[INNER JOIN | LEFT JOIN] T1 ON T1.C1 = T2. C1　　　　　　　　　 \r\nSET T1.C2 = T2.C2, \r\n    T2.C3 = expr\r\nWHERE condition\r\n\r\nUPDATE JOIN语法说明：\r\n  第一，在UPDATE子句之后，指定主表(T1)和希望主表连接表(T2)。 \r\n\r\n  第二，指定一种要使用的连接，即INNER JOIN或LEFT JOIN和连接条件。JOIN子句必须出现在UPDATE子句之后。\r\n\r\n  第三，要为要更新的T1和/或T2表中的列分配新值。\r\n\r\n  第四，WHERE语句中的条件用于指定要更新的行。\r\n\r\n复制代码\r\n更新数据交叉表的另一种方法：\r\n\r\nUPDATE T1,T2\r\nINNER JOIN T2 ON T1.C1 = T2.C1\r\nSET T1.C2 = T2.C2,\r\n      T2.C3 = expr\r\nWHERE condition', '2020-05-21T13:34:24', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (22, 3, 'Thymeleaf的特点', 'Thymeleaf的特点\r\n动静结合：Thymeleaf 在有网络和无网络的环境下皆可运行，即它可以让美工在浏览器查看页面的静态效果，也可以让程序员在服务器查看带数据的动态页面效果。这是由于它支持 html 原型，然后在 html 标签里增加额外的属性来达到模板+数据的展示方式。浏览器解释 html 时会忽略未定义的标签属性，所以 thymeleaf 的模板可以静态地运行；当有数据返回到页面时，Thymeleaf 标签会动态地替换掉静态内容，使页面动态显示。\r\n\r\n开箱即用：它提供标准和spring标准两种方言，可以直接套用模板实现JSTL、 OGNL表达式效果，避免每天套模板、该jstl、改标签的困扰。同时开发人员也可以扩展和创建自定义的方言。\r\n\r\n多方言支持：Thymeleaf 提供spring标准方言和一个与 SpringMVC 完美集成的可选模块，可以快速的实现表单绑定、属性编辑器、国际化等功能。\r\n\r\n与SpringBoot完美整合，SpringBoot提供了Thymeleaf的默认配置，并且为Thymeleaf设置了视图解析器，我们可以像以前操作jsp一样来操作Thymeleaf。代码几乎没有任何区别，就是在模板语法上有区别。', '2020-05-21T14:54:45', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (23, 3, 'EasyUIDataGridResult', '// ***********************************************\r\n//\r\n// 文件名(FileName)：EasyUIDataGridResult.java\r\n//\r\n// 功能描述(Description)：easyUI可接受的分页信息\r\n//\r\n// 数据表\r\n//\r\n// 作者(Author)：王亮\r\n//\r\n// 创建日期(Created Date)：2019-10-18\r\n//\r\n// 修改记录(Revision Record)：\r\n//\r\n// ***********************************************\r\npackage pbs.provider.feeshow.vo;\r\n\r\nimport java.io.Serializable;\r\nimport java.util.List;\r\n\r\n/**\r\n * easyUI可接受的分页信息\r\n * @program: clear\r\n * @description easyUI可接受的\r\n * @author: wl\r\n * @create: 2019-08-28 10:22\r\n **/\r\npublic class EasyUIDataGridResult<T> implements Serializable {\r\n\r\n    private static final long serialVersionUID = -8208262154585726692L;\r\n    /**\r\n     * 分页查询的结果总数\r\n     */\r\n    private long total;\r\n    /**\r\n     * 分页查询的结果集\r\n     */\r\n    private List<T> rows;\r\n\r\n    public EasyUIDataGridResult() {\r\n        super();\r\n    }\r\n    public EasyUIDataGridResult(long total, List<T> rows) {\r\n        super();\r\n        this.total = total;\r\n        this.rows = rows;\r\n    }\r\n    public long getTotal() {\r\n        return total;\r\n    }\r\n    public void setTotal(long total) {\r\n        this.total = total;\r\n    }\r\n    public List<T> getRows() {\r\n        return rows;\r\n    }\r\n    public void setRows(List<T> rows) {\r\n        this.rows = rows;\r\n    }\r\n}\r\n', '2020-05-21T15:27:34', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (24, 3, 'Page', '// ***********************************************\r\n//\r\n// 文件名(FileName)：EasyUIDataGridResult.java\r\n//\r\n// 功能描述(Description)：分页的类\r\n//\r\n// 数据表\r\n//\r\n// 作者(Author)：王亮\r\n//\r\n// 创建日期(Created Date)：2019-10-18\r\n//\r\n// 修改记录(Revision Record)：\r\n//\r\n// ***********************************************\r\npackage pbs.provider.feeshow.vo;\r\n\r\nimport java.io.Serializable;\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\n\r\n/**\r\n * 分页的类\r\n * @program: issue_demo\r\n * @description 分页\r\n * @author: wl\r\n * @create: 2019-08-28 10:24\r\n **/\r\npublic class Page<T> implements Serializable {\r\n    public static final int DEFAULT_PAGE_SIZE = 10;\r\n    private static final long serialVersionUID = -4761542745560471766L;\r\n    /**\r\n     * 每页显示个数\r\n     */\r\n    private int pageSize;\r\n    /**\r\n     * 当前页数\r\n     */\r\n    private int currentPage;\r\n    /**\r\n     * 总页数\r\n     */\r\n    private int totalPage;\r\n    /**\r\n     * 总记录数\r\n     */\r\n    private long total;\r\n    /**\r\n     * 结果列表\r\n     */\r\n    private List<T> rows = new ArrayList<T>();\r\n\r\n    public Page(){\r\n        this.currentPage = 1;\r\n        this.pageSize = DEFAULT_PAGE_SIZE;\r\n    }\r\n    public Page(int currentPage,int pageSize){\r\n        this.currentPage=currentPage<=0?1:currentPage;\r\n        this.pageSize=pageSize<=0?1:pageSize;\r\n    }\r\n    public int getPageSize() {\r\n        return pageSize;\r\n    }\r\n    public void setPageSize(int pageSize) {\r\n        this.pageSize = pageSize;\r\n    }\r\n    public int getCurrentPage() {\r\n        return currentPage;\r\n    }\r\n    public void setCurrentPage(int currentPage) {\r\n        this.currentPage = currentPage;\r\n    }\r\n    public int getTotalPage() {\r\n        return totalPage;\r\n    }\r\n    public void setTotalPage(int totalPage) {\r\n        this.totalPage = totalPage;\r\n    }\r\n    public long getTotal() {\r\n        return total;\r\n    }\r\n    public void setTotal(long total) {\r\n        this.total = total;\r\n    }\r\n    public List<T> getRows() {\r\n        return rows;\r\n    }\r\n    public void setRows(List<T> rows) {\r\n        this.rows = rows;\r\n    }\r\n    /**\r\n     * 设置结果集及总页数\r\n     * @param rows\r\n     */\r\n    public void build(List<T> rows) {\r\n        this.setRows(rows);\r\n        long count =  this.getTotal();\r\n        int divisor = (int) (count / this.getPageSize());\r\n        int remainder = (int) (count % this.getPageSize());\r\n        this.setTotalPage(remainder == 0 ? divisor == 0 ? 1 : divisor : divisor + 1);\r\n    }\r\n}\r\n', '2020-05-21T15:27:58', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (25, 3, 'AmountParseUtil', '// ***********************************************\r\n//\r\n// 文件名(FileName)：AmountParseUtil.java\r\n//\r\n// 功能描述(Description)：金额转换的工具类\r\n//\r\n// 数据表\r\n//\r\n// 作者(Author)：王亮\r\n//\r\n// 创建日期(Created Date)：2019-10-18\r\n//\r\n// 修改记录(Revision Record)：\r\n//\r\n// ***********************************************\r\npackage pbs.provider.feeshow.utils;\r\n\r\nimport java.math.BigDecimal;\r\n\r\n/**\r\n * 金额转换的工具类\r\n * @program: pbs\r\n * @description\r\n * @author: wl\r\n * @create: 2019-08-12 13:38\r\n **/\r\npublic class AmountParseUtil {\r\n    /**\r\n     * 分转元\r\n     * @param amount 分\r\n     * @return      元\r\n     */\r\n    public static String fenParseYuan(Long amount) {\r\n        if (amount == null) {\r\n            return \"0.00\";\r\n        } else {\r\n            String amountString = amount.toString();\r\n            Boolean isNeg = false;\r\n            if (amountString.contains(\"-\")) {\r\n                isNeg = true;\r\n                amountString = amountString.replace(\"-\", \"\");\r\n            }\r\n            int length = amountString.length();\r\n\r\n            switch (length) {\r\n                case 1:\r\n                    amountString = new StringBuilder(\"0.0\").append(amountString).toString();\r\n                    break;\r\n                case 2:\r\n                    amountString = new StringBuilder(\"0.\").append(amountString).toString();\r\n                    break;\r\n                default:\r\n                    amountString = amountString.substring(0, length - 2) + \".\" + amountString.substring(length - 2, length);\r\n                    break;\r\n            }\r\n            return isNeg ? new StringBuilder(\"-\").append(amountString).toString() : amountString;\r\n        }\r\n    }\r\n\r\n    /**\r\n     * 元转分\r\n     * @param amountStr 元\r\n     * @return 分-long\r\n     */\r\n    public static long yuanParseFen(String amountStr){\r\n        return new BigDecimal(amountStr).multiply(new BigDecimal(100)).longValue();\r\n    }\r\n\r\n    /**\r\n     * 元转分\r\n     * @param yuan\r\n     * @return\r\n     */\r\n    public static Long yuanTofen(String yuan){\r\n        return new BigDecimal(yuan).multiply(new BigDecimal(100)).longValue();\r\n    }\r\n}\r\n', '2020-05-21T15:28:22', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (28, 3, '你若留白，圆满自来', '中国画的高超，胜在留白。\r\n\r\n苏轼这样评价：“萧散简远，妙在笔墨之外。”寥寥数笔，于方寸之间勾勒天地，于无画之处生妙境。\r\n\r\n留白，是画作的艺术手法，更是人生的圆满之道。\r\n\r\n01\r\n留白，让生命做减法\r\n\r\n庄子说：“虚室生白，吉祥止止。”\r\n\r\n意思是：只有空的房间才会显得敞亮，如果房间里堆满了东西，光线就透不进去。\r\n\r\n人的心好比是房子。把心里的杂物和垃圾清走，把蒙蔽心灵的尘埃扫空，心境便会变得清澈明朗，吉祥福祉就会很快降临。\r\n\r\n虚寂生智慧，空旷生明朗。留白并不是空白，而是在空白的空间里，韵味无限。\r\n\r\n留白，是一种心境，更是一种生活态度。\r\n\r\n在台湾有个春余园子，主人叫唐白余，80岁。\r\n\r\n早前，唐白余在台北开了家餐馆，日日爆满。别人都羡慕他生意好，后来他却跑到山郊里，建了座园子。\r\n\r\n园子很是清净，草丛里隐着小路，房间多是宽敞的，摆设也不多，但是窗开得很大，一抬头就是远处的青山白云。\r\n\r\n闲时他就坐在巨石上，捧着一本书，看着蓝天远山。那些曾经忙碌喧嚣的日子，恍如隔世。唯有当下这份闲适的生活，才是真真切切的。\r\n\r\n唐白余说：“活了大半辈子，会发现有些东西是可以舍弃的；留下的，就是最重要的那个。”\r\n\r\n“留白，是一种减法的美”，随着年龄的增长，经历过的事多了，要懂得过一种简单、朴素的生活。\r\n\r\n留白，在取舍之道。当生命学会了做减法，化繁为简，便会发现：那些曾经觉得非追不可的事物，都是浮云。\r\n\r\n最后留下来的，就是最重要、最珍贵的。\r\n\r\n02\r\n留白，生活的美学\r\n\r\n林语堂曾说：“看到天上的云彩，原来生命别太拥挤，得空点。”\r\n\r\n生活中不少人把行程塞得满满的，每天疲于奔波，为名忙为利忙，却忘了家人、健康和生命的美好。\r\n\r\n陈道明在演艺圈中的实力有目共睹，邀请他的片约也从不间断。\r\n\r\n他本人很喜爱演戏，也大可以把工作都安排得满满的，但他没有这么做，他总会留出陪伴家人的时间。\r\n\r\n陈道明描述过一个很美的画面：“有时我们夫妻俩就同坐窗下，她绣她的花草，我裁我的皮包。窗外落叶无声，屋内时光静好，很有一种让人心动的美感。\r\n\r\n“水满则溢”，生命也需要留白，学会不让自己的时间变得拥挤不堪，留一些来陪陪家人，也放空自己。\r\n\r\n给生命留白，就是给生活的美好腾出空间。\r\n\r\n《小窗幽记》里说：“凡事留不尽之意则机圆，凡物留不尽之意则用裕，凡情留不尽之意则味深，凡言留不尽之意则致远。”\r\n\r\n为人处世，不求穷尽，是大智慧。\r\n\r\n下围棋的时候，与敌手周旋，团团围困对方而不留余地，可能反而堵住了自己的路，作茧自缚。\r\n\r\n给别人留点后路，在全身而退之余，也更有取胜的机会。 \r\n\r\n与人交往，要懂得留白，保持合理的距离。\r\n\r\n父母与子女之间，互相尊重对方的生活；给朋友的建议，点到为止；夫妻之间，要讲一个“敬”字。\r\n\r\n距离产生美。看似有点疏远，实则是给彼此一个恰到好处的空间，相互欣赏、相互体谅，感情得以持久生香。\r\n\r\n经营生活的美学在于留白，做事留有三分余地，才会有无限生机。\r\n\r\n03\r\n在留白中，感悟圆满\r\n\r\n古人讲：“月满则亏，物极必反。”\r\n\r\n生活中，人们常常追求一种“完满”的状态，不想留有遗憾；凡事都想尽善尽美，但结果总不尽人意。\r\n\r\n苏轼在词里写过：“人有悲欢离合，月有阴晴圆缺，此事古难全。”\r\n\r\n生活的真相就是如此，并没有完美可言。\r\n\r\n花半开最美，情留白最浓。只有懂得欣赏那半开的花，才是人生最美的体验。\r\n\r\n著名的雕塑作品《断臂的维纳斯》，手臂的残缺，却能让人联想到无数种手臂的美；\r\n\r\n看似是缺憾，却是一种别样的留白，成就了另一种意义上的完美。\r\n\r\n在深夜绽放的昙花，它的美只能持续一瞬间。\r\n\r\n看似是遗憾，却是一种时光的留白。正因为只有一瞬，才让那种惊艳，化作了永恒的绝美。\r\n\r\n生命也是如此，正是人生中有过的那些遗憾，才会让这趟旅程变得“圆满”。\r\n\r\n那些至纯至真的情感，才是生命旅途上的留白，惊艳了时光。\r\n\r\n花开一季，人活一世，你若留白，圆满自来。', '2020-05-21T15:45:27', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (30, 3, '把生活的一切经营好，一切听从天意', '人世间的一切，冥冥之中，皆是定数！得到也好，失去也好，拥有也好，没有也罢，要相信，这一切都是上天最好的安排，顺其自然就好。\r\n\r\n金钱财富，皆是上天的注定，有的人生来就大富大贵，而有的人生来穷苦，上天赠予给你的，谁也抢不走，若是上天不给你，你争破头也赢不来。人的一生，不要欲望太强，平凡也是幸福，过好自己的小日子就好！\r\n\r\n人与人之间的缘分，都是上天冥冥之中的安排，真心爱你的人，不会随意放手，离开你，而不爱的人，你留也留不住。人呐，这一辈子，无论你遇见了谁，又或者错过了谁，不要太过执着，一切随缘就好，若是揪着不放，最后苦的是你自己，只有把心空出来才会与幸福不期而遇。\r\n\r\n生命中的所得与所失，皆是上天最好的安排。属于你的，不会变，不是你的，强求也不会有，这一切都是已经安排好的，我们能做的不是强求，而是接受已然发生的。尽自己最大的努力，珍惜当下，把当下过好，过得精彩，然后顺其自然，不伤春悲秋，不纠缠！\r\n\r\n功名，皆是上天冥冥之中的注定，命里有时终须有，命里无时莫强求，不是你的，争来终究不踏实，是他人的，争来依然会走。\r\n\r\n生命，皆是注定，生老病死，谁都躲不过，谁也避不开。这世间，谁都不能长生不老，我们能做的，只有珍惜当下的每天，珍惜眼前人，做好眼前事。\r\n\r\n人的一生，不管是金钱财富，还是名利权势，无论是感情，还是生死，这都是上天冥冥之中注定的，把心放宽，一切顺其自然就好。\r\n\r\n世间万事万物，一切自有定数，不管发生什么，不管遇到什么，请一定要相信，这一切都是你命中注定要经历的，这是上天给你最好的安排。\r\n\r\n人这一辈子，缘分得失，皆由天定，生死离别，皆是注定，不如坦然自若地接受命运的安排，把生活的一切经营好，一切听从天意！', '2020-05-21T15:57:43', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (31, 3, '香港美人迟暮', '最近看到林青霞怀念李菁的文章，有些唏嘘。\r\n\r\n对很多年轻人来说，李菁可能属于古早明星，可能都不知道她是谁，更不知当年她曾令林青霞望都不敢望，“太耀眼，太红了”。\r\n\r\n写这篇文章的林青霞，已经65岁了。\r\n\r\n\r\n这几年，偶尔看到林青霞照片。她一袭旗袍，依然端庄大气，确实“美人在骨不在皮”，岁月从不败美人。\r\n\r\n不禁回忆起上世纪八九十年代的香港，那时美女云集，林青霞、张曼玉、钟楚红、王祖贤……相比现在人工修饰后的美女们，其实她们都不算很完美，但美得各有特色，芳华绝代。\r\n\r\n\r\n如今，她们几乎纷纷息影，有的远走他国，有的回归家庭⋯⋯美人迟暮，唯剩那时同样鼎盛的香港电影纪录下她们美得惊心动魄的样子。\r\n\r\n（本文所讲香港美人，未必出身于香港，而是指由香港电影而被人们所熟知的她们）\r\n\r\n\r\n林青霞\r\n美而不自知\r\n\r\n据说，香港电影史最难忘的四个镜头是：林青霞喝酒、王祖贤脱衣、邱淑贞咬牌、朱茵眨眼。\r\n\r\n\r\n\r\n林青霞的美，在于骨相，身材比例好，穿什么都好看。长相几乎毫无瑕疵，随便拍都美，非要挑剔的话是有点三白眼。\r\n\r\n重要的是，她的气质可柔可刚。徐克说她是50年才出一个的美人，连出口刻薄的师太亦舒也对她连连赞叹。\r\n\r\n\r\n\r\n在琼瑶剧《窗外》里出道的她，双目含情，是清纯动人的女孩。\r\n\r\n\r\n在《刀马旦》里，她女扮男装，英气逼人。\r\n\r\n\r\n在《红尘滚滚》里，她是多愁善感的女作家沈韶华。\r\n\r\n\r\n在《笑傲江湖》中，她演了东方不败，雌雄莫辨，一袭红衣，仰头喝酒，成就华语电影史上的经典。\r\n\r\n\r\n可是，林青霞的美，在于“美得无懈可击的同时却不自知。”她甚至觉得自己不够好看，也不觉得美是有标准的。\r\n\r\n如今的她，已经转身为作家，一支笔，淡淡写道香江三十年的人事沧桑，隐忍，悲悯。\r\n\r\n\r\n\r\n张曼玉\r\n美在岁月里\r\n\r\n张曼玉的美，是靠时间和经历一点点走来。\r\n\r\n出道时，她是香港小姐亚军，笑起来两个小虎牙，明亮可人。但，在美女如云的时代，少了点什么。\r\n\r\n\r\n\r\n直到演了王家卫的《旺角卡门》，那一滴徐徐落下的眼泪，不仅打开了张曼玉演技的天花板，更让她找到了属于自己的美。\r\n\r\n\r\n在《新龙门客栈》里，她是风骚泼辣的老板娘金镶玉，媚眼一勾，让无数男人着迷。\r\n\r\n\r\n在《青蛇》里，她是妖娆大胆的青蛇，敢爱敢恨。\r\n\r\n\r\n在《东邪西毒》里，她是为爱自缚，赌上一生等待的大嫂。\r\n\r\n\r\n在《阮玲玉》中，她是飘渺哀伤的阮玲玉。\r\n\r\n\r\n但在《花样年华》里，她又是那个将旗袍演绎得淋漓尽致的苏丽珍，万种风情。\r\n\r\n\r\n张曼玉的美，还在于性格真实可爱。当年记者问她为什么参加港姐，她说是因为爱慕虚荣。是啊，大凡没有点虚荣心，谁中意抛头露面？\r\n\r\n\r\n这几年的张曼玉，迷上了唱歌，大大咧咧地跑上音乐节，唱成了车祸现场。大家捏一把汗，女神这样下去晚节不保，赶紧收山吧。\r\n\r\n结果张曼玉自己无所谓，现在唱得不好就继续努力咯！一如她以前演戏，演不好就继续努力。大有当年港人的生活之道：现实很残酷，但自信努力可改变未来。\r\n\r\n\r\n\r\n王祖贤\r\n不食人间烟火的仙气\r\n\r\n很久以前看过王祖贤的古早采访，她穿着一件紫色小背心，披着一头浓密秀发，边走路边聊天。美得如出水芙蓉，过目难忘。\r\n\r\n她从小喜欢运动，打得一手好篮球。大长腿，平黑浓眉，有点轻微龅牙。如果放在今天，王祖贤未必会被认为美女，可能会被叫去整形。\r\n\r\n\r\n一开始，大家都觉得她长得偏西方，不适合演古装，但是她自荐出演徐克的《倩女幽魂》，一身长衫披上，惊艳全场。眼神如怨如诉，就是不食人间烟火，集鬼魅仙气于一身的聂小倩。\r\n\r\n\r\n从此，王祖贤之后再无小倩。凭借此片，王祖贤红遍亚洲。据说韩国人喜欢平眉，就是受了她的影响。\r\n\r\n现在的王祖贤，在与齐秦二十多年情感纠葛之后，远走加拿大。偶尔流传一两张照片，不再那么年轻貌美，但也舒服自在，希望这是她想要的平静吧。\r\n\r\n\r\n\r\n钟楚红\r\n香港的玛丽莲梦露\r\n\r\n香港人有一句话：“再红红不过钟楚红，再发发不过周润发。”\r\n\r\n钟楚红，又称红姑，是一个连张国荣都夸得她“靓”的人，举手投足间有一种天然的性感，被誉为“香港的玛丽莲梦露”。\r\n\r\n\r\n她总是留着一头标志性的卷发，明明下巴偏短，显得脸有点方圆，可是却有一种原始的性感，妩媚的女人味。\r\n\r\n\r\n可是红姑并不觉得自己有美得那么多，她说是“比平凡好一些，但不是真的漂亮那么多。”可能也是如此，她身上也有一种邻家的气息。\r\n\r\n钟楚红的颜值巅峰，是《纵横四海》里的红豆妹妹。看动图，才能看出她的一颦一笑，美得有多么颠倒众生。\r\n\r\n\r\n这也是她息影前的最后一部电影。之后，她便回归家庭，与一生挚爱朱家鼎在一起。\r\n\r\n\r\n丈夫离世后，她便一人独自生活，做自己喜欢的事，偶尔出来参加活动。\r\n\r\n即使有了皱纹，钟楚红依然明艳动人，每次出现都能引起一波回忆杀，美成了传说。\r\n\r\n\r\n\r\n\r\n关之琳\r\n梦中情人十三姨\r\n\r\n年轻的关之琳，没有人会说她不美，有“香港第一美女”之称，曾被美国《人物》杂志为“全球50位最美丽的名人”。\r\n\r\n黄霑说关之琳的眼睛会放电，“她瞟一眼过来，十个男人有十一个会糊里糊涂自作多情起来。”\r\n\r\n\r\n最美的时刻当属她在《黄飞鸿》里的十三姨。徐克（对，又是徐老怪，他真的太懂挖掘女明星另一面的美）为了塑造人物性格，不让她化妆。\r\n\r\n\r\n所以，整部戏里，关之琳几乎素颜出镜，只抹了一点口红。水汪汪的猫眼，樱桃小嘴，桃心脸，试问有几个少男不曾把她当作梦中情人？\r\n\r\n现在的她，在两度离异后一直单身，偶尔复出活动，昔日风华已不在。\r\n\r\n\r\n\r\n\r\n邱淑贞\r\n全香港男人的欲望\r\n\r\n邱淑贞，“全香港的欲望”。\r\n\r\n\r\n也许你不记得她的名字，但看过这张照片绝对忘不了。《赌神2》里她一袭红衣，叼着扑克牌的姿态，撩了多少人的荷尔蒙？\r\n\r\n\r\n她的性感和红姑有所不同，钟楚红散发的是成熟女人味，邱淑贞却是性感与娇憨、女人与少女集一体。\r\n\r\n所以，她演得了《倚天屠龙记》的小昭，楚楚可怜，一声“公子”揉碎了多少人的心？\r\n\r\n\r\n\r\n如今，邱淑贞的女儿也已成年，有人说有她妈妈的美丽，但也有人说不及。但无论如何，邱淑贞的生活富足，面容依旧姣好，气质温婉。\r\n\r\n那娇俏性感的她，只能在老电影中可寻。\r\n\r\n\r\n\r\n张敏\r\n惊鸿一瞥成经典\r\n\r\n有人说，现在的女明星很多都是静态的美，而香港曾经的美女们，看静态是好看，但要看动态才觉得惊艳。她们的美，是灵动的，有生命力的。\r\n\r\n比如张敏在《倚天屠龙记》里演的赵敏，不过骑在白马上的惊鸿一瞥，那一瞬间的回眸，那一刻的英姿飒爽，勾走了多少人的心？\r\n\r\n\r\n按理说，张敏也不属于五官完美的，比如上下唇比例稍微失调，下唇有点外翻，脸有点窄长。\r\n\r\n\r\n但正因为这样，她长得更有英气，有棱角分明的美，同时厚唇让她又显性感，可攻可媚。\r\n\r\n现在的张敏，一心修佛。之前有传闻说考虑复出，但后面不了了之。或许她更享受现在安静的生活吧。\r\n\r\n\r\n\r\n赵雅芝\r\n美是一辈子的事\r\n\r\n很多人都说她是不老女神，很多人记住她是她去台湾拍的那部《新白娘子传奇》，但其实赵雅芝是港姐出道，拿了殿军，“最上镜小姐”。\r\n\r\n\r\n1980年，她和发哥拍了《新上海滩》，冯程程成为许多人的梦中情人。\r\n\r\n\r\n赵雅芝的美，是非常东方式的。金庸先生便评价她代表东方之美。情人的娇美，妻子的温柔，母亲的坚韧，都在赵雅芝身上予以体现了。\r\n\r\n\r\n如今的她，生活上伉俪情深，家庭和睦，也经常活跃在舞台上。虽然不再年轻，但气质依然高雅。\r\n\r\n\r\n\r\n朱茵\r\n无人超越的紫霞仙子\r\n\r\n朱茵眨眼，这一幕我也就看了一百回吧。\r\n\r\n\r\n有人说，朱茵很幸运，在合适的年纪遇到合适的角色——《大话西游》中的紫霞仙子。\r\n\r\n\r\n眼波流转，期待心上人时，眼睛里仿佛有星光。面对喜欢的人时，她的爱在眼里流露，天地之间，她这颗星只为他闪耀。\r\n\r\n当爱情失落时，她的星光仿佛就此淡落。\r\n\r\n\r\n很多人都为朱茵的紫霞仙子着迷，惊叹她的演技。但其实，那时候她与周星驰的三年地下情，正面临分手的危机。\r\n\r\n“我的意中人是个盖世英雄，有一天他会踩着七色云彩来娶我，不过，我只猜中了开头，却猜不中这结局。”\r\n\r\n戏如人生。\r\n\r\n\r\n\r\n\r\n李嘉欣\r\n美则美矣，毫无灵魂\r\n\r\n李嘉欣参选港姐时，一贯毒辣的港媒用了四个字形容她：“石破天惊。”\r\n\r\n所以那一年的港姐，毫无悬念。\r\n\r\n李嘉欣是中葡混血，高鼻高眉深目，异常美艳。她的美像一幅油彩壁画，有东方女子的娴静，亦有西方女子的明朗。她在《方世玉》中，一颦一笑，倾倒众生。\r\n\r\n\r\n相比起林青霞、张曼玉的美而不自知，而李嘉欣知道自己美，她曾在采访中说喜欢美丽是人之常情。当年她和倪震谈恋爱，其姑姑亦舒在书中描述了一个很像她的人，评价道：“美则美矣，毫无灵魂。”\r\n\r\n\r\n不知是不是如此，她明明长得360度无死角，在拍戏中却被称作“木头美人”，私以为《海上花》中的李嘉欣，算是比较有灵气的了。\r\n\r\n\r\n如今，李嘉欣已嫁人，儿子也快十岁了，过着富太太的生活。她时不时出来一些活动，还是依然光彩照人，甚至比以前更欧美感，但不知为何还是更喜欢她过去的美貌。\r\n\r\n\r\n在写这篇文章的时候，传来香港海洋公园近几年入不敷出，或将倒闭的消息。\r\n\r\n如今，香港已不复昨日的荣光。这几年香港小姐的选拔，总被群嘲。香港电影也逐渐式微，今年的金像奖更让许多人伤逝。\r\n\r\n当年叱诧香江的风流人物，或已驾鹤仙去，或已退隐、 不问人事。这些曾经为我们开启美的启蒙的女神们，纷纷迟暮，只剩下一段段江湖传说。再望来路，后继无人。\r\n\r\n为什么我们那么怀念那个风华正茂的香港？那时的她，真的是东方之珠，弹丸之地却极尽发展，东西方文化在此交融、并蓄，无数能人汇聚于此，谈笑风声间，出手就是巅峰。\r\n\r\n\r\n这些令我们念念不忘的美人们，也是可中可西，宜古宜今，亦正亦邪，可温柔可英气。她们的美，不是只有少女感，不是扁平化，不是千篇一律的，微有瑕疵，甚至瑕疵成就了她们每个人的特别之处。\r\n\r\n木心曾说过，美貌是一种表情。\r\n\r\n\r\n她们的美，灵动茂盛，带着属于那个年代的蓬勃生机。是的，蓬勃生机，带着一种活泼泼的生命力。\r\n\r\n我们怀念的、感慨的、爱着的，其实是那份在香港狮子山下长出来的野蛮生气，是兼收并蓄的大方自信，是大方做自己的从容之美，是无论怎样都要开心，相信努力就可改变命运的精气神……\r\n', '2020-05-26T14:48:18', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (32, 3, '一个人的修养', '顾炎武曰：“人之为学，不可自小，又不可自大。”\r\n\r\n人，不可把自己看得太轻，容易自卑，也不可把自己看得太重，容易自负。\r\n\r\n人人生而平等，不可太把自己当回事。\r\n\r\n那些拼命炫耀的资本，或许大部分人都有，不可盲目炫耀，落人笑柄。\r\n\r\n世界甚大，怀揣着谦卑为人处世，才能走得更远。\r\n\r\n01\r\n做人，要有自知之明\r\n\r\n《师说》有云：“闻道有先后，术业有专攻。”\r\n\r\n人各有所长，亦有所短。\r\n\r\n在处理某件事情上不如我们的人多如牛毛，胜于我们的人触目皆是。\r\n\r\n略胜一筹，不必沾沾自喜；稍逊一筹，不必黯然魂销。\r\n\r\n人活于世，不可肆意比较，扰乱情绪；不可自高自大，自以为是。\r\n\r\n迈兹纳说：\r\n\r\n“不要把自己看得太重要，没有你，事情一样可以做得好。”\r\n\r\n甚至，做得更好。\r\n\r\n地球不会因为缺了谁而停止转动，轰动一时的新闻终将被人遗忘。\r\n\r\n每个人，都渺小如尘埃，所作所为只会影响爱我们的人，或是存在利益关系的人。\r\n\r\n其他看似受到我们影响的人，只是我们成了他们闲谈的话题罢了。\r\n\r\n做人，要有自知之明，要以客观的心态看待自己，才能活得轻松、过得踏实。\r\n\r\n02\r\n认真做事，低调做人\r\n\r\n卡耐基说：\r\n\r\n“天下最悲哀的人莫过于本身没有足以炫耀的优点，却又将其可怜的自卑感，以令人生厌的自大、自夸来掩饰。”\r\n\r\n拼命炫耀的，正是欠缺的。\r\n\r\n学识渊博的人仍在知识的田间默默耕耘，才疏学浅的人却到处炫耀自己今天看了半本书；\r\n\r\n富人在默默赚钱，穷人却炫耀起了奢侈品；\r\n\r\n冠军在为下一次比赛作准备，亚军却炫耀自己得了银牌。\r\n\r\n真正有本事的人，往往都是默默无闻的，因为他们总在别人看不见的地方积蓄着能量。\r\n\r\n《道德经》有云：“光而不耀。”\r\n\r\n内心成熟的人，从不过度炫耀，从不以强光耀眼他人。\r\n\r\n不必炫耀钱财，都是身外之物；\r\n\r\n不必炫耀本事，人人各有所长；\r\n\r\n不必炫耀感情，人心深不可测；\r\n\r\n不必炫耀容颜，岁月催人老去。\r\n\r\n……\r\n\r\n人活一世，要认真做事，更要低调做人，不露锋芒，是一种极高的处世智慧。\r\n\r\n03\r\n谦卑，一个人最顶级的修养\r\n\r\n斯大林说：\r\n\r\n“无论乌鸦怎样用孔雀的羽毛来装饰自己，乌鸦毕竟是乌鸦。”\r\n\r\n就算用再好听的词汇去描述原本丑陋不堪的人，仍会使人难以接受。\r\n\r\n如同精美的家具放在毛胚房里一般，会显得格格不入。\r\n\r\n说得好不如做得好，做得好不如过得好。\r\n\r\n曾国藩说：“谦卑含容是贵相。”\r\n\r\n谦卑，是一种成熟，是一个人最顶级的修养，因淡泊而大度，因豁达而从容。\r\n\r\n人，修养境界越高，越谦卑无华。\r\n\r\n正所谓“人外有人，天外有天”。\r\n\r\n永远不要和别人比，因为自己才是进行比较的最佳对象。\r\n\r\n把与人攀比、炫耀的时间积攒起来，多些自省，日臻完善自我，才能成为一个更好的人。\r\n\r\n毛泽东说：“谦虚使人进步，骄傲使人落后。”\r\n\r\n生而为人，别太张扬，容易挥霍精力，蹉跎时光。\r\n\r\n人间难得走一遭，心怀谦卑，脚踏实地，方可过好每一天。\r\n\r\n以谦卑处世，把自己放在低位，更容易走上巅峰。', '2020-05-26T15:00:29', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (38, 3, '知识水平越低，人生越儿戏', '认知水平越低，越把错误当时尚\r\n\r\n在网上看到一个未成年女孩的故事，既哀其不幸，又怒其愚昧。\r\n\r\n女孩怀孕了，在家人的陪伴下去医院人流，医生出于善意劝她不要再流产，并耐心告诫她流产的危害。\r\n\r\n哪知，女孩十分不耐烦，抢过医生的笔，对妈妈吼道：“有什么好说的？你赶紧签字！我只请到两天假，回去就要模拟考试了！”\r\n\r\n生命和健康在女孩眼里，连一场模拟考都敌不过。\r\n\r\n妈妈试图再次劝说女孩，女孩勃然大怒，将笔摔在桌上，“不签我就把它生下来，以后你们来养行不行？我都做了好几次了，不就睡一觉的事儿么？你磨磨唧唧干嘛呢！”\r\n\r\n在女孩眼里，睡觉和堕胎，就像每天吃饭喝水一样稀松平常。\r\n\r\n术后，医生耐心教她科学避孕，以及如何在性中保护自己，反被女孩嘲讽：“大清都亡了几百年了，你们还是遗民思想，这样的医生真可怕。”\r\n\r\n《庄子·秋水》篇说：“井蛙不可以语于海，夏虫不可以语于冰。”\r\n\r\n井底之蛙没有见过大海，夏生秋死的虫子没见过冰雪，如果你和它们谈海，谈冰，它们只会觉得你胡编乱造。\r\n\r\n同样的，一个人见识短浅，认知低下，就容易耳目闭塞，把良言当毒酒，把好心当驴肝，不断在低配的选择中消磨生命，变得平庸而愚昧。\r\n\r\n就像这个女孩，不听劝诫，把滚床单当作爱情，把人流当作时尚，自以为站在思想新潮的高点，指责医生和家人思想陈腐，说到底，是因为她认知水平低下，才会把世界理解得似是而非。\r\n\r\n认知水平越低，人生越儿戏。\r\n\r\n02\r\n认知水平越低，越把自我当圆心\r\n\r\n傅盛曾说：“认知，几乎是人和人之间唯一的本质差别。”\r\n\r\n一个人对外部世界的反应，源于他的认知模式。认知越低的人，越偏激，容易以自我为中心，把自己的逻辑当成世界的法则，盲目抵触外界的善意。\r\n\r\n就如拿刀追砍前夫的张雨绮，在她看来，自己是敢爱敢恨，是独立新女性。但当时她的经纪公司老板却直言：“她最大的难题在于，她以为她明白，其实她不明白，所谓明白，是知行合一。”\r\n\r\n经纪人劝她谨言慎行，她觉得道理都懂，自信能演到80岁，但行为上却依旧横冲直撞，把自己的逻辑当作世界的法则，结果“创造出一个机会，又迎来一个困境”，团队付出的努力，都用在了替她填坑上。\r\n\r\n当公司安排街采让她直面真相，她却觉得那些不认识她，认为她演技不佳、炒作的人都是恶意重伤她，拒绝反思任何负面评论。\r\n\r\n最终，商务问询停了，客户也都走了。一个没有业务和曝光的艺人，价值就会滑铁卢。\r\n\r\n心理学上有个著名理论“达克效应”：每个人在评估自己时，都偏向于高估。而且当一个人能力越差，高估越严重。\r\n\r\n换而言之，越无能，自我认知偏差越大。同样，认知偏差越大，越容易自以为是，以“我”为中心自我封闭，拒绝学习和改进。\r\n\r\n却不知，当你圈地为牢，世界也在远离你。\r\n\r\n03\r\n认知水平越低，越把情绪当准绳\r\n\r\n90后，平均7个月就离职；00后，平均不到5个月。\r\n\r\n频繁离职的职场青年们觉得，作为时代新青年，他们是在勇敢追梦，提倡享受工作，工作要兼具有趣、有闲、有钱、还要有爱。\r\n\r\n正是这样的认知，才使得他们情感脆弱，情绪多变，稍感压力或不顺心，就对公司、领导、同事心生怨念，感觉自己是备受欺负的小白兔。\r\n\r\n去年，因为同事没给自己买奶茶，没和自己牵手上厕所，就把同事怼到热搜的“鹿慢慢”，就是这样。\r\n\r\n在她的认知里，公司应该像家一样轻松随意，同事应该像室友一样贴心周到。正因如此，在面对现实与想象的巨大落差时，情绪全面崩溃，并以受害者姿态，在网上对同事狂轰滥炸。\r\n\r\n而一个认知成熟的职场人，知道职场是战场，不是游乐场，有趣、有钱、有闲、有爱不是职场标配，大部分人只能选择其中一两样，剩下的全靠自己平衡和拼搏。同事是战友，不是保姆，需要的是高效配合，不是漫长的情感铺垫。\r\n\r\n认知不足的人，看不到问题的本质，容易被情绪操控，习惯胡搅蛮缠，最后将自己逼入窘境，难以自拔。\r\n\r\n《人民的名义》中，大风厂职工王文革，辛苦一生的股权被奸商骗走，他想到的第一件事，不是合理维权，而是闯进退休老干部陈岩石家中，将刀架在他脖子上威胁。\r\n\r\n情绪失控，最终导致他和奸商一起入狱。\r\n\r\n认知不足的人，以为情绪能够解决问题，最终不过是被情绪支配，将自己变成了闹剧。\r\n\r\n04\r\n所谓成长，就是不断地认知升级\r\n\r\n马里奥·普佐在《教父》中说：“在一秒钟内看到本质的人和花半辈子也看不清一件事本质的人，自然是不一样的命运。”\r\n\r\n简而言之，认知决定命运。\r\n\r\n认知越高，看待事物的眼光越全面越长远，对事情的判断越接近事实的本质。认知越低，目光就会锁死眼前的蝇头小利，而忽略了远期的风险。\r\n\r\n听过这样一个故事：\r\n\r\n两个年轻人，结伴去京城打工，经过一个树林时，救下了被捕兽钳夹伤的狐仙，狐仙答应实现他们每人一个愿望作为报答。\r\n\r\n一个人说：我要富可敌国的财富。另一个人说：我要万夫莫及的智慧。\r\n\r\n拥有财富的年轻人，因挥霍无度，经商被骗，露富被劫，不过几年，就穷困潦倒，露宿街头。而拥有智慧的年轻人，通过不断的学习和努力，成了京城第一富商。\r\n\r\n人生最大的窘困就是认知贫穷。\r\n\r\n背景、人脉、财富等外在资源，固然可以为人生锦上添花，但决定人生高低的是认知水平。德不配位，财不配智，就算一时顺风顺水，也难以抵御往后的风浪。\r\n\r\n认知水平高的人，越能发现自身的不足，保持谦逊、开放的心态，不断精进技能，丰富精神，在与外界的一次次碰撞中淬炼自己。\r\n\r\n所谓成长，就是不断升级认知。\r\n\r\n敢于正视自己的不足，不断开阔并丰富自己的内心；保持开放的心态，积极学习，多见世面，你的认知才会不断地更新迭代。\r\n\r\n认知，就像漏斗，越往下越狭隘，越往上越开阔。\r\n\r\n站在智慧之巅，才能览世间百态。', '2020-05-26T17:35:56', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (39, 3, '无法重来的一生，好好爱自己', '2020年这个珍惜年，\r\n有太多猝不及防的聚散离合。\r\n持续的疫情，未知的一切。\r\n时刻都在提醒我们：\r\n世事无常，万望珍惜。\r\n走好眼前路，珍惜眼前人。\r\n\r\n生活需要一点仪式感，\r\n在这个特殊的520，\r\n无论你善不善于表达，\r\n都请敞开心扉表达你的爱；\r\n在这个特殊的521，\r\n无论以哪种形式，\r\n都请爱得比昨天更多一点；\r\n从今往后的每一天，\r\n都请爱你所爱，行你所行，\r\n今天要比昨天好，明天比今天好。\r\n\r\n01\r\n致家人\r\n\r\n在外，所有人都关心你飞的高不高；回家，他们会关心你飞得累不累。\r\n\r\n家，是生命旅途出发的起点，也是随时可以回去的归途。\r\n\r\n恰如王小波所说：“到了中年以后，才觉得世界上除了家人，已经一无所有了。”\r\n\r\n岁月见长，越发理解家人是生命给我们最奢侈的礼物：\r\n\r\n挣钱借钱太难，但家人的口袋却对你无偿敞开；\r\n虚情假意太多，但家人却对你一直掏心掏肺；\r\n成长太狼狈，但父母却一直允许你做个孩子……\r\n\r\n“父母是孩子前半生唯一的观众，而孩子是父母后半生唯一的观众。”作为子女，请不要代替时代抛弃父母；作为父母，请用爱去滋养你的孩子。\r\n\r\n从今天开始，你把温柔煮成粥，把最好的脾气，最大的耐心，最温暖的一面多分给最亲的亲人。\r\n\r\n三餐四季，一家人，在一起过好每一天。\r\n\r\n家人安康，灯火可亲，便是人间好光景。\r\n\r\n02\r\n致爱人\r\n\r\n感情不负一时容易，不负一生太难。\r\n\r\n人生海海，遇见已是莫大的幸运，相爱相知更是难能可贵。\r\n\r\n感谢缘分，让我们相遇；感谢你的包容，让我们相守，你走进我生命的每一天，我从来没羡慕过别人。\r\n\r\n过去的岁月，我们有争吵，有闹情绪，有猜疑，但所幸我们在一点点了解中，更懂得了彼此，也更加契合。\r\n\r\n陪伴是最长情的告白，人来人往，磕磕绊绊，很高兴这些年兜兜转转身边还是你。\r\n\r\n我也曾把我光阴浪费，甚至莽撞到视死如归，却因为爱上了你，才开始渴望长命百岁。\r\n\r\n有了爱的人，就有了盔甲，有了软肋，也开始渴望长命百岁。\r\n\r\n往后余生，让我们成为彼此的盔甲，一起抵御生活的兵荒马乱；让我们成为彼此的软肋，把对方放在心底最柔软位置。\r\n\r\n愿我们故事的结尾，是那句：“我们相爱一生，一生还是太短。”\r\n\r\n03\r\n致朋友\r\n\r\n有人说： \r\n\r\n朋友不需太多，三个就够，一个愿意在雨天借我雨伞，一个愿意在深夜陪我喝酒，一个肯参加我的葬礼。\r\n\r\n越成熟越知道，不是所有躺在朋友圈的都能叫朋友。\r\n\r\n真正好的友谊，都是无用的，真正的朋友，是在时间的洪流中走不散的。\r\n\r\n致雪中送炭的朋友：谢谢你在最困难的时候帮我一把，谢谢你每个寒冬的温暖。\r\n\r\n致超过3年友谊的朋友：谢谢你和我谈天说地，聊人生理想，谢谢你做我情绪的垃圾桶和加油站。\r\n\r\n致好久没联系的朋友：如果太久没联系，别担心，我们只是在各自生活中忙碌，但联不联系，都没忘记。\r\n\r\n致所有的朋友：不要害怕打扰我，其实我很乐意收到你的消息。\r\n\r\n有事没事记得聊聊近况，好吗？\r\n把明年过年见，改成下个节假日见，好吗？\r\n把改天好好聚聚，改成今天晚上一起吃饭好吗？\r\n\r\n04\r\n致生命里的过客\r\n\r\n网上有句很扎心的话：\r\n\r\n“捧在手里的是杯子，放手了就是玻璃碴子。”\r\n\r\n人生中归人太少，过客太多。所有错过的，既是错的，也是过的。\r\n\r\n你不快乐是因为常常因为不在意你的人而消耗着自己，你过不好现在，是因为时常怀念从前，频频回头。\r\n\r\n所以，不如从此刻起，下定决心说再见的人就真的再见，过期的感情，都统统打包丢掉，给时间一点时间，让过去成为过去。\r\n\r\n周国平说过一句很有道理的话：\r\n\r\n“对于人际关系，我逐渐总结出了一个原则，就是互相尊重，亲疏随缘。”\r\n\r\n每个出现在你生命里的人，都是为了给你上一课，不必遗憾，用心体味他教会你的一切，然后在体会之后平和的对自己说一句：\r\n\r\n“生命里的过客，谢谢你曾来，不遗憾你离开。”\r\n\r\n05\r\n致自己\r\n\r\n《你幸福了吗？》一书中，白岩松讲过“忙”字：\r\n\r\n“忙”就是“心”和“亡”字的组合，忙着忙着心就死了。\r\n\r\n太多时候，我们在忙碌中忘记欣赏生活，忘记去爱，忘记去感谢。\r\n\r\n忙碌巨大压力的日子里，请找个间隙给生活按下暂停键。好好去感谢，好好去爱，好好去体味细微生活的感动。\r\n\r\n提到感谢生命里的人，提到值得爱的人，我们脑子里有长长的清单，却也总容易遗漏一个最重要的人，那就是——自己。\r\n\r\n人最大的贵人是自己，最大的敌人也是自己。\r\n\r\n亲人，爱人，朋友，没有人能陪你走完一生，唯一能陪你走到最后的只有自己。\r\n\r\n当你不亏待自己身体，健康会帮你走更远的路；当你懂得好好爱自己，自爱会让你遇到世界的爱；当你做自己的朋友，生活会给你看不到的惊喜。\r\n\r\n无论何时，请把自己放在人生排序的第一位。\r\n\r\n无论如何，请学会有条件爱人，无条件爱自己。\r\n\r\n愿你，在节日没人给你送花的日子里，先给自己买花；\r\n\r\n愿你，在雨天没人给你送伞的日子里，活成自己的屋檐；\r\n\r\n愿你，在没人与你立黄昏问你粥可温的日子里，享受一日三餐，欣赏每个清晨黄昏……', '2020-05-26T17:44:16', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (40, 4, '逍遥，是彻底的心灵自由', '逍遥就是：你可以是鱼，你也可以是鸟；你可以是鲲，你也可以是鹏；你可以在水里游，你也可以在空中飞。“逍遥”是领悟到自己可以是你向往的自己，向往了几亿年。\r\n\r\n逍遥，是彻底的心灵自由。\r\n\r\n看到羡慕的生活，我们说：“好逍遥。”我们一定知道逍遥的意思吧。\r\n\r\n\r\n——蒋勋《 云淡风轻 》', '2020-05-27T16:56:21', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (41, 3, '断舍离', '人生其实就是一边拥有，一边失去的过程。\r\n\r\n许多人常常觉得获得不易，其实比获得更难的是断舍离，每一次抉择都是一次自我超越的过程，非常不易。\r\n\r\n断舍离是一种智慧，一种境界， 一种能力。一个人如果没有断舍离的过程，很难成长，也很难实现自我蜕变，实现人生的逆袭、华丽转身。\r\n\r\n01\r\n断\r\n\r\n断就是斩“断”物欲的意思。\r\n\r\n物质财富的追求总是无止境的，你就是整天二十四小时不休息，也很难把事情做完，做得十全十美，总是有遗憾，总会有不足，谁也无法改变。\r\n\r\n人生除了健康，其余都是浮云。我们要好好地活着，但也没有必要无限制地透支自己的身体健康去获取健康以外的幸福。\r\n\r\n学会以一种淡然的姿态面对人生，懂得放下，树立正确的“物质观”，在努力、尽力做好自己日常生活的同时，多去追求一些物质生活以外的东西，如亲情、友情、爱情、旅游、音乐、读书、慈善等精神方面的东西，你会感到更幸福。它会给你带去更多的快乐，让我们平淡的生活变得绘声绘色、有滋有味、丰盈、充实、难忘、更有意义。\r\n\r\n02\r\n舍\r\n\r\n舍就是“舍”弃废物。\r\n\r\n佛说：有舍有得，不舍不得，小舍小得，大舍大得。\r\n\r\n获得是一种能力，舍弃更是一种超能力。一个人不能丢掉该舍弃的东西，也很难会得到该得到的东西，让生活徒增一些不必要的忧虑和烦恼，实在是没有必要。\r\n\r\n生活中很多人习惯获得，不愿意舍弃，甚至包括一些对自己没有用的东西，结果不仅自己累，别人也会累。舍是更好得的前提与保证，愿我们懂得获得，也知道舍弃、放下，让人生过得轻松、有趣、真实，更像自己。\r\n\r\n03\r\n离\r\n\r\n离就是脱“离”执念。\r\n\r\n成功需要努力，但更需要选择。\r\n\r\n一个正确的选择会给你带去事半功倍的效果。尽管道路可能会坎坷、泥泞、荆棘，但只要有信心，义无反顾，勇往直前，肯定会有收获，肯定会有快乐，即使未能获得最后的成功，也一定会无怨无悔，幸福满满。\r\n\r\n相反，一个错误的选择，越是努力，离成功的距离会越远。停下来，反而是一种莫大的进步。\r\n\r\n人生不怕你做不到，就怕你想不到。换一种思维，就是一种新的人生。\r\n\r\n脱“离”执念，放飞自我，拓展思维，选择一条适合自己的道路，作坚持不懈的努力，是我们走向成功的起点与保证。', '2020-05-29T10:22:25', 1);
INSERT INTO `notes_essays` (`essaysId`, `userId`, `essaysTitle`, `essaysContent`, `createTime`, `checkPermissions`) VALUES (47, 3, '和明白人说话，和踏实人做事，和厚道人谈情', '心理学家阿德勒曾说：“人类所有的烦恼，均来自人际关系。”\r\n\r\n有人的地方就有江湖。对于人际关系没有清楚认知的人，总是会在生活中犯下这三种错误：\r\n\r\n一是与糊涂的人讲道理，二是跟不靠谱的人合作，三是和冷漠的人谈交情。\r\n\r\n结果就是，跟人打交道很费劲，投入再多时间精力也一无所获。\r\n\r\n与人相处，不管是为人还是做事，都要优选适合的对象，采用最佳的方式，才能让我们避免更多的麻烦。\r\n\r\n话，要和明白人说；事，要与踏实人做；情，要同厚道人谈。\r\n\r\n01\r\n和明白人说话，享受\r\n\r\n鲁迅曾经写过这样一个故事：\r\n\r\n有个奴才到处找人诉苦，他分别向聪明人和傻子抱怨主人对他的不公平。\r\n\r\n聪明人倾听完奴才的诉苦之后，作出悲悯和同情的样子，得到了奴才衷心的感谢。\r\n\r\n傻子听完之后却傻傻地以为奴才是真的想改变自己的处境，他想帮助奴才反抗主人压迫，便动手打了奴才的主人。不曾想，奴才竟大喊打“强盗”，和其他奴才一起将傻子赶走，还得意洋洋地向主人邀功请赏。\r\n\r\n常言道，“宁跟明白人吵架，不跟糊涂人说话。”\r\n\r\n同样的话，跟明白人说，哪怕是吵架，都是在讲道理的基础上争辩对错。而跟糊涂的人则不同，跟糊涂人打交道，就像面对一头猛兽。他们对人情事理几乎一窍不通，也听不明白道理，甚至不知道他什么时候会伤人。\r\n\r\n《论语》中记载过这样一句话：不可与之言而言，谓之失言。\r\n\r\n遇到不通透的人，有些话是不能说的。因为对方无法理解，说的再多也是对牛弹琴。\r\n\r\n但同样的话，跟明白人说，哪怕只是简单的一个字，也胜过千言万语。\r\n\r\n曾经见过这样一对老夫妻，两人相处快60年，早已了解彼此的生活习惯。爷爷一个“水”字，奶奶就会沏好一杯热茶，放了他老人家最爱的枸杞和菊花。奶奶一个“疼”字，爷爷就会颠颠儿地去拿奶奶的按摩仪，放到奶奶右肩。\r\n\r\n和明白人在一起，无需多说废话，点到即止就可以，一切都会水到渠成。\r\n\r\n“知我者谓我心忧，不知我者谓我何求”，说的就是如此吧。\r\n\r\n话，要和明白人说，才不会把自己想要进行的谈话弄得索然无味。\r\n\r\n02\r\n和踏实人做事，安心\r\n\r\n香港首富李嘉诚曾说：“做事要找靠谱的人，聪明的人只能聊聊天。”\r\n\r\n这个世界上，从来都不缺少聪明的人，稀缺的是为人处事都靠谱踏实之人。\r\n\r\n有一个老木匠，正准备告老还乡，但刚好有个客人要做一个精致的匣子，人手不够，老板便想让老木匠做完再走。\r\n\r\n老木匠想到老板对自己的知遇之恩，纠结一番后还是答应了。\r\n\r\n没想到，这一做，就做了整整六个月。\r\n\r\n在老木匠启程回老家的那一天，老板提着一份大礼，亲自上街相送，并且满怀感激地说：\r\n\r\n“我后来才知道那个大客人做的木匣子，原来是要送给宰相的，要是做不好，可能会惹来杀身之祸。幸好你一向踏实稳重，即使是要告老还乡了也没有敷衍了事，出品一如既往地好，今日我是来特地感谢你的。”\r\n\r\n生活中，能力出众的人并不少，可大多数人却更愿意选择和踏实的人共事。这大概是因为踏实的人，总能让人放心。\r\n\r\n曾国藩用人，便非常注重可靠。他对文官的要求是没有“官僚气”，不圆滑、不投机取巧。他选拔武将的标准则是“不急名利”“耐受辛苦”“踏实可靠”。\r\n\r\n任何时候，态度和人品永远都比能力重要。\r\n\r\n不踏实的人，就算能力再强，也有可能因为疏忽大意捅出大篓子，需要其他人不断地去弥补。 \r\n\r\n踏实的人做事认真，无论事情多小，都会尽心尽力地去完成。\r\n\r\n与踏实的人共事，自己才能安心。\r\n\r\n03\r\n和厚道人谈情，敞亮\r\n\r\n“人怕交错友，心怕给错人。”\r\n\r\n无论是对刚认识的人，还是多年的好友，即使我们付出真诚并不是为了得到什么，但总归是希望对方能够有情有义。\r\n\r\n若是遇上薄情寡义的人，再炽热的心，也会在一次次“我本将心向明月，奈何明月照沟渠”的伤害中，变得冰冷。\r\n\r\n而和厚道的人讲交情、谈感情，便会让人感受到人性真善美的那一面，感受到人间的温情和美好。\r\n\r\n一代艺术大家梅兰芳染上过白喉病的时候，时任军官的李宣倜曾出手帮助过梅兰芳，他本是出于爱才心切，并没有想过要梅兰芳报答。\r\n\r\n但世事无常，晚年的李宣倜妻离子散、财产散尽、无依无靠，自己蜗居在一间小公寓里。不再风光的他，人人避之唯恐不及。唯有梅兰芳，不但每月资助他一些生活费，还经常派弟子过去陪李宣倜聊天解闷，自己也是一有空便上门探望。\r\n\r\n直到李宣倜病重，梅兰芳仍旧守在床前，紧握住他的手，动情地说：“您放心，您的身后之事交给我！”\r\n\r\n李宣倜满含热泪地看着他，欣慰地点点头，随后安然离世。\r\n\r\n两个月后，梅兰芳也去世了。曾有人感叹，如果梅兰芳先于李宣倜去世，李宣倜可能连个送终的人都没有。\r\n\r\n是什么让梅兰芳对李宣倜这么好？是因为厚道。因为为人厚道，所以知恩图报。\r\n\r\n厚道的人，心中有情，品性正直，心地良善，重情重义。\r\n\r\n厚道之人，少伪装，多坦诚；少遮掩，多阳光。\r\n\r\n和厚道的人谈交情，讲感情，心中才会敞亮，也只有这样的人，才值得我们拿真心去相交。\r\n\r\n人这一生，会遇到形形色色的人，但将宝贵的时间花费在谁身上的选择权，永远掌握在自己手里。\r\n\r\n与明白人说话，知理明了晓事理。与踏实人共事，苦尽甘来事竟成。与厚道人谈情，高山流水不负君。\r\n\r\n把时间和感情花在对的人身上，才有意义。\r\n\r\n共勉。', '2020-05-29T13:38:52', 2);
