---
title: 在Nuxt.js项目中如何使用ElementUI
date: 2018-04-04 16:17:34
tags: [Nuxt.js, ElementUI]
categories: 教程
---

## 背景

在写后台管理系统的界面，发现很难写出一个好看的表单（主要是懒），于是想用UI插件，首选当然是熟悉的ElementUI，之前都是在Vue项目中使用的ElementUI，这次第一次玩Nuxt，不知道该怎么取引用，当然首选是[官网教程-插件的使用](https://zh.nuxtjs.org/guide/plugins)。

在Nuxt中使用ElementUI很简单，只需要三步：

1. 安装ElementUI `npm i element-ui -S`
2. 修改nuxt配置文件`nuxt.config.js`，添加以下内容
3. 在plugins文件夹下新建一个文件`element-ui.js`



## 操作

##### nuxt.config.js

```js
module.exports = {
  build: {
    vendor: ['axios', 'element-ui']
  },
  css: [
    { src: 'element-ui/lib/theme-chalk/index.css', ssr: true }
  ],
  babel: {
    "plugins": [["component", [
      {
        "libraryName": "element-ui",
        "styleLibraryName": "theme-default"
      },
      'transform-async-to-generator',
      'transform-runtime'
    ]]],
    comments: true
  },
  plugins: [
    '~plugins/element-ui'
  ]
}

```

##### element-ui.js

```js
import Vue from 'vue'
import ElementUI from 'element-ui'

Vue.use(ElementUI)

```

