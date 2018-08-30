---
title: 如何获得第N个斐波那契数
date: 2018-08-21 10:12:40
tags: [Fibonacci, 斐波那契]
categories: JS
---

## 背景

斐波那契数列（意大利语: Successione di Fibonacci）又译费波拿契数列、黄金分割数列。

在数学上，斐波那契数列是以递归的方法来定义：

- F0=0
- F1=1
- F2=1
- F3=2
- Fn=F(n-1)+F(n-2) (n>=2)

用文字来说，就二十斐波那契数列由0和1开始，之后的斐波那契数列由之前的两数相加而得出。首几个斐波那契系数是：`0,1,1,2,3,5,8,13,21,34,55,89,144,233....`



## 解答

### 方法一

```js
function fibonacci(n){
  var fibo = [0, 1];
  
  if (n <= 2) return 1;

  for (var i = 2; i <=n; i++ ){
   fibo[i] = fibo[i-1]+fibo[i-2];
  }

 return fibo[n];
} 
// console.log(fibonacci(12)) => 144
```

运行时复杂度为O(n)



### 方法二

```js
function fibonacci(n){
  if(n<=1)
    return n;
  else
    return fibonacci(n-1) + fibonacci (n-2);  
}
// console.log(fibonacci(12)) => 144
```

运行时复杂度O(2^n)