---
title: 使用ES6的浏览器兼容性问题
date: 2018-01-20 11:38:18
tags: [ES6, 单元测试]
categories: 单元测试
---

![插图](http://p1cjg886l.bkt.clouddn.com/es1.jpg)

## 背景

最近项目重构需要添加单元测试环境到项目中去，由于之前已经有了经验和写了教程，直接照着来就是了，但是却出现了bug。

![es6 bug](http://p1cjg886l.bkt.clouddn.com/es.png)

## 问题

Google发现这是一个<u>es6浏览器兼容性问题</u>。

### polyfill

由于Babel默认只转换各种ES2015语法，而不转换新的API，比如`Promise`，这时我们需要提供一些`ployfill`来模拟出这样一个提供原生支持功能的浏览器环境。主要有两种方式：`babel-runtime`和`babel-polyfill`，这里主要讲`babel-polyfill`。

#### babel-polypill

`babel-polyfill`是针对全局环境的，引入它浏览器就好像具备了规范里定义的完整的特性，一旦引入，就会跑一个`babel-polyfill`实例。

##### 用法：

1. 安装

```shell
npm install --save-dev babel-polyfill
```

1. 在入口文件引入

```js
import 'babel-polyfill'
```



## 解决方案

本次bug的引起主要是因为添加了单元测试环境，所以引入的时候应该在单元测试环境配置文件里引入，在`karma.conf.js`中`files`字段中引入：

```js
'../../node_modules/babel-polyfill/dist/polyfill.js'
```

具体这样：

```js
files: [
  '../../node_modules/babel-polyfill/dist/polyfill.js',
  './index.js' // 入口文件
],
```



## 小结

浏览器兼容是个坑。