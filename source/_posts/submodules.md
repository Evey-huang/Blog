---
title: Submodules子模块解决Hexo第三方主题同步更新问题
date: 2018-01-24 16:10:17
tags: [git, submodule]
categories: git
---



### 现象

从远程仓库clone到本地的hexo博客无法启动，提示“WARN：NO layout：index”

### 问题

hexo博客的next主题不能更新到远程仓库（github），远程仓库的主题文件夹为空。

### 解决方案

### 一：重新clone一个新的next主题到本地

弊端：每次都要这么做，如果你的主题有自定义，那么每次都要更新配置文件，因为重新clone下来的主题是初始的。

```shell
$ git clone https://github.com/Evey-huang/Hexo-Blog.git
$ cd Hexo-Blog
$ npm install
$ rm -rf themes/next/
$ git clone https://github.com/Evey-huang/hexo-theme-next.git themes/next
$ hexo g
$ hexo s
```

更改主题配置，加上自定义配置，刷新。



### 二：使用git submodules管理子模块

```shell
$ git clone https://github.com/Evey-huang/Hexo-Blog.git
$ cd Hexo-Blog
$ npm install
$ rm -rf themes/next/
$ git submodule add https://github.com/Evey-huang/hexo-theme-next.git themes/next
```

#### Q1:

```
'themes/next' already exists in the index
```

##### 解决方案：

```shell
$ git rm -r --cached themes/next
```

然后再次执行：

```shell
$ git submodule add https://github.com/Evey-huang/hexo-theme-next.git themes/next
$ hexo g
$ hexo s
```

更改主题配置，加上自定义配置，刷新

修改.git/config

修改.git/module/themes/next/config

在themes/next提交配置到Github

```shell
$ git add .
$ git commit -m "update"
$ git push origin master
```

在另一台电脑上

执行：

```shell
$ git clone https://github.com/Evey-huang/Blog.git
$ cd Blog
$ git submodule update --init
$ cd themes/next
$ git pull origin master
```

