---
title: ubuntu安装WPS
date: 2018-06-28 11:57:26
tags: [ubuntu18.04, wps]
categories: Ubuntu
---



1. 进入[WPS官网](http://wps-community.org/download.html)下载最新的安装包及[字体文件](http://wps-community.org/download.html?vl=fonts#download)
2. 下载[libpng12-0](https://packages.debian.org/zh-cn/wheezy/amd64/libpng12-0/download)

```shell
wget http://ftp.cn.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.49-1+deb7u2_amd64.deb
```

1. 安装

```shell
sudo dpkg -i libpng12-0_1.2.49-1+deb7u2_amd64.deb
sudo dpkg -i wps-office_10.1.0.5707_a21_amd64.deb
sudo dpkg -i wps-office-fonts_1.0_all.deb
```

