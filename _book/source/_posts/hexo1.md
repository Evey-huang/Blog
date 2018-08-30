---
title: Hexo
date: 2018-08-29 16:41:25
tags: hexo
categories: Hexo
---

[Hexo](https://hexo.io/zh-cn/)是一个快速、简洁且高效的博客框架，拥有以下特点：

- 超快生成速度
- 支持Markdown所有功能
- 一键部署
- 提供丰富的插件

#### 安装前提

- Node.js
- Git

#### 安装Hexo

```shell
$ npm install -g hexo-cli
```

#### 建站

```shell
# 新建一个网站
$ hexo init blog
# 进入博客文件夹
$ cd blog
# 安装依赖
$ npm install
# 启动服务器
$ hexo server
```

#### 其他指令

```shell
# 部署网站
$ hexo deploy 等于$ hexo d
# 生成静态文件
$ hexo generate 等于 $ hexo g
# 新建文章
$ hexo new title
```



