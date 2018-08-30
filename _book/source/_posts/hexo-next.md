---
title: Next主题添加站内搜索
date: 2018-08-29 18:23:51
tags: [Hexo, Next, 搜索]
categories: Hexo
---

## 背景

随着文章的增多，标签和归档已经不能满足要求了，想要快速查找文章需要一个搜索功能。Next主题支持集成`Swiftype`、`微搜索`、`Local Search`和`Algolia`，我选择的是Hexo提供的`Local Search`，原理是通过`hexo-generator-search`插件在本地生成一个`search.xml`文件，搜索时从这个文件中根据关键字检索出相应的链接。

## 安装

安装[hexo-generator-searchdb](https://github.com/theme-next/hexo-generator-searchdb)插件

```shell
npm install hexo-generator-searchdb --save
```

## 修改配置文件

#### 修改站点配置文件_config.yml

```
# search
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```

#### 修改Next主题配置文件_config.yml

```
# Local search
local_search:
  enable: true
```

