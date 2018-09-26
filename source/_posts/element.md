---
title: 元素渲染
date: 2018-09-26 11:55:42
tags: element
categories: React
---



元素是构成React应用的最小单位。元素构成组件，组件又构成应用。元素用来描述你在屏幕上看到的内容，比如：

```react
const element = <h1>Hello world!</h1>;
```



## 渲染元素到DOM

在此`div`中的所有内容都将由React DOM来管理，称之为“根”DOM节点。一个用React构建的应用程序通常只有一个根DOM节点。

```react
<div id="root"></div>
```



要将React元素渲染到根DOM节点中，我们通过把它们都传递给 `ReactDOM.render()` 的方法来将其渲染到页面上：

```react
const element = <h1>Hello World!</h1>
ReactDOM.render(
  element,
  document.getElementId('root')
);
```



## 更新元素渲染

React元素都是不可变的，即当元素被创建后，是无法改变其内容或属性的。根据目前所学知识，更新界面的唯一办法是创建一个新的元素，然后将它传入ReactDOM.render()方法。例：

```react
function tick() {
  const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {new Date().toLocaleTimeString()}.</h2>
    </div>
  );
  ReactDOM.render(
    element,
    document.getElementById('example')
  );
}
// React DOM 首先会比较元素内容先后的不同，而在渲染过程中只会更新改变了的部分。即这里只会更新时间
setInterval(tick, 1000); /*通过setInterval方法每秒钟调用一次ReactDOM.render()，以此更新元素渲染*/
```



## 按需更新元素渲染

React DOM 首先会比较元素内容先后的不同，而在渲染过程中只会更新改变了的部分。

在上个例子中感觉每秒根节点所有内容都重新渲染更新一次，其实只有时间在变化，h1文本不变。