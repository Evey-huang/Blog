---
title: 仿ISUX网站动画之图片从左到右加载动画
date: 2018-04-27 15:51:59
tags: [css, 动画]
categories: css
---

## 背景

最近看到[ISUX](https://isux.tencent.com/)网站动画做的很好看，于是想着能不能实现。现在实现的是图片从左到右加载动画和hover时图片放大。

## 实现

由于我真的录不好屏幕所以没有po出gif图，只能丢链接，想看效果的[戳这里](https://codepen.io/evey-huang/pen/rvWxeL)

**HTML**

```html
<div class="pic-showclip-test">
  <div class="pic-showclip"></div>
</div>
```

**CSS(SCSS)**

```scss
@mixin pic-showclip($url, $width: 100vw, $height: 100vh, $time: 0.8s, $hover-time: 0.5s) {
  position: relative;
  padding-top: $height / $width * 100%;
  overflow: hidden;
  animation: pic-showclip-showup-#{$width} #{$time} forwards ease-out;
  @keyframes pic-showclip-showup-#{$width} {
    0%{
      opacity: 0;
      transform: translate3d(0, 20px, 0);
    }
    100%{
      opacity: 1;
      transform: translate3d(0, 0, 0);
    }
  }
  &::before {
    content: ' ';
    position: absolute;
    display: block;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url($url);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    animation: pic-showclip-showclip-#{$width} #{$time} forwards cubic-bezier(0, 0.3, 0.7, 1);
    @keyframes pic-showclip-showclip-#{$width} {
      0%{
        opacity: 0;
        clip: rect(0, 0, $height, 0);
      }
      100%{
        opacity: 1;
        clip: rect(0, $width, $height, 0);
      }
    }
    transform: scale(1);
    transition: all $hover-time ease;
  }
  // hover图片放大 
  &:hover {
    &::before {
      transform: scale(1.05);
    }
  }
 }
  .pic-showclip-test {
    max-width: 1260px;
    margin: 0 auto;
    .pic-showclip {
      @include pic-showclip('http://p1cjg886l.bkt.clouddn.com/brands-1.jpg', 1260px, 606px, 0.8s);
    }
  }
```

## 原理

这里封装了一个动画函数名为`pic-showclip`，里面创建了一个动画名为`pic-showclip-showup-#{$width} `。

### animation

animation常用动画属性有：

>- animation-name: 规定需要绑定到选择器的 keyframe 名称。
>- animation-duration: 规定完成动画所花费的时间，以秒或毫秒计。
>- animation-timing-function：规定动画的速度曲线。
>- animation-delay：规定在动画开始之前的延迟。
>- animation-iteration-count：规定动画应该播放的次数。
>- animation-direction：规定是否应该轮流反向播放动画。
>- animation-fill-mode：规定动画在播放之前或之后，其动画效果是否可见。



#### animation-timing-function

`animation-timing-function`使用名为三次贝塞尔（Cubic Bezier）函数的数学函数。贝塞尔曲线通过控制曲线上的四个点（起始点、终止点以及两个相互分离的中间点）来创造、编辑图形，绘制出一条光滑曲线并以曲线的状态来反映动画过程中速度的变化。 

语法：

```css
animation-timing-function: value;
```



>其中value可取：
>
>- linear：动画从头到尾的速度是相同的。
>- ease：默认。动画以低速开始，然后加快，在结束前变慢。
>- ease-in：动画以低速开始。
>- ease-out：动画以低速结束。
>- ease-in-out：动画以低速开始和结束。
>- cubic-bezier(*x1*,*y1*,*x2*,*y2*)：在 cubic-bezier 函数中自己的值。可能的值是从 0 到 1 的数值。



以上几种预设速度`linear`、`ease-in`、`ease-out`、`ease-in-out`均可写成`cubic-bezier`格式：

- **linear**对应自定义cubic-bezier(0,0,1,1)，效果为匀速直线； 
- **ease** 对应自定义cubic-bezier(.25,.01,.25,1),效果为先慢后快再慢；
-  **ease-in**   对应自定义cubic-bezier(.42,0,1,1),效果为先慢后快； 
- **ease-out**   对应自定义cubic-bezier(0,0,.58,1),效果为先快后慢； 
- **ease-in-out**   对应自定义cubic-bezier(.42,0,.58,1),效果为先慢后快再慢。 



```scss
animation: pic-showclip-showclip-#{$width} #{$time} forwards cubic-bezier(0, 0.3, 0.7, 1);
```

`cubic-bezier(0, 0.3, 0.7, 1);`反映的效果是慢慢变快，平滑过渡



#### animation-fill-mode

`animation-fill-mode`规定动画在播放之前或之后，其动画效果是否可见。

语法是：

```css
animation-fill-mode : none | forwards | backwards | both;
```



>- none: 不改变默认行为。
>- forwards: 当动画完成后，保持最后一个属性值（在最后一个关键帧中定义）。
>- backwards: 在 animation-delay 所指定的一段时间内，在动画显示之前，应用开始属性值（在第一个关键帧中定义）。
>- both: 向前和向后填充模式都被应用。



### clip

clip属性的语法是这样定义的：

```
clip: <shape> | auto  
```

**注意**！！！**clip 属性仅在设置了 position: absolute | fixed 的元素上生效且`<shape>` 仅接受 `rect()` 矩形裁切**。

`rect()` 接受四个值：

```
clip: rect(<top>, <right>, <bottom>, <left>)  
```

其中`<top>` 和 `<bottom>` 指定相对于盒子上边框边界的偏移，`<right>` 和 `<left>` 指定了相对于盒子左边框边界的偏移。即可以把 `<top>` 和 `<bottom>` 想象成 Photoshop 中的水平参考线，`<right>` 和 `<left>` 是垂直参考线，而剪裁区域就是它们所围成的矩形区域。

**当 bottom <= top 或者 right <= left 时，裁切区域不显示**

```scss
@keyframes pic-showclip-showclip-#{$width} {
    0%{
        opacity: 0;
        clip: rect(0, 0, $height, 0);
    }
    100%{
        opacity: 1;
        clip: rect(0, $width, $height, 0);
    }
}
```

**<u>这段代码实现的功能就是先把一部分图片隐藏，然后平滑显示。</u>**

### transform

`scale`属性的语法为：

```
transform: scale(<x> [<y>])
```

通过scale()，根据给定的宽度（X 轴）和高度（Y 轴）参数，元素的尺寸会增加或减少。

```scss
&:hover {
    &::before {
        transform: scale(1.05);
    }
}
```

**<u>这段代码实现的功能是当图片hover时，图片放大1.05倍</u>**

