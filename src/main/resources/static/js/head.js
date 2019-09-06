$(document).ready(function () {
    var user=$("#userStatus").html();
    if(user!=null){
        var new_doc="<li class=\"dropdown\">\n" +
            "                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\"><span>您好:["+user+"]</span><span class=\"caret\"></span></a>\n" +
            "                    <ul class=\"dropdown-menu\">\n" +
            "                        <li><a href=\"#\">个人信息</a></li>\n" +
            "                        <li><a href=\"logout\">退出登录</a></li>\n" +
            "                    </ul>\n" +
            "                </li>"
        $("#lilogin").html("");
        $("#liregister").html("");
        $("#lilogin").parent().prepend(new_doc);
    }
});
