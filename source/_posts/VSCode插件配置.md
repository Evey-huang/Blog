---
title: VSCode插件配置
date: 2018-06-28 18:48:35
tags: [VSCode, Gist]
categories: git
---

## 常用插件

- Beautify - 通过配置.jsbeautifyrc文件可以格式化javascript、json、css、sass和html文件
- Code Runner - 支持运行多种语言的代码片段或代码文件（比如C++、java等）
- ESLint - 代码检查
- HTML CSS Support - 对HTML文档的CSS支持
- HTML Snippets - H5代码片段及提示
- Vue 2 Snippets - Vue2代码片段及提示
- Auto Close Tag - 匹配标签，关闭对应标签
- Auto Rename Tag  - 当修改HTML/XML标签时，会自动修改 与之对应的开始/结束标签
- Settings Sync - VSCode设置同步到Gist
- Document This - 生成JS注释模板
- vscode-icon - 让VSCode资源树目录加上图标
- Path Intellisense - 路径智能提示
- Vetur - 语法高亮、智能感知、Emmet等
- VueHelper - Vue代码智能提示（包括Vue、Vue-router、Vuex）

## VSCode设置如何同步到Gist

- 安装Settings Sync扩展

- 打开自己的Github->Settings->Developer settings->Personal access tokens->Generate new token

  填写Token描述

  ![](http://p1cjg886l.bkt.clouddn.com/2018-06-12%2016-10-52%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

  在选择范围中选择`gist`

  ![](http://p1cjg886l.bkt.clouddn.com/2018-06-12%2016-11-00%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

  创建`Token`

  ![](http://p1cjg886l.bkt.clouddn.com/2018-06-12%2016-11-19%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

  获取`Token`（注意保存！！）

  ![](http://p1cjg886l.bkt.clouddn.com/2018-06-12%2016-11-50%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

- 第一次上传设置

按下组合键`Shift+Alt+U`，自动打开Github设置页面，允许你为应用程序生成一个新的令牌，然后回到VSCode在窗口中输入刚才获取的`Token`，最后单击`Enter`

这样就自动上传了VSCode的设置，并且扩展程序会在系统消息中提供Gist ID。需要Gist ID才能访问你使用Token上传的数据

![](http://p1cjg886l.bkt.clouddn.com/2018-06-12%2016-36-44%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)

> GitHub Token: 519f1565671630977425bd204984b1d4b32b145b
> GitHub Gist: 99f2b0be96b188e3bdd459fc4a9b5d28



- 上传设置

经过第一次上传设置操作之后，可以按下组合键`Shift+Alt+U`直接上传，无需再次输入`Token`

- 下载设置

按下组合键`Shift+Alt+D`它会询问你的`Github Gist ID`，然后按要求输入`Token`然后单击`Enter`，输入`Gist ID`，这样就下载好设置了。



## 最后

妈妈再也不用担心我换电脑/系统VSCode配置不见啦，也不需要再重新设置配置啦，一键搞定配置，省心！

Settings Sync官网操作链接[戳这里](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)