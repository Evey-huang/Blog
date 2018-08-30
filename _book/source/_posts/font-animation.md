---
title: 动画封装之字体动画
date: 2018-04-25 13:08:10
tags: [animation, 动画, css]
categories: css
---

### 背景

早上看到这个动画觉得好奇妙，然后官网又需要做优化，于是想想能不能封装起来用到官网乃至以后的项目中去。

![](http://p1cjg886l.bkt.clouddn.com/animation1.gif)

### 难点所在

一般来讲hover就是从哪里来，回哪里去，比如：

![](http://p1cjg886l.bkt.clouddn.com/animation2.gif)

现在的难点在于如何在hover离开的时候改变动画行进的方向。

hover动画可以分解为三个部分：

- hover进入状态
- hover停留状态
- hover离开状态

一般来说hover transition动画只有两种状态即正常状态和hover状态：正常状态->hover状态->正常状态

>div {
>
>…….
>
>}
>
>div:hover {
>
>…..
>
>}

**所以，必须要有一种方法能够使得hover动画进入与离开的状态产生两种不同的效果，实现：状态1->hover状态->状态2**



### 解决关键

实现本文开头的动画的关键点在于**使得hover动画的进入与离开产生不一样的效果**。使用`transform:scale()`和`transform-origin`可以实现这个效果。

#### transform:scale()实现线条运动

transform:scale()通俗来说是用于缩放，用官方的话说就是：

>CSS 函数 `scale()` 用于修改元素的大小。可以通过向量形式定义的缩放值来放大或缩小元素，同时可以在不同的方向设置不同的缩放值。

我们这里使用`transform: scaleX(0) `与 `transform: scaleX(1)`来改变线条的显示与隐藏。



#### transform-origin实现线条运动方向

官方解释：

>`transform-origin`属性可以使用一个，两个或三个值来指定，其中每个值都表示一个偏移量。 没有明确定义的偏移将重置为其对应的[初始值](https://developer.mozilla.org/zh-CN/docs/Web/CSS/initial_value)。
>
>如果定义了两个或更多值并且没有值的关键字，或者唯一使用的关键字是`center`，则第一个值表示水平偏移量，第二个值表示垂直偏移量。

我们给线条设置一个默认的transform-origin 记为状态1，hover时设置另一个不同的transform-origin 记为状态2，所以当我们hover时，会读取状态2的transform-origin，从原点放大至scaleX(1)，hover离开的时候读取状态1的transform-origin，从scaleX(1)状态缩小至该原点。



### 动画封装

**HTML**

```html
<div class="a">Hover Me</div>
```

**CSS(SCSS)**

```css
@mixin font-animation($color: #666, $border-color: #999) {
    position: relative;
    display: inline-block;
    cursor: pointer;
    color: rgba($color, .7);
    transition: all .5s;
    &::before {
      content: "";
      position: absolute;
      left: -5%;
      bottom: 0;
      width: 110%;
      transform: scaleX(0);
      height: 2px;
      background: $border-color;
      z-index: -1;
      transition: transform .5s;
      transform-origin: 100% 0;
    }
    &:hover {
      margin-left: .5em;
      color: $color;
      &::before {
        transform: scaleX(1);
        transform-origin: 0 0;
      }
  }
}
.a {
    @include font-animation
}
```

### 最后

可以感受一下`transition: transform .5s;`和`transition: all .5s;`的区别。

[demo戳这里](https://codepen.io/evey-huang/pen/OZXPQy)

