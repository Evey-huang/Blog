---
title: CSS中的尺寸单位
date: 2018-08-30 17:28:11
tags: [css, px, pt, rem, vh, vw, calc]
categories: css
---

# CSS中的尺寸单位

整理一下日常会用到的css尺寸/长度单位。

## 概览

#### 绝对单位

- px:：Pixel 像素
- pt：Points 磅

#### 相对单位

- %：百分比
- rem：Root element meter 根据根文档（body/html）字体计算尺寸
- vh：View height 可视范围高度
- vw：View width 可视范围宽度

#### 运算

- calc：calculate 四则运算

## 详细

#### 绝对单位

1. px-Pixel像素：像素px相对于设备显示器屏幕分辨率而言。

```css
p {
    font-size: 14px
}
```

1. pt-Point 磅：3pt = 4px

```css
p {
    font-size: 10pt
}
```



#### 相对单位

1. %百分比：相对于父元素宽度

```css
<body>
  <div class="parent">
    <div class="children"></div>
  </div>
</body>

<style>
.parent {
    width: 100px
}
.children {
    width: 50% // children的宽度为50px
}
</style>
```



1. em-Element meter：根据文档计算尺寸

相对于当前文档对象内文本的字体尺寸而言，若未指定字体大小则继承自上级元素，以此类推，直至body，若body未指定则为浏览器默认大小。

```css
<body>
  <div class="element"></div>
</body>

<style>
.body {
    font-size: 14px
}
.element {
    font-size: 16px
    width: 2em // 2em === 32px
}
</style>
```



1. rem-Root element meter：根据根文档（body/html）字体计算尺寸

相对于根文档对象（body/html）内文本的字体尺寸而言，若未指定字体大小则继承为浏览器默认字体大小。

```css
<body>
  <div class="element"></div>
</body>

<style>
.body {
    font-size: 14px
}
.element {
    font-size: 16px
    width: 2em // 2em === 28px
}
</style>
```



1. vh-View heigh/vw-View width：可视范围

相对于可视范围的高度和宽度，可视范围被均分为100单位的vh/vw；可视范围是指屏幕可见范围，不是父元素的，百分比是相对于包含它的最近的父元素的高度和宽度。

假设设备可视范围为高度900px，宽度750px，则`1vh = 900px/100 = 9px, 1vw = 750px/100 = 7.5px`

```css
<body>
  <h1>article title</h1>
  <div class="element"></div>
  <div class="full-height"></div>
</body>

<style>
.element {
    width: 500vw;
    height: 80vh;
    // 如果屏幕高度为1000px，则该元素高度为800px，vw同理
}
.full-height {
    height: 100vh; // 轻易实现了与屏幕同等高度的元素
}
h1 {
    width: 100vw; // 设置一个和屏幕同宽的标题，标题的字体大小就会自动根据浏览器的宽度进行缩放，以达到字体和viewport大小同步的效果
}
</style>
```



#### 运算

1. calc-calculate：四则运算

用于动态计算长度值。

calc运算规则：

- 需要注意的是，运算符前后都需要保留一个空格；
- 任何长度值都可以使用calc()函数进行计算；
- calc()函数支持 "+", "-", "*", "/" 运算；
- calc()函数使用标准的数学运算优先级规则；

```css
<body>
  <div class="calc"></div>
</body>

<style>
.calc {
    width: calc(100%-50px);
    // 宽度为100%-50px
}
</style>
```

