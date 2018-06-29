---
title: 详解object.is()与比较操作符“===”和“==”
date: 2018-06-28 18:43:54
tags: [Object.is()]
categories: JS
---

`==`操作在需要的情况下自动进行类型转换，`===`操作不会执行任何转换。

例如：

> - [10] == 10  // true,自动转换为相同类型
> - [10] === 10 // false，不会进行类型转换
> - [] == 0 // true
> - [] === 0 //false
> - ' ' == false // true
> - ' ' === false // false



在ES6中，`Object.is()`类似与 `===`，但是在`===`基础上特别处理了`NaN`、`-0`、和`+0`，保证`+0`和`-0`不再相等，但`NaN`和`NaN`相等，即`Object.is(NaN, NaN)会返回true`。

以下情况为`true`

> - Object.is(undefined, undefined)
> - Object.is(null, null)
> - Object.is(true, true)
> - Object.is(false, false)
> - Object.is(+0, -0)
> - Object.is(NaN, NaN)
> - 两个值是由相同个数的字符按照相同的顺序组成的字符串
> - 两个值指向同一个对象
> - 两个值都是数字并且都是除零和 NaN 外的其它同一个数字

