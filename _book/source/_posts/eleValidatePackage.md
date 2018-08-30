---
title: 基于element-ui表单验证方法封装
date: 2018-01-24 18:33:38
tags: [element-ui, 封装, 表单校验]
categories: validate
---

## 背景

最近在做重构项目的表单验证，发现element-ui自带的表单校验内置方法太少了，不能满足日常工作需求，如果需要校验的表单多，就会做很多重复的工作，所以把校验方法包括自定义校验规则封装起来便于调用。



## 使用

主要文件有两个，`eleValidate.vue`和`valiate.js`

### eleValidate.vue

封装后的loginRules只需要`传参`就可以了。

```html
<template>
  <div class="login-container">
    <el-form autoComplete="on" :model="loginForm" :rules="loginRules" ref="loginForm" label-position="left" label-width="0px"
      class="card-box login-form">

      <el-form-item prop="username">
        <el-input name="username" type="text" v-model="loginForm.username" autoComplete="on" placeholder="用户名"/>
      </el-form-item>

      <el-form-item prop="password">
        <el-input name="password" v-model="loginForm.password" autoComplete="on"
          placeholder="密码"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" style="width:100%;">
          登陆
        </el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
import validate from '../validate'

export default {
  name: 'login',
  data () {
    return {
      loginForm: {
        username: '',
        password: ''
      },
      loginRules: {
        username: [
          { validator: validate('name', '用户名由字母、数字、下划线以及短横线组成。', '用户名不能为空！'), trigger: 'blur' },
          { max: 50, message: '用户名最多为50个字符！', trigger: 'blur' }
        ],
        password: [
          { validator: validate('passWord', '密码由字母、数字及下划线组成。', '密码不能为空！'), trigger: 'blur' },
          { max: 25, message: '密码最多为25个字符！', trigger: 'blur' }
        ]
      }
    }
  }
}
</script>
<style>
  .login-container {
    width: 300px;
    margin: 0 auto;
    margin-top: 100px;
  }
</style>

```

`validate`既可以传参数名也可以传正则表达式，例如：

```
{ validator: validate('name', '用户名由字母、数字、下划线以及短横线组成。', '用户名不能为空！'), trigger: 'blur' }
或者
{ validator: validate('/^([\w-]+|[\u4e00-\u9fa5]+)$/', '用户名由字母、数字、下划线以及短横线组成。', '用户名不能为空！'), trigger: 'blur' }
```



### validate.js

这个文件主要写自定义正则表达式和处理传进来的参数。

```
reg = pattern[reg] ? pattern[reg] : reg
```

这句话的作用就是既可以传定义好的参数名，也可以直接传正则表达式，传进来以后自动检测是否存在（已经定义）

```js
/**
 * 正则库
 */
const pattern = {
  name: /^([\w-]+|[\u4e00-\u9fa5]+)$/, // 用户名校验
  passWord: /^\w+$/ // 密码校验
}

/**
 * 内置规则
 * @param {String} reg - {pattern}中预定义正则名称 or 自定义正则
 * @param {String} msg1 - 正则校验不通过提示
 * @param {String} msg2 - 值为空时提示（可不填）
 */
const validate = (reg, msg1, msg2) => {
  return (rule, value, callback) => {
    if (!value) {
      if (!msg2) {
        callback()
      }
      callback(new Error(msg2))
    }
    reg = pattern[reg] ? pattern[reg] : reg
    if (!reg.test(value)) {
      callback(new Error(msg1))
    } else {
      callback()
    }
  }
}

export default validate

```



## 传送门

源码戳[这里](https://github.com/Evey-huang/ele-validate)

## 小结

封装以后确实很好用，省了很多工作，就是内置的规则很少，写正则麻烦。

![抱头痛哭](http://p1cjg886l.bkt.clouddn.com/cry.jpg)