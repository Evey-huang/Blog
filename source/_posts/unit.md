---
title: 前端单元测试初探
date: 2017-12-08 14:49:26
tags: [karma, mocha, chai, 单元测试]
categories: 单元测试
---



## 什么是单元测试

来自维基百科的回答

> **单元测试**（英语：Unit Testing）又称为**模块测试**, 是针对**程序的最小单元**来进行正确性检验的测试工作。程序单元是应用的最小可测试部件。一个单元可能是单个程序、函数、过程、方法等。



## 需不需要写单测

好的单元测试是使你开发的产品走向成功的秘密武器：

1. **有助于设计**：写单元测试首先给了你一个如何设计 API 的清晰视角。
2. **特性文档**：单元测试描述和记录了代码所要实现的所有需求。
3. **检查开发者需求理解程度**：是否开发者足够理解问题，在测试代码里描述了所有的关键需求点？
4. **QA（质量保证）**：依靠人工 QA 容易出错。
5. **有助于持续交付**：自动化的 QA 能够自动防止将有缺陷的产品构建并发布上线。




<u>**通俗地讲单测可以提高代码质量以及大幅减少bug的存在**</u>




## 如何开始

既然已经确定了单测的必要性，那么如何开始进行单测呢？



### 单测工具链

#### 框架

目前比较火的测试框架就是[jasmine](https://jasmine.github.io/)和[mocha](https://mochajs.org/)，这里我选用mocha。

##### 什么是Mocha

Mocha 是一个功能丰富的javascript测试框架，可以运行在nodejs和浏览器环境，使异步测试变得简单有趣。mocha 串联运行测试，允许灵活和精确地报告结果，同时映射未捕获的异常用来纠正测试用例。

##### 特点

- 简单
- 灵活
- 有趣

##### 安装

```shell
npm install -g mocha
```



#### 断言库

目前比较流行的断言库主要有以下几个：

- [chai](http://chaijs.com/)：`BDD/TDD` 双模 ，同时支持 `should / expect / assert` 三种风格的断言库强大插件机制。
- [shouldjs](https://shouldjs.github.io/)：`BDD`风格断言库，由TJ Holowaychuk 发起。
- [expectjs](https://github.com/Automattic/expect.js)：追求极简的 `BDD` 风格断言库，基于 `should.js` 简化。
- [assert](https://nodejs.org/dist/latest-v8.x/docs/api/assert.html)：风格最保守，node 的核心模块，node 环境可以直接使用。

这里我使用的是`Chai`，因为mocha+chai是黄金搭档呀

##### 安装

```shell
npm install -g chai
```



#### Mock库

##### 什么是Mock

编写测试的时候，可能需要和系统内的某个模块或系统外某个实体交互，例如数据库读写、邮件发送等。这时就需要使用 mock 技术来模拟。

##### 有哪些Mock库

[sinon.js](http://sinonjs.org/)：只用过这个，其他不大清楚。sinon允许你把代码中难以被测试的部分替换为更容易测试的内容。

##### 安装

```shell
npm install sinon
```



#### 测试集成工具

[karma](https://karma-runner.github.io/)：Google Angular 团队写的，功能很强大，有很多插件

##### 安装

```shell
npm install karma --save-dev
```



### 搭建环境

基于vue-cli脚手架生成的项目模板中可以自动添加测试环境，但是这不利于刚接触单测的同学去学习，以下是我从零开始搭建测试环境的经过。

#### 新建项目

参考另一篇文章[新建Vue项目](https://evey-huang.github.io./2017/12/04/vue-start/)也可以了解新建vue项目的步骤。

##### 安装脚手架

```shell
npm install vue-cli -g
```



##### 创建项目

创建一个名为`unit-test`的项目

```shell
vue init webpack unit-test
```



然后会有询问

![PNG](http://p1cjg886l.bkt.clouddn.com/unit1-1.png)

>这里在询问需不需要加入`unit`单测的时候选了`no`是因为本文主要是讲怎样从0开始搭建测试环境，所以创建项目的时候先不考虑加入。



##### 进入项目

```shell
cd unit-test
```



##### 启动项目

```shell
npm run dev
```

>项目正常运行的话可以开始搭建测试环境



#### 测试环境搭建

##### 项目整体结构

```
├── unit-test/
    │—— build //构建脚本目录
    |     |—— webpack.base.conf.js // wabpack基础配置
    |     |—— webpack.prod.conf.js // wabpack生产环境配置
    |     |—— webpack.test.conf.js // webpack测试环境配置
    |     |—— webpack.dev.conf.js // wabpack开发环境配置
    |     |—— vue-loader.conf.js
    |     |—— utils.js // 构建相关工具方法
    |
    |—— config // 项目配置
    |     |—— dev.env.js // 开发环境变量
    |     |—— prod.env.js // 生产环境变量
    |     |—— test.env.js // 测试环境变量
    |     |—— index.js // 项目配置文件
    |—— src // 源码目录 
    |    |—— components
    |            |—— HelloWorld.vue
    |—— test
    |    |—— unit
    |          |—— coverage //自动生成覆盖文件夹
    |          |—— index.js //测试文件入口
    |          |—— karma.conf.js // karma配置文件
    |          |—— .eslintrc //支持断言书写
    |          |—— specs //测试用例文件夹
    |                |—— HelloWorld.spec.js
    |—— package.json // npm包配置文件，定义了项目的npm脚本，依赖包等信息
```



##### 安装`karma`

```shell
npm install karma --save-dev
```



##### 进入unit文件夹

```shell
cd test/unit/
```



##### 初始化karma

```shell
karma init
```

![PNG](http://p1cjg886l.bkt.clouddn.com/unit3.png)

这样就生成了一个基本的配置文件`karma.conf.js`

##### 相关文件配置

**karma.conf.js**

```js
var webpackConfig = require('../../build/webpack.test.conf')

module.exports = function (config) {
  config.set({
    browsers: ['PhantomJS'], // 浏览器
    frameworks: ['mocha', 'sinon-chai', 'phantomjs-shim'], // 测试框架
    reporters: ['spec', 'coverage'], // 测试报告
    files: ['./index.js'], // 测试入口文件
    preprocessors: {
      './index.js': ['webpack', 'coverage'] // 处理测试文件
    },
    webpack: webpackConfig, // webpack配置
    webpackMiddleware: {
      noInfo: true // 不显示webpack打包日志信息
    },
    coverageReporter: { // 代码覆盖率报告
      dir: './coverage',
      reporters: [
        { type: 'lcov', subdir: '.' },
        { type: 'text-summary' }
      ]
    }
  })
}

```



**webpack.test.conf.js**

```js

const utils = require('./utils')
const webpack = require('webpack') // 指定环境需要引入webpack
const merge = require('webpack-merge')
const baseWebpackConfig = require('./webpack.base.conf')

const webpackConfig = merge(baseWebpackConfig, {
  module: {
    rules: utils.styleLoaders()
  },
  devtool: '#inline-source-map',
  resolveLoader: {
    alias: {
      'scss-loader': 'sass-loader'
    }
  },
  // 指定环境
  plugins: [
    new webpack.DefinePlugin({
      'process.env': require('../config/test.env')
    })
  ]
})

// no need for app entry during tests
delete webpackConfig.entry

module.exports = webpackConfig

```



**webpack.prod.conf.js**

在`webpack.prod.conf.js`中引用`test.env`

```js
const env = process.env.NODE_ENV === 'testing'
  ? require('../config/test.env')
  : require('../config/prod.env')
```



**test.env.js**

```js
'use strict'
const merge = require('webpack-merge')
const devEnv = require('./dev.env')

module.exports = merge(devEnv, {
  NODE_ENV: '"testing"'
})

```



**index.js**

```js
import Vue from 'vue'

Vue.config.productionTip = false

const testsContext = require.context('./specs', true, /\.spec$/)
testsContext.keys().forEach(testsContext)

const srcContext = require.context('../../src', true, /^\.\/(?!main(\.js)?$)/)
srcContext.keys().forEach(srcContext)

```



**.eclintrc.js**

```js
{
  "env": { 
    "mocha": true
  },
  "globals": { 
    "expect": true,
    "sinon": true
  }
}
```



**package.json**

```json
"scripts": {
  "unit": "cross-env BABEL_ENV=test karma start test/unit/karma.conf.js --single-run",
  "test": "npm run unit"
}
"devDependencies": {
  "chai": "^4.1.2",
  "cross-env": "^5.0.1",
  "karma": "^1.7.1",
  "karma-mocha": "^1.3.0",
  "karma-coverage": "^1.1.1",
  "karma-phantomjs-launcher": "^1.0.4",
  "karma-phantomjs-shim": "^1.4.0",
  "karma-sinon-chai": "^1.3.1",
  "karma-sourcemap-loader": "^0.3.7",
  "karma-spec-reporter": "0.0.31",
  "karma-webpack": "^2.0.2",
  "mocha": "^3.2.0",
  "sinon": "^4.0.0",
  "sinon-chai": "^2.8.0"
}

```

##### 安装依赖

```shell
npm install
```



#### 测试用例

官网[vue单元测试](https://cn.vuejs.org/v2/guide/unit-testing.html)有介绍测试用例怎么写，下面是一个简单的测试用例：

##### 简单测试用例

**HelloWorld.spec.js**

```js
import Vue from 'vue'
import HelloWorld from '@/components/HelloWorld'

describe('HelloWorld.vue', () => {
  it('should render correct contents', () => {
    const Constructor = Vue.extend(HelloWorld)
    const vm = new Constructor().$mount()
    expect(vm.$el.querySelector('.hello h1').textContent)
    .to.equal('Welcome to Your Vue.js App')
  })
  it('should be Essential Links', () => {
    const Constructor = Vue.extend(HelloWorld)
    const vm = new Constructor().$mount()
    expect(vm.$el.querySelector('.hello h2').textContent)
    .to.equal('Essential Links')
  })
})

```

##### 运行测试用例

```shell
npm run test
```

##### 生成测试报告

![PNG](http://p1cjg886l.bkt.clouddn.com/unit4.png)

![PNG](http://p1cjg886l.bkt.clouddn.com/unit5.png)

##### 测试报告分析

从图中我们可以看到它有四个指标：

- Statements: 语句覆盖率，执行到每个语句；
- Branches：分支覆盖率，执行到每个if代码块；
- Functions：函数覆盖率，调用到程序中的每一个函数；
- Lines：行覆盖率，执行到程序中的每一行。

从图中我们也可以看出覆盖率极低，打开`coverage`文件夹可以看到:

```
coverage/
├── lcov-report
│   ├── base.css
│   ├── index.html
│   ├── prettify.css
│   ├── prettify.js
│   ├── sort-arrow-sprite.png
│   ├── sorter.js
│   └── unit
│       ├── index.html // 测试覆盖率报告
│       └── index.js.html // 覆盖率低的原因
└── lcov.info
```

打开`index.js.html`可以看到覆盖率低的原因

![PNG](http://p1cjg886l.bkt.clouddn.com/unit6.png)

从图中可以看到红色部分是测试用例没有覆盖到的地方，旁边的`1x`表示执行了`一次`。因为本文所写的测试用例`HelloWorld.spec.js`很简单没有涉及到逻辑，没有覆盖到这些函数很正常。对于实际开发来说，通过这个清晰的报告，我们可以在代码中看出那些函数，那些代码块没有被执行，从而去分析原因，修正测试用例，完善代码逻辑，提高质量。



打开`lcov.info`文件可以看到(这里我截取了部分)：

```
FN:50,getDefault
FN:51,getModuleExports
FN:57,(anonymous_7)
FN:68,(anonymous_8)
....
FNF:694
FNH:207
....
FNDA:0,simpleNormalizeChildren
FNDA:0,normalizeChildren
FNDA:0,isTextNode
FNDA:0,normalizeArrayChildren
.....
DA:633,2
DA:635,1
DA:638,1
```

`FN`: 代表函数,`50` `51` `57` `68`这些行分布对应源代码中的函数开始的行号

`FNF:694`: 代表一共有694个函数

`FNH:207`: 代表其中207个函数被测试所覆盖

`FNDA:0,isTextNode`: 代表了isTextNode这个函数被执行了0次

`DA`: 代表当前被执行到的次数

...

还有很多解析想要了解可以google



## 再谈单测

完成以上步骤我觉得我懂单元测试了（可是单元测试不懂我，泪眼朦胧.jpg），但是翻过一座山又遇一条河，这条河让我觉得我又不懂单元测试了：

- 在实际项目中单元测试到底测的是什么？
- 确定了该测什么之后应该怎么去写测试用例？

![JPG](http://p1cjg886l.bkt.clouddn.com/unit2.jpg)

### 单元测试到底测的是什么

就我的认知来看，这些需要测：

- 和安全相关的代码逻辑
- 核心的功能模块，函数
- 短期不会发生变化的 UI 组件
- 提供外部调用的接口



### 怎么去写测试用例

真的说不好怎样去写测试用例，很多资料只是告诉你怎么写一个简单的测试用例然后跑起来，但怎样去写一个好的测试用例却不知道。目前我经验少也总结不出什么有用的建议，<u>以后再填坑吧。</u>



### 什么才是一个好的测试失败报告

1. 你测试的是什么？
2. 它是做什么的？
3. 它实际输出了什么？（实际行为）
4. 它本该输出什么？（预期行为）



## 最后

本文的代码戳这里[单元测试代码](https://github.com/Evey-huang/unit-vue)