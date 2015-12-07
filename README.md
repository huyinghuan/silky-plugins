##Silky 插件说明

1. 每增加有一个插件，请更新本文件进行插件使用（包括配置）说明．

### livereload

Author: ec.huyinghuan@gmail.com

Desc: 页面自动更新

安装
```
silky install livereload
```

使用，在.silky/config.js中修改如下部分

```
  ......
  //插件的配置
  plugins: {
      ......
      "livereload": {
          "exts": ['less', 'coffee', 'hbs', 'html', 'css', 'js', 'htm', 'handlebars', 'scss'] #需要监控变化的文件后缀
      }
      ......
  },
  ......
```