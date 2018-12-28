---
title: isNaN()与typeof比较
date: 2018-12-28 16:13:08
tags: [typeof, isNaN]
categories: JS
---

日常写bug，有个业务需求需要判断参数是否为数值，首先想到的是用`isNaN()`，后同事建议用`typeof`正向判断较佳，写此文做记录。

##  isNaN()

isNaN() 函数用于检查其参数是否是非数字值。

###### 例：

```js
isNaN(null) // false
isNaN(undefined) // true
isNaN(NaN) // true
isNaN('') // false
isNaN(123) // false
isNaN('x') // true
```



## typeof

`JavaScript typeof`是一个一元运算符，用来检查数据类型，检查完后会回传一个字符串，对于不同的数据类型会返回不同的字符串。typeof返回值有六种：

- number
- object
- string
- boolean
- function
- undefined

###### 以number为例，检查参数是否为数值：

```js
typeof '123' === 'number' // false
typeof '' === 'number' // false
typeof null === 'number' //false
typeof undefined === 'number' //false
typeof 123 === 'number' // true
typeof NaN === 'number' // true
```



因为isNaN(null)为false，不太符合业务需求，所以最终选择typeof用于检查参数是否为数值（敲黑板！后端一般不会传NaN值，故无影响）。