---
title: npm@6安全审核
date: 2018-08-21 10:05:44
tags: NPM
categories: NPM
---

## 问题描述

执行`npm i`出现以下警告：

![](http://p1cjg886l.bkt.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-17%20%E4%B8%8B%E5%8D%884.19.27.png)

这是因为npm升级到@6以后，在项目中更新或者下载新的依赖包控制台会自动运行npm audit对项目依赖包进行安全审核，并生成漏洞报告在控制台中显示。

## 问题解决

1. 自动更新有安全漏洞的依赖项，修补大部分漏洞

```shell
npm audit fix
```

1. 手动执行npm audit看目前依赖包还有什么问题

```shell
npm audit
```

![](http://p1cjg886l.bkt.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-17%20%E4%B8%8B%E5%8D%884.16.35.png)



1. 访问提示链接[https://www.npmjs.com/advisories/48](https://www.npmjs.com/advisories/48)，里面给出了解决方案

![](http://p1cjg886l.bkt.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-17%20%E4%B8%8B%E5%8D%884.40.54.png)

1. 手动更新包

```shell
npm i uglify-js@2.6.0
```

![](http://p1cjg886l.bkt.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-17%20%E4%B8%8B%E5%8D%884.19.11.png)

