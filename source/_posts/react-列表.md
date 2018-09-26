---
title: 列表&Keys
date: 2018-09-22 07:31:43
tags: [列表, keys]
categories: React
---

## 渲染多个组件

可以通过花括号{}在JSX内构建一个元素集合

```react
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((numbers) =>
  <li>{numbers}</li>
);
ReactDOM.render(
  <ul>{listItems}</ul>,
  document.getElementById('root')
);
```



上面的例子通过使用`map()`方法遍历numbers数组，对数组中的每个元素返回`<li>`标签，最后得到一个数组`listItems`，然后把整个`listItems`插入到`ul`元素中，最后渲染进根DOM。

## 基础列表组件

通常需要渲染一个列表到组件中。当创建一个元素时，必须包括一个特殊的key属性。key是唯一的标识，可以使用数据里面的id作为key，key应该绑定在循环的组件上而不是DOM元素上，key应该在数组的上下文中被指定。

```react
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>{number}</li>
  );
  return (
    <ul>{listItems}</ul>
  );
}
 
 
const numbers = [1, 2, 3, 4, 5];
ReactDOM.render(
  <NumberList numbers={numbers}/>,
  document.getElementById('root')
);
```

