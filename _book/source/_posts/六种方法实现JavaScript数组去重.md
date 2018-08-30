---
title: 六种方法实现JavaScript数组去重
date: 2018-06-28 18:38:49
tags: [js, 数组]
categories: JS
---

#### 方法1——Set

ES6提供了新的数据结构`Set`。它类似于数组，但是成员的值都是唯一的，没有重复的值。

`Set`本身是一个构造函数，用来生成`Set`数据结构，`Array.from`方法可以将`Set`结构转为数组，在`Set`内部两个`NaN`是相等的，两个对象是总不相等的



```js
function unique(arr){
  return Array.from(new Set(arr));
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr)); // [1, 2, 3, null, NaN]
```



#### 方法2——forEach

声明一个数组`newArr`，直接遍历待去重数组`arr`，然后把新数组中没有的元素推进去，在`forEach`中两个`NaN`不相等

```js
function unique(arr){
  var newArr = [];
  arr.forEach(function(item){
    if(newArr.indexOf(item) === -1){
      newArr.push(item);
    }
  });
  return newArr;
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr)); // [1, 2, 3, null, NaN, NaN]
```





#### 方法3——reduce

在`reduce`中两个`NaN`不相等

```js
function unique(arr){
  return arr.reduce(function(prev, next){
    if(prev.indexOf(next) === -1){
      prev.push(next);
    }
    return prev;
  }, []);
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr));// [1, 2, 3, null, NaN, NaN]
```



```js
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
var result = arr.sort().reduce(function(init, current){
    if(init.length===0 || init[init.length-1]!==current){
        init.push(current);
    }
    return init;
}, []);
console.log(result); //[1, 2, 3, NaN, NaN, null]
```





#### 方法4——indexOf

判断数组元素的indexOf索引判断和元素本身的索引是否相同  如果相同，代表这是数组第一次出现的该元素值

```js
function unique(arr){
  var newArr = [arr[0]];
  var item;
  for(var i = 1, len = arr.length; i < len; i++){
    item = arr[i];
    if(arr.indexOf(item) === i){
      newArr.push(item);
    }
  }
  return newArr;
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr)); // [1, 2, 3, null]
```





#### 方法5——优化遍历

对数组的每一个元素都进行判断（使用指针i），另一个指针从判断元素的下一位进行判断，移动这个指针（指针j下移），如果发现判断元素与指针指向的值相等，证明该判断元素不是数组中唯一的，那就继续往下判断（指针i下移，指针j回到i的下一位），直到j移到数组终点，证明判断元素（指针i指向的元素）是数组中唯一的并将该元素推入新数组

```js
function unique(arr){
  var newArr = [];
  for(var i = 0, len = arr.length; i < len; i++){
    for(var j = i + 1; j < len; j++){
      if(arr[i] === arr[j]){
        j = ++i;
      }
    }
    newArr.push(arr[i]);
  }
  return newArr;
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr)); // [1, 2, 3, null, NaN, NaN]
```





#### 方法6——排序去邻

首先调用数组的`sort`方法对数组的元素进行排序并返回数组，只需要判断数组元素值和上一个索引值不同就可以了

```js
function unique(arr){
  var newArr = [arr[0]];
  var item;
  arr.sort();
  for(var i = 1, len = arr.length; i < len; i++){
    item = arr[i];
    if(item !== arr[i - 1]){
      newArr.push(item);
    }
  }
  return newArr;
}
var arr = [1, 1, 2, 3, null, null, NaN, NaN];
console.log(unique(arr)); // [1, 2, 3, NaN, NaN, null]
```

