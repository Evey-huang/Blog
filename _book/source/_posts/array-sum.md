---
title: 数组求和
date: 2018-04-04 00:08:44
tags: [JS, 数组求和]
categories: JS
---



### 问题描述：

>计算给定数组arr中所有元素的总和。
>
>例：
>
>输入[1,2,3,4]    
>
>输出：10



### 常规循环：

```js
function sum(arr) {
    var s = 0;
    function(var i=arr.length-1;i>=0;i--) {
        s+=arr[i];
    }
    return s;
}
```

##### 思路：

arr=[1,2,3,4]，i=arr.length-1=4-1=3

s0=0+arr[3]=0+4=4;

s1=4+arr[2]=4+3=7;

s2=7+arr[1]=7+2=9;

s3=9+arr[0]=9+1=10;



### forEach遍历：

```js
function sum(arr) {
    var s = 0;
    arr.forEach(function(val,index,arr) {
        s+=val;
    },0)
    return s;
}
```

[forEach传送门]()

`val`:数组中正在处理的当前元素

`index`:数组中正在处理的当前元素的索引

`arr`:forEach()方法正在操作的数组



>例如:arr=[1,2,3,4]，则
>
>s0=s+val0=0+1=1;
>
>s1=s0+val1=1+2=3;
>
>s2=s1+val2=3+3=6;
>
>s3=s2+val3=6+4=10;



### reduce方法：

```js
function sum(arr) {
    return arr.reduce(function(prev, curr, idx, arr){
        return prev + curr;
    });
}
```

[reduce传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)

`prev`:累加器累加回调的返回值

`curr`:数组中正在处理的元素

`idx`:数组中正在处理的当前元素的索引

`arr`:调用`reduce`的数组



>例如：arr=[1,2,3,4]，则共经历4轮
>
>1. prev=0,curr=1,return 0+1=1 （第一轮累加器累加毁掉的返回值为0）
>2. prev=1,curr=2,return 1+2=3
>3. prev=3,curr=3,return 3+3=6
>4. prev=6,curr=4,return 6+4=10



### eval：

```js
function sum(arr) {
    return eval(arr.join("+"));
};
```

[eval传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/eval)

>例如:arr=[1,2,3,4]，则
>
>return 1+2+3+4=10

