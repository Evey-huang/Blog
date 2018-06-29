---
title: Ubuntu下安装Typora
date: 2017-11-30 09:42:22
tags: [Typora, ubuntu]
categories: Ubuntu
---

## ![Typora](https://eveywongblog.files.wordpress.com/2017/10/typora.png)

# 简介

## Markdown

[Markdown](http://zh.wikipedia.org/wiki/Markdown) 是一种轻量级的「标记语言」，它用简洁的语法代替排版，而不像一般我们用的字处理软件 *Word* 或 *Pages* 有大量的排版、字体设置。它使我们专心于码字，用「标记」语法，来代替常见的排版格式。例如此文从内容到格式，甚至插图，键盘就可以通通搞定了，减少了鼠标的点击。目前来看，支持 Markdown 语法的编辑器有很多，但他们的交互形式基本都是将「[编辑](http://www.iplaysoft.com/tag/%E7%BC%96%E8%BE%91)」和「预览」分离开来的，要么是直接左右排列编辑和预览窗口，要么是要在两种模式之间来回切换，以前刚接触的时候常常被搞晕。后面电脑换了Linux系统以后觉得编辑文件没有这么方便于是就想下个编辑器来用，找了很久觉得Typora这个编辑器很简洁大方深得小仙女的心于是立马下载来用。

## Typora

Typora(<https://typora.io/>)不同于以往的markdown编辑器在于它只使用一个窗口，却能优雅地实现同时将代码编辑与预览「一体化」结合起来，从而为用户带来更加流畅直观的「所见即所得的 Markdown 写作体验」。Typora 即时显示 Markdown 语法格式的能力被官方称之为 WYSIWYG （What You See Is What You Get）。虽然一开始用觉得有点麻烦甚至想弃坑，但是用久了习惯了就会发现很好用很方便。正式开始用Typora还是在接触gitbook以后，想要写文章才想起来原来我有个markdown编辑器，于是就开造啦~

![Typora-GIF.gif](https://eveywongblog.files.wordpress.com/2017/10/typora-gif.gif)



# 安装

## 在Ubuntu下安装Typora

按照下列命令依次输入即可成功安装Typora，很幸运没有出现BUG最讨厌的就是BUG了。

安装成功以后找到Typora图标双击打开就可以用了，当然如果你很熟悉命令行模式那你也可以在命令行进行启动。

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
$ sudo add-apt-repository 'deb https://typora.io linux/'
$ sudo apt-get update
$ sudo apt-get install typora
```

# 用法

markdown啦当然用的markdown格式写咯