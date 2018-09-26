---
title: 快速开始
date: 2018-09-22 07:28:45
tags: react
categories: React
---

## 前提

- Node>=6

## 搭建环境

- 全局安装create-react-app命令行工具

```shell
$ npm install -g create-react-app
```

- 创建第一个React工程

```shell
$ create-react-app my-app
```

- 启动项目

```shell
$ cd my-app
$ npm start
```

## 简单的React例子

ReactDOM.render 是 React 的最基本方法，用于将模板转为 HTML 语言，并插入指定的 DOM 节点。该例子中将一个h1标题插入root节点，最终渲染出一个“Hello World”标题。

```react
import React from 'react';
import ReactDOM from 'react-dom';
 
 
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('root')
);
```

