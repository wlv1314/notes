/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
    config.toolbarGroups = [
        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
        { name: 'links', groups: [ 'links' ] },
        { name: 'insert', groups: [ 'insert' ] },
        { name: 'forms', groups: [ 'forms' ] },
        { name: 'tools', groups: [ 'tools' ] },
        { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
        { name: 'others', groups: [ 'others' ] },
        '/',
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
        { name: 'styles', groups: [ 'styles' ] },
        { name: 'colors', groups: [ 'colors' ] },
        { name: 'about', groups: [ 'about' ] }
    ];
    config.removeButtons = 'Underline,Subscript,Superscript';
    //禁止拖拽改变尺寸
    config.resize_enabled = false;
    //删除底边栏
    config.removePlugins = 'elementspath';
    //禁止图片上传完毕后自动填充图片长和宽
    config.image_prefillDimensions = false;
    //其他插件：字数统计、提示信息
    // config.extraPlugins = 'wordcount,notification,notificationaggregator';
    //清空图片上传预览的内容
    config.image_previewText = ' ';
    //添加中文字体
    config.font_names="宋体/SimSun;新宋体/NSimSun;仿宋_GB2312/FangSong_GB2312;楷体_GB2312/KaiTi_GB2312;黑体/SimHei;微软雅黑/Microsoft YaHei;幼圆/YouYuan;华文彩云/STCaiyun;华文行楷/STXingkai;方正舒体/FZShuTi;方正姚体/FZYaoti;"+ config.font_names;
    //隐藏超链接与高级选项
    // config.removeDialogTabs = 'image:advanced;image:Link';
    //上传图片的地址
    config.filebrowserImageUploadUrl = "image/upload";
};
