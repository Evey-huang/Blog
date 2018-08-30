---
title: e2e端到端测试使用ES6遇到的问题及解决方案
date: 2018-06-28 19:04:09
tags: [e2e, es6]
categories: 测试
---

问题描述：

> (function (exports, require, module, __filename, __dirname) { import _Object$is from 'babel-runtime/core-js/object/is';、



解决：

package.json

在package.json添加"babel-preset-es2015"

> "babel-preset-es2015": "^6.9.0",

.babelrc

在文件.babelrc中的"presets"字段添加"es2015"

> "presets": [
>
> ​    "es2015"
>
>   ]

最后

```shell
npm install
```