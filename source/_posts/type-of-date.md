---
title: 数据类型
date: 2018-08-21 10:29:50
tags: [undefine, null, boolean, number, string, object, array, function]
categories: JS
---

基础类型包括：Undefine、Null、Boolean、Number、String，引用类型包括：Object、Array、Function。当一个变量值为引用类型时，直接赋值其他变量传递的是引用。同样的，引用的数据在某个地方改变了值会影响所欲调用这个变量的地方。

#### Undefine和Null

声明一个变量没有赋值，直接访问当前变量可以得到`undefine`

```js
let x;
console.log(x); // -> undefine
```

访问一个对象上不存在的`key`也会取到`undefine`

```js
let a = {};
console.log(a.b); // -> undefine
```

null表示空值。它不同于undefine，它是有值的只不过是一个空值，而undefine是未定义的临时兜底的缺省值。

#### Number、Boolean和String

JavaScript中带引号的均为字符串，可以是单引号也可以是双引号。JavaScript没有int、float和double之分。

```js
console.log(typeof 10); // -> number
console.log(typeof '10'); // -> string
console.log(typeof true); // -> boolean
console.log(typeof "true"); // -> string
```

#### Array

数组类型、栈结构、有序数组。每个item可以是任意类型的值。

```js
// 字符串数组
['string','aaa']

// 对象和字符串混合数组
[{
    aa: 'aaa',
    bb: 'bbb',
},'string']

// 函数数组
[() => {
    return '这是一个函数'
}, () => {
 return '这是一个函数'
}]
```

如果需要取得特定需要的值，直接获取（比如获取第一个数据）：

```js
array[0]
```

数据是有序的，遍历数组需要使用流程控制语句for等。为了方便，array内置了一些数组常用操作方法可以简化常用操作，比如

- `forEach()`：把数组每个元素丢到一个处理function里面，相当于for循环
- `every()`：所有数组元素处理后全部`return true`，那么就`return true`，类似`&&`
- `some()`：只要有一个数组处理后`return true`，那么就`return true`，类似`||`
- `filter()`：将处理时`return true`的数组元素拿出来组成一个新数组
- `map()`：对每个数组元素进行处理，并组成一个新数组
- `reduce()`：像一个累加器一样，把数组元素全部加起来（从左向右）

```js
let list = [];
list.push('aa');
list.push('bb');

// for循环
for(let i=0;i<list.length;i++) {
    console.log(list[i]);
}

// forEach循环
list.forEach((val, i) => {
    console.log(val, i);
})
```



#### Object

对象类型，无序，需要指定key等信息关联值。

```js
let obj = {
    name: 'string 字符串',
    home: {
        province: '山东'
    }
};

obj.age = 18;

console.log(obj.name.province);
let key = 'age';
console.log(obj[key], obj['age']);
delete obj.name;
```

如果不确定key的值（变量）可以使用如下方法调用：

```js
let key = 'age';
obj[key]; // -> 18
```



#### Function

函数类型，用来创建一个函数，通常会返回一个数据。

```js
function fun(a, b) {
    return a + b;
}
fun(1, 2); // -> 3
```

函数是一个可执行的小程序，根据参数处理一些逻辑并返回一段新的数据，在JavaScript中使用非常多，为此ES6新增了箭头函数语法，用来简化函数书写。箭头函数有个重要特点，就是自动绑定了当前的作用域。

```js
let add = function(a, b) {
    return a + b;
}
// 等同于
let add = (a, b) => {
    return a + b
}
```

#### 类型转换

类型转换可以通过调用类型的类进行转换，比如将变量a转换成Number类型：

```js
let a = '10';
a = Number(a);
```

###### 转换Number类型

```js
let a = '12.33'; // string
console.log(parseInt(a)); // -> 12 // number
console.log(parseFloat(a)); // -> 12.33 number
```

###### 转换String类型

```js
let a = 12.33; // number
console.log(a.toString()); // -> '12.33' string
```

###### Object转JSON字符串

```js
// JSON转Object
let obj = {
    a: 'aa',
    b: 'bb'
};
console.log(JSON.stringify(obj)); // -> '{"a":"aa","b": "bb"}'

// Object转JSON
let objStr = '{"a":"aa","b":"bb"}';
console.log(JSON.parse(objStr)); // -> {"a":"aa","b": "bb"}
```

###### 转换Boolean类型

```js
console.log(!!'a'); // -> true
console.log(!!''); // -> false 空字符串
console.log(!!0); // -> false 数字0
console.log(!!10); // -> true
console.log(!!null); // -> false
console.log(!!undefine); // -> false
console.log(!![].length); // -> false
```

