---
title: 检查回文数
date: 2018-08-21 10:15:55
tags: [Palindrome, 回文]
categories: JS
---

#### 什么是回文

回文数是指一个对称的数，即：将这个数的数字按相反的顺序重新排列后，所得到的书和原来的数一样。



```js
function isPalindrome(str){
  var i, len = str.length;
  for(i =0; i<len/2; i++){
    if (str[i]!== str[len -1 -i])
       return false;
  }
  return true;
}
isPalindrome('madam') // => true
isPalindrome('toyota') // => false
```

