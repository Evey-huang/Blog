---
title: ubuntu下使用和配置shadowsocks
date: 2018-06-28 18:25:06
tags: [ubuntu, shadowsocks]
categories: Ubuntu
---

## 1. 安装shadowsocks-Qt5

```shell
sudo add-apt-repository ppa:hzwhuang/ss-qt5
```

```shell
sudo apt-get update
```

```shell
sudo apt-get install shadowsocks-qt5
```

注意！！此处有bug，执行这三条命令不成功的话则找到：

> 软件和更新->其他软件->修改源，将源修改成artful

安装完成后打开shadowsocks界面配置服务器点击连接即可



## 2. 配置chrome浏览器

### 2.1 安装SwitchOmega

- 在`https://github.com/FelisCatus/SwitchyOmega/releases`下载`.crx`后缀名的文件
- 在chrome中打开`chrome://extensions`页面，将下载好的switchOmega插件拖入页面，点击确认即可安装

### 2.2 配置SwitchOmega

- 新建情景模式，`名称`任意，情景模式类型选择`代理服务器`，点击创建。

![](http://p1cjg886l.bkt.clouddn.com/1.png)

- 点击新建的情景模式进行配置：

  

![](http://p1cjg886l.bkt.clouddn.com/2-1.png)



![](http://p1cjg886l.bkt.clouddn.com/2-2.png)

- 点击`auto switch`进行配置切换模式：

![](http://p1cjg886l.bkt.clouddn.com/2018-05-22%2011-20-59%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

![](http://p1cjg886l.bkt.clouddn.com/2018-05-22%2011-21-21%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)



