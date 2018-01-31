---
title: Submodules子模块解决Hexo第三方主题同步更新问题
date: 2018-01-24 16:10:17
tags: [git, submodule]
categories: git
---

![最近的状态](http://p1cjg886l.bkt.clouddn.com/cry1.jpg)





## 现象

从远程仓库clone到本地的hexo博客无法启动，提示“WARN：NO layout：index”

## 问题

hexo博客的next主题不能更新到远程仓库（github），远程仓库的主题文件夹为空。

## 解决方案

### 一：重新clone一个新的next主题到本地

从github上clone博客代码到本地后，重新clone一次next主题到本地。

具体操作：

```shell
$ git clone https://github.com/Evey-huang/Blog.git (克隆远程代码到本地)
$ cd Blog (进入博客根目录)
$ npm install (视情况而定，安装依赖)
$ rm -rf themes/next/ (移除空的主题目录)
$ git clone https://github.com/Evey-huang/hexo-theme-next.git themes/next (克隆新的主题并指定本地存储目录为 themes/next)
$ hexo g (部署)
$ hexo s (启动)
```

弊端：每次都要这么做，如果你的主题有自定义，那么每次都要更新配置文件，因为重新clone下来的主题是初始的。



### 二：使用git submodule管理子模块

什么是[submodule](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97)？`git submodule`是一个多项目使用共同类库的工具，允许类库项目做为`repository`，子项目作为一个单独的`git项目`存在父项目中，子项目可以有自己独立的`commit`，`push`，`pull`。而父项目以`submodule`的形式包含子项目，父项目可以指定子项目`header`，父项目中的提交信息包含`submodule`的信息，在`clone父项目`的时候可以把`submodule`初始化。

在这里，博客`Blog`为父项目，`hexo next主题`为子项目独立存在于Blog中。

**解决第三方库更新问题就是`fork+submodule`。即先在github上fork next主题仓库，然后再使用submodule。**

具体操作：

```shell
$ git clone https://github.com/Evey-huang/Blog.git (克隆远程代码到本地)
$ cd Blog (进入博客根目录)
$ npm install (视情况而定，安装依赖)
$ rm -rf themes/next/ (移除空的主题文件夹)
$ git submodule add https://github.com/Evey-huang/hexo-theme-next.git themes/next (克隆新的主题并指定本地存储目录为 themes/next)
```



在执行第5步时出现了下面这个问题：

```
'themes/next' already exists in the index
```

**解决方案：**

```shell
$ git rm -r --cached themes/next
```



然后再次执行第5步：

```shell
$ git submodule add https://github.com/Evey-huang/hexo-theme-next.git themes/next
```



修改.git/config和.git/module/themes/next/config文件，在`github`前面加上自己的github名称`Evey-huang@`（不修改的话提交代码会因为没有权限而失败）：

```shell
$ vim .git/config
```

![](http://p1cjg886l.bkt.clouddn.com/submodule1.png)



```shell
$ vim .git/module/themes/next/config
```

![](http://p1cjg886l.bkt.clouddn.com/submodule2.png)



做完以上修改后，可以更新next主题的配置，将自己的自定义配置覆盖原来的配置，然后提交到远程仓库`Evey-huang/hexo-theme-next`

```shell
$ cd themes/next
$ git add .
$ git commit -m "update"
$ git push origin master
```

提交成功可以在github上看到有更改：
![](http://p1cjg886l.bkt.clouddn.com/submodule3.png)



分割线——————————————————————————

以上是添加submodule以及更新next主题的全部步骤，做完这些，无论你换多少台电脑都可以快速地开始工作更新文章啦~

换了电脑后如何快速开始工作？

具体操作：

```shell
$ git clone https://github.com/Evey-huang/Blog.git
$ cd Blog
$ git submodule update --init
$ cd themes/next
$ git pull origin master (如果不做这一步，就不能更新到最新的配置)
$ hexo g
$ hexo s
```



## 小结

其实之前就已经发现每次next主题都不能更新到github，但是工作没有受到影响就忽略了，一直拖着不解决这个问题，直到遇到了才去解决，一开始就胡乱去google得到很多教程，跟着几遍下来发现都不成功，觉得自己大概是[中了邪了]，后面仔细看了[官方解释](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97)才对submodule有深入的了解，知道其工作原理，然后梳理一下思路才慢慢做成功了，于是有了这篇文章，回过头去看步骤真的很简单，只怪自己当时没看清。