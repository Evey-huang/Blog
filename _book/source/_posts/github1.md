---
title: 将本地项目上传到github
date: 2017-12-10 22:31:25
tags: github
categories: git
---

#### 本地创建一个项目

比如我本地新建了一个项目，名为myBlog

![PNG](http://p1cjg886l.bkt.clouddn.com/github1-1.png)

#### 建立本地仓库

###### 初始化

进入myBlog文件夹执行

```
git init
```

初始化项目成功后文件夹下会新增`.git`隐藏文件夹

![PNG](http://p1cjg886l.bkt.clouddn.com/github1-2.png)

###### 添加到仓库

执行指令

```
git add .
```

将项目添加到版本库

###### 生成commit

执行指令

```
git commit -m "myblog"
```

#### 关联github仓库

在github新建一个仓库

###### 添加github远程仓库地址

![PNG](http://p1cjg886l.bkt.clouddn.com/github1-3.png)

执行指令

```
git remote add origin https://github.com/Evey-huang/myBlog.git
```

###### 上传本地代码

```
git push -u origin master
```

###### Fix Bug

在上传代码的时候出了点错误提示“Pushing to Git returning Error Code 403 fatal: HTTP request failed”

解决办法是修改.git/config文件

执行指令

```
vim .git/config
```

将

![PNG](http://p1cjg886l.bkt.clouddn.com/github1-5.png)

修改为

![PNG](http://p1cjg886l.bkt.clouddn.com/github1-4.png)



再次执行

```
git push -u origin master
```

即可上传成功，去github就可以看到提交记录啦~