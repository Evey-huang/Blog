---
title: 组件&props
date: 2018-09-26 14:30:48
tags: props
categories: React
---

组件可以将UI切分成一些独立的、可复用的部件，从概念上看就像是函数，它可以接收任意的参数（称之为“props”），并返回一个需要在页面上展示的React元素。由于props具有只读性，因此所有的React组件必须像纯函数那样使用它们的props。

## 组件定义

定义组件有两种方法，分别为函数定义和类定义，例：

```react
/*函数定义组件*/
function Welcome(props) { /*自定义组件，组件名首字母大写*/
  return <h1>Hello, {props.name}</h1>;
}
/*类定义组件*/
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```



## 组合组件

组件可以在它的输出中引入其他组件，React应用中按钮、表单、对话框、整个屏幕的内容等这些通常都被表示为组件，组件的返回值只能有一个根元素。

```react
function App() {
  return (
    <div> /*组件的返回值只能有一个根元素*/
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
    </div>
  );
}
```



## 提取组件

组件由于嵌套太多会变得难以被修改，可复用的部分也难以被复用。在大型应用中，构建可复用组件是很有必要的。例：

```react
/*提取前*/
function Comment(props) {
  return (
    <div className="Comment">
      <div className="UserInfo">
        <img className="Avatar"
             src={props.author.avatarUrl}
             alt={props.author.name} />
      </div>
    </div>
  );
}
/*提取后*/
function Avatar(props) {
  return (
    <img className="Avatar"
         src={props.user.avatarUrl}
         alt={props.user.name} />
  );
}
function UserInfo(props) {
  return (
    <div className="UserInfo">
      <Avatar user={props.user} />
    </div>
  );
}
function Comment(props) {
  return (
    <div className="Comment">
      <UserInfo user={props.author} />
    </div>
  );
}
```

