---
title: HTML5隐藏video控件的下载按钮
date: 2018-09-07 17:25:41
tags: [HTML, video]
categories: HTML
---

今天需要给官网添加视频，添加完之后发现不需要下载按钮，所以需要隐藏掉，踩了点坑这里记录一下。

### 正确示范

- nodownload

  > 设置是否去除去除下载按钮nodownload

```html
<video src="video.mp4" controls controlslist="nodownload"></video>
```

[参考地址](http://codehtml.cn/front-end-demo/#/video)



### 错误示范（敲重点！没用！！没用！！！）

#### css方法

```css
video {
    width: 100%;
    &::-webkit-media-controls {
        overflow: hidden !important;
    }
    &::-webkit-media-controls-enclosure {
        width: calc(100% + 15px);
        margin-left: auto;
    }
}
```

