---
title: 组合VS继承
date: 2018-09-26 14:28:35
tags: [组合, 继承]
categories: React
---

# 组合VS继承

- React具有强大的组合模型，建议使用组合而不是继承来复用组件之间的代码
- 包含关系。一些组件（比如Sidebar或Dialog）不能提前知道它们的子组件是什么，所以建议这些组件使用children属性将子元素直接传递到输出
- 特殊实例。有时我们认为组件是其他组件的特殊实例，这也是通过组合来实现的，通过配置属性（props）用较特殊的组件来渲染较通用的组件

```react
function FancyBorder(props) {
  console.log(props)
  return (
    <div className={'FancyBorder FancyBorder-' + props.color}>
      {props.children}
    </div>
  );
}
function Dialog(props) {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">{props.title}</h1>
      <p className="Dialog-message">{props.message}</p>
    </FancyBorder>
  );
}
 
function WelcomeDialog() {
  return (
    <Dialog title="welcome" message="Thank you for visiting our spacecraft!" />
  );
}
```



