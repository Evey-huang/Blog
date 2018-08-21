---
title: vue项目使用npm出现的问题
date: 2018-08-21 10:23:47
tags: [vue, npm]
categories: NPM
---



## 现象

运行单元测试`npm run test`出现问题：

> No parser and no filepath given, using 'babylon' the parser now but this will throw an error in the future. Please specify a parser or a filepath so one can be inferred.



## 解决

参考原issues：[https://github.com/nuxt/nuxt.js/issues/3400](https://github.com/nuxt/nuxt.js/issues/3400)，解决方案为:

```shell
npm install vue-loader@13.7.2 --save-dev
```





