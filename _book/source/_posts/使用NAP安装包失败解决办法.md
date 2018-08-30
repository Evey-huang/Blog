---
title: 使用NAP安装包失败解决办法
date: 2018-06-28 18:40:27
tags: NAP
categories: NPM
---

#### 方法一：通过config命令

```shell
$ npm config set registry https://registry.npm.taobao.org
$ npm info underscore 
```



#### 方法二：命令行指定

```shell
$ npm --registry https://registry.npm.taobao.org info underscore
```



#### 方法三：编辑~/.npmrc(推荐)

```shell
$ registry = https://registry.npm.taobao.org
```



