---
title: Ubuntu安装和配置git
date: 2018-06-28 11:41:22
tags: [ubuntu, git]
categories: Ubuntu
---



## 安装Git

```shell
$ sudo add-apt-repository ppa:git-core/ppa
$ sudo apt-get update
$ sudo apt-get install git 
$ git --version 
```



## 配置Git

- 指定用户名和邮箱

```shell
$ git config --global user.name "Your Name"
$ git config --global user.email "youremail@domain.com"
```

- 查看配置

```shell
$ git config --list
```



## 解决git pull/git push每次都需要输入密码问题

- git bash进入项目目录
- 执行

```shell
$ git config --global credential.helper store
```