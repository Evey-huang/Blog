---
title: 求两数最大公约数
date: 2018-08-21 10:19:08
tags: [greatestCommonDivisor, 最大公约数]
categories: JS
---



#### 方法一

- 初始除数为2，最大公约数为1
- 如果a、b两数中其中一个为1或者0，则最大公约数为1
- 如果a、b两数均大于2，a、b均能整除2，则最大公约数为2；否则最大公约数为1



```js
function greatestCommonDivisor(a, b){
  var divisor = 2, 
      greatestDivisor = 1;

  //if u pass a -ve number this will not work. fix it dude!!
  if (a < 2 || b < 2)
     return 1;
  
  while(a >= divisor && b >= divisor){
   if(a %divisor == 0 && b% divisor ==0){
      greatestDivisor = divisor;      
    }
   divisor++;
  }
  return greatestDivisor;
}

// console.log(greatestCommonDivisor(14, 21)) => 7 
// console.log(greatestCommonDivisor(1, 7)) => 1
```



#### 方法二

```js
function greatestCommonDivisor(a, b){
   if(b == 0)
     return a;
   else 
     return greatestCommonDivisor(b, a%b);
}
// console.log(greatestCommonDivisor(5,7)) => 1
```

例如：

求5和7的最大公约数，a=5,b=7

1. return greatestCommonDivisor(7, 5%7) => a=7,b=1
2. return greatestCommonDivisor(7, 7%1) => a=7,b=0
3. b==0 return a=1

所以5和7最大公约数为1