---
title: JavaScript字符串反转
date: 2018-08-21 10:25:57
tags: [reverse, 字符串反转]
categories: JS
---

#### 首先

思路：

> 遍历字符串并将字母链接到新字符串



###### 过程：

- 第一次迭代，str.length-1 === 5-1 ===o
- 第二次迭代，4-1 === ol
- 第三次迭代，3-1 === oll
- 第四次迭代，2-1 === olle
- 第五次迭代，1-1 === olleh

#### 方法一

###### 思路：

使用一个`for`循环给原字符串做一个递减遍历，然后将遍历的字符串重新合并成一个新字符串

```js
function reverse(str){
  var rtnStr = '';
  for(var i = str.length-1; i>=0;i--){
    rtnStr +=str[i];
  }
  return rtnStr;
}
reverseString("hello"); // =>olleh
```



#### 方法二

###### 思路：

使用递归实现字符串反向

- substr()方法返回字符串中从指定位置开始到指定长度的子字符串
- charAt()方法返回字符串中指定位置的字符。字符串中的字符从左向右索引，第一个字符的索引值为0

###### 过程：

第一次递归

1. reverseString("ello")+'h'
2. reverseString("llo")+'e'
3. reverseString("lo")+'l'
4. reverseString("o")+'l'
5. reverseString("")+'o'

第二次递归

1. reverseString("")+'o'='o'
2. reverseString("o")+'l'='o'+'l'
3. reverseString("lo")+'l'='o'+'l'+'l'
4. reverseString("llo")+'e'='o'+'l'+'l'+e
5. reverseString("ello")+'h'='o'+'l'+'l'+'e'+'h'

```js
function reverseString (str) {
    if (str === "") {
        return "";
    } else {
        return reverseString(str.substr(1)) + str.charAt(0);
    }
}
reverseString("hello"); // =>olleh
```

改良版

```js
function reverseString(str) { 
    return (str === '') ? '' : reverseString(str.substr(1)) + str.charAt(0); }
reverseString("hello"); // =>olleh
```



#### 方法三

###### 原理：

- split()方法将一个字符串对象的每个字符拆出来，并且将每个字符串当成数组的每个元素
- reverse()方法用来改变数组，将数组中的元素倒个序排列，第一个数组元素变成最后一个，最后一个变成第一个
- join()方法将数组中的所有元素边接成一个字符串



###### 过程：

1. split()将字符串拆分，返回一个新数组['h', 'e', 'l', 'l', 'o']
2. reverse()将原数组顺序翻转，返回新数组['o', 'l', 'l', 'e', 'h']
3. join()将数组的每个元素连接在一起，组合成新字符串，返回一个新的字符串“olleh”

```js
function reverseString(str) { 
    return str.split("").reverse().join(""); 
}
reverseString("hello"); // => olleh
```

