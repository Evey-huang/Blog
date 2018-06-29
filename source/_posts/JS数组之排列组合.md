---
title: JS数组之排列组合
date: 2018-06-28 19:18:21
tags: [JS, 排列组合]
categories: JS
---

## 两个数组排列组合

比如目前有两个数组：

a=[1,2,3]

b=[3,4,5]

那么数组排列的情况就有`3*3=9`种，代码：

```js
var a=[1,2,3];
var b=[4,5,6];
var newArr=[];
var index=0; // 组合次数
for(var i=0;i<a.length;i++){
	for(var j=0;j<b.length;j++){
		newArr[index]=[a[i]].concat(b[j]);
		index++;
	}
}
console.log (newArr);
console.log(index)
```

输出结果：

```
[[1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [2, 6], [3, 4], [3, 5], [3, 6]]

9
```



## 多个数组排列组合

### 方法一

```js
var a=['a1', 'a2', null],
var b=['b1','b2', 'b3', 'b4', 'any', null],
var c=['c1', 'c2', 'c3', 'c4', 'any', null],
var d=['d1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', null];

var newArr=[];
var index=0;
for(var i=0;i<a.length;i++){
    
    // 两两组合ab
	for(var j=0;j<b.length;j++){
		newArr[index]=[a[i]].concat(b[j]);
		index++;
      // 三三组合abc
        for(var k=0;k<c.length;k++){
		  newArr[index]=[a[i]].concat(b[j], c[k]);
		  index++;
          // 四组合
          for(var m=0;m<d.length;m++){
            newArr[index]=[a[i]].concat(b[j],c[k],d[m]);
            index++;
          }
	    }
      // 三三组合abd
        for(var m=0;m<d.length;m++){
		  newArr[index]=[a[i]].concat(b[j], d[m]);
		  index++;
	    }
	}
    for(var m=0;m<c.length;m++){
      // 两两组合ac
	    newArr[index]=[a[i]].concat(c[m]);
		index++;
	}
    for(var n=0;n<d.length;n++){
      // 两两组合ad
	    newArr[index]=[a[i]].concat(d[n]);
		index++;
      // 三三组合abd
        for(var m=0;m<b.length;m++){
		  newArr[index]=[a[i]].concat(b[m], d[n]);
		  index++;
	    }
	}
}
for(var x=0;x<b.length;x++) {
  for(var y=0;y<c.length;y++) {
    // 两两组合bc
    newArr[index]=[b[x]].concat(c[y]);
	index++;
    // 三三组合bcd
    for(var i=0;i<d.length;i++){
      newArr[index]=[b[x]].concat(c[y], d[i]);
      index++;
    }
  }
  // 两两组合bd
  for(var j=0;j<d.length;j++){
    newArr[index]=[b[x]].concat(d[j]);
    index++;
  }
}
for(var m=0;m<c.length;m++){
  // 两两组合cd
  for(var n=0;n<d.length;n++){
    newArr[index]=[c[m]].concat(d[n]);
    index++;
  }
}
console.log (newArr);
console.log(index);
```



### 方法二

```js
var a=['a1', 'a2', null],
var b=['b1','b2', 'b3', 'b4', 'any', null],
var c=['c1', 'c2', 'c3', 'c4', 'any', null],
var d=['d1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', null];

var temp = [];

var addTemp = function(obj) {
  var arr = [];
  var i = 0;
  Object.keys(obj).forEach(function(key, index) {
     arr.push(obj[key]);
     if(!obj[key]) {
       i++;
     }
  });
  if(arr.length !== i) {
     temp.push(obj);
  }
};

for(var i = 0, len = a.length; i < len; i++) {
  addTemp({a: a[i]});
  for(var j = 0,len2 = b.length; j < len2; j++) {
    addTemp({
      a: a[i],
      b: b[j]
    });
    for(var k = 0,len3 = c.length; k < len3; k++) {
      addTemp({
        a: a[i],
        b: b[j],
        c: c[k]
      });
      for(var f = 0,len4 = d.length; f < len4; f++) {
        addTemp({
          a: a[i],
          b: b[j],
          c: c[k],
          d: d[f]
        });
      }
    }
  }
}
console.log(temp.length);
```

