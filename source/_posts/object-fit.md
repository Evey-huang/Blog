---
title: CSS之object-fit
date: 2018-09-12 11:03:24
tags: object-fit
categories: css
---

CSS属性`object-fit`指定替换元素的内容应该如何适应到其使用的高度和宽度确定的框。



#### HTML

```html
<div class="box">
    <img src="UNADJUSTEDNONRAW_thumb_2d9.jpg" alt="" class="fill">
    <img src="UNADJUSTEDNONRAW_thumb_2d9.jpg" alt="contain" class="contain">
    <img src="UNADJUSTEDNONRAW_thumb_2d9.jpg" alt="cover" class="cover">
    <img src="UNADJUSTEDNONRAW_thumb_2d9.jpg" alt="none" class="none">
    <img src="UNADJUSTEDNONRAW_thumb_2d9.jpg" alt="scale-down" class="scale-down">
</div>
```



#### CSS

```css
.box {
    display: flex;
    justify-content: center;
}
img {
    width: 200px; 
    height: 200px; 
    background-color: #cd0000;
    margin: 30px;

}
.fill {
    object-fit: fill;
}
.contain {
    object-fit: contain;
}
.none {
    object-fit: none;
}
.scale-down {
    object-fit: scale-down;
}
```



#### 效果图

![](http://p1cjg886l.bkt.clouddn.com/object-fit.png)



#### fill

被替换的内容大小可以填充元素的内容框。整个对象将完全填充此框。如果对象的高宽比不匹配其框的宽高比，那么该对象将被拉伸以适应。



#### contain

被替换的内容将被缩放，以在填充元素的内容框时保持其宽高比。整个对象在填充盒子的同时保留其长宽比，因此如果宽高比与框的宽高比不匹配，该对象将被添加“[黑边](https://zh.wikipedia.org/wiki/%E9%BB%91%E9%82%8A)”。



#### cover

被替换的内容大小保持其宽高比，同时填充元素的整个内容框。如果对象的宽高比与盒子的宽高比不匹配，该对象将被裁剪以适应。



#### none

被替换的内容尺寸不会被改变。



#### scale-down

内容的尺寸就像是指定咯`none`或`contain`，取决于哪一个将导致更小的对象尺寸。



### 浏览器兼容

- IE全家不兼容
- Chrome29+兼容
- Safari7.1+IOS8+兼容