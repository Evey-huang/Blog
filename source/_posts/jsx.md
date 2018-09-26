---
title: JSX
date: 2018-09-26 14:34:33
tags: JSX
categories: React
---

## 什么是JSX

本质上来讲，JSX 只是为 React.createElement(component, props, ...children) 方法提供的语法糖。比如：

```react
<MyButton color="blue" shadowSize={2}>   Click Me </MyButton>
```

编译为：

```react
React.createElement(   MyButton,   {color: 'blue', shadowSize: 2},   'Click Me' )
```

## 使用JSX需要注意

- JSX中使用JavaScript表达式用大括号包起来。

```react
<h1>Hello, {formatName(user)}!</h1>
```

- if或者for语句里使用JSX，将它赋值给变量，当作参数传入，作为返回值都可以。

```react
function getGreeting(user) {      
    if(user) {         
        return <h1>Hello, {formatName(user)}!</h1>; /*当参传入数*/     
    }     
    return <h1>Hello, Stanger.</h1> /*作为返回值*/ 
}
```

- JSX换行和缩进时，推荐在JSX代码的外面扩上一个小括号，这样可以防止分号自动插入的bug。

```react
const element = (     
    getGreeting(user)  
);
```

- JSX标签是闭合式的。

```react
const element = <img src={user.avatarUrl} />;
```

- React DOM 使用camelCase小驼峰命名来定义属性的名称

```react
function formatName(user) {     return user.firstName + '' + user.lastName; }
```

- 所有的内容在渲染之前都被转换成来字符串，有效地防止XSS攻击。

```react
const title = response.potentiallyMaliciousInput; const element = <h1>{title}</h1>; /*这样写是安全的*/
```

- 注释语法：{/**/}

```react
const element = <img src={user.avatarUrl} />; /*注释*/
```

- JSX标签名不能为一个表达式，可以先赋值给一个变量

```react
/*wrong*/ 
function Story(props) {   
    return <components[props.storyType] story={props.story} />; } 
/*correct*/ 
function Story(props) {   
    const SpecificStory = components[props.storyType];   
    return <SpecificStory story={props.story} />; 
}
```

- 没有给属性传值，它默认为true

```react
/*两者等效*/ 
<TextBox autocomplete /> 
<TextBox autocomplete={true} /> 
```

