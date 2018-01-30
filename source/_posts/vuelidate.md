---
title: Vuelidate表单验证插件
date: 2017-12-12 22:14:10
tags: validate 表单验证插件
categories: validate
---



# Vuelidate

Vuelidate是一款简单轻量级的基于模块的Vue.js验证插件。当前最新的版本是0.6.1,详情可以戳链接看官方文档（<https://monterail.github.io/vuelidate/>）或者前往github（<https://github.com/monterail/vuelidate>）。接触Vuelidate源于工作的需求，当时需要做表单验证然后师傅甩给我一个链接让我去学习。学习以后发现这是真的好用，它有以下功能特征：

- 基于模型
- 脱离模型
- 依赖自由，简约的库
- 支持收集验证
- 支持嵌套模型
- 上下文验证
- 自定义验证，便于使用
- 支持功能组合
- 验证了不同数据源：Vuex getter，计算值，等等。

在接触Vuelidate之前还用过另一个表单验证插件veelidate(<http://vee-validate.logaretm.com/index.html#>)用法跟Vuelidate差不多，但是Vuelidate更深得我心。

# 安装

安装很简单，用npm来安装只需要一句话：

```
npm install vuelidate --save
```

# 使用

### main.js

在main.js中导入库并用作Vue插件，以便在包含验证配置的所有组件上全局启用该功能：

```
import Vue from 'vue'
import Vuelidate from 'vuelidate'
Vue.use(Vuelidate)
```

### Example

#### JS

```
import { required, maxLength } from 'vuelidate/lib/validators'

export default {
  data () {
    return {
      username: ''
    }
  },
  validations: {
    username: {
      required,
      minLength: minLength(6)
    }
  }
}
```

#### HTML

![选区_012](https://eveywongblog.files.wordpress.com/2017/11/e98089e58cba_012.png)

## 内置验证规则

- required: 需要非空数据。检查仅包含空格的空数组和字符串。
- maxLength:要求输入具有最大指定长度（包括最大值）。适用于数组。
- minLength:要求输入具有最小指定长度（包括最小值）。适用于数组。
- email: 接受有效的电子邮件地址。请记住，您仍然需要在服务器上进行仔细验证，因为无法发送验证电子邮件地址是否是真实的。
- between: 检查数字或日期是否在指定范围内。最小值和最大值都包括在内。
- ipAddress: 接受点分十进制表示形式的有效IPv4地址，如127.0.0.1。
- alpha: 只接受字母字符。
- alphaNum: 只接受字母数字。
- numeric: 只接受数字。
- sameAs: 检查给定属性是否相等。
- url: 只接受网址。
- or: 当至少有一个提供的验证器通过时通过。
- and: 所有提供的验证器都通过时通过。
- requiredIf: 仅当提供的属性或谓词为真时才需要非空数据。
- requiredUnless: 仅当提供的属性或谓词为假时才需要非空数据。
- minValue: 要求输入具有指定的最小数值或日期。
- maxValue: 要求输入具有指定的最大数值或日期。

## 自定义验证规则

除了使用Vuelidate自带的内置验证规则外还可以使用自定义规则满足需求。只需要再新建一个js文件加入自己的验证规则就可以了。

#### Example

新建一个自定义验证规则name.js代码如图所示，基本可以参照内置验证规则写，要注意路径写正确。

###### index.js

```
'use strict'

Object.defineProperty(exports, '__esModule', {
  value: true
})
exports.name  = undefined

var _name = require('./name')

var _name2 = _interopRequireDefault(_name)

function _interopRequireDefault (obj) { return obj && obj.__esModule ? obj : { default: obj } }

exports.name = _name2.default
```

###### name.js

```
'use strict'

Object.defineProperty(exports, '__esModule', {
  value: true
})

var _common = require('vuelidate/lib/validators/common')

var nameRegex = /^[\w-]+$/

exports.default = (0, _common.regex)('name', nameRegex)
```

当这些设置好以后就可以像内置规则那样使用了，这里我是在utils下新建了vuelidate验证规则，所以路径可以这么写。

```
import { name } from 'utils/vuelidate/lib/validators'
```

 