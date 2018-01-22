---
title: 饿了么element表单验证插件
date: 2018-01-20 15:24:03
tags: [element, 表单验证]
categories: 教程
---

![插图](http://p1cjg886l.bkt.clouddn.com/ele5.jpg)



## 背景

为什么又换表单验证插件，记得上一次是[Vuelidate](https://evey-huang.github.io./2017/12/12/vuelidate/)。emm,没错，我们项目重构了，前端组件库从[quasar](http://quasar-framework.org/)换成了[element](http://element.eleme.io/#/zh-CN)，相应的，把表单验证插件也从`vuelidate`换成了element支持的校验规则[async-validator](https://github.com/yiminghe/async-validator)。

## 介绍

element表单校验规则很简单，只需要通过 `rules` 属性传入约定的验证规则，并把 Form-Item 的 `prop` 属性设置为需校验的字段名即可，官网写得很详细，很容易上手，传送门—>[表单验证](http://element.eleme.io/#/zh-CN/component/form)

内置的校验规则肯定满足不了工作需求，所以`自定义校验`显得尤为重要，这里主要写自定义规则和内置规则如何搭配使用。

## 开始

### HTML

新建一个表单`Form`包含两个`input`，分别为用户名和密码

```html
<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.0.11/lib/index.js"></script>
<div id="app">
<el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">

  <el-form-item label="用户名" prop="username">
    <el-input type="text" v-model="ruleForm2.username" auto-complete="off"></el-input>
  </el-form-item>
  
  <el-form-item label="密码" prop="pass">
    <el-input type="password" v-model="ruleForm2.pass" auto-complete="off"></el-input>
  </el-form-item>

  <el-form-item>
    <el-button type="primary" @click="submitForm('ruleForm2')">登录</el-button>
    <el-button @click="resetForm('ruleForm2')">重置</el-button>
  </el-form-item>
</el-form>
</div>
```

### JS

用户名校验规则为：

- 必填，不能为空
- 最长为5个字符（写的数比较小是为了用于测试）
- 由字母数字下划线还有短横线组成

密码校验规则为：

- 必填，不能为空
- 最长6个字符（同上）
- 由字母数字下划线组成

```js
var Main = {
    data() {
      var validateUser = (rule, value, callback) => {
        if (value === '') {
          return callback(new Error('用户名不能为空'));
        }
        if (!/^[\w-]+$/.test(value)) {
          callback(new Error('用户名由字母、数字及下划线或者短横线组成'))
        } else {
          callback()
        }
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'))
        }
        if (!/^\w+$/.test(value)) {
          callback(new Error('密码由字母、数字及下划线组成'))
        } else {
          callback()
        }
      };
      return {
        ruleForm2: {
          pass: '',
          username: ''
        },
        rules2: {
          pass: [
            { required: true，validator: validatePass, trigger: 'blur' },
            { max: 6, message: '密码最多为6个字符', trigger: 'blur' }
            
          ],
          username: [
            { required: true，validator: validateUser, trigger: 'blur' },
            { max: 5, message: '用户名最多为5个字符', trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      // 点击登录时触发
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      // 对整个表单进行重置，将所有字段值重置为初始值并移除校验结果
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
var Ctor = Vue.extend(Main)
new Ctor().$mount('#app')
```

### CSS

因为懒得写`css`所以引的`element-ui`自带css样式

```css
@import url("//unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css");
```



### 传送门

戳这里[在线运行](https://jsfiddle.net/eveyyyy/3m5zx8ou/4/)代码



### 效果图

原始样式

![原始样式](http://p1cjg886l.bkt.clouddn.com/ele1.png)



当input输入框为空时点击登录或者离开输入框都会提示`不能为空`

![不为空](http://p1cjg886l.bkt.clouddn.com/ele2.png)



当输入字符超过限定时会提示`最多为xxx字符`

![max](http://p1cjg886l.bkt.clouddn.com/ele3.png)



当出现非法字符串比如"?"也会提醒

![非法字符](http://p1cjg886l.bkt.clouddn.com/ele4.png)



### 小结

总的来说这个验证插件要比`vuelidate`好用，在当前页面就可以完成验证工作，而vuelidate还需要依赖很多文件，要自定义一个校验方法需要改好几个文件。

最后，校验插件好上手，难的是校验规则，要想校验好正则少不了~