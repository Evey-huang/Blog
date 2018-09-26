---
title: 事件处理
date: 2018-09-26 11:52:02
tags: 事件
categories: React
---



- React事件绑定属性的命名采用驼峰式写法；

```react
/*传统HTML*/
<button onclick="activeLasers()">Activate Lasers</button>
/*React*/
<button onClick="activeLasers()">Activate Lasers</button>
```



- 如果采用JSX的语法你需要传入一个函数作为事件处理函数，而不是一个字符串（DOM元素写法）；
- 在React中不能使用返回false的方式阻止默认行为，必须明确使用e.preventDefault();

```react
/*传统HTML*/
<a href="#" onclick="console.log('The link was clicked.'); return false">Click me</a>
 
 
/*React*/
function ActionLink() {
    function handleClick(e) {
        e.preventDefault();
        console.log('The link was clicked.');
    }
    return (
        <a href="#" onClick={handleClick}>
          Click me
        </a>
    );
}
```



- 类的方法默认不会绑定this，如果没有在方法后面添加"()"，则要构造函数中为这个方法绑定this；

```react
class Toggle extends React.Component {
    constructor(props) {
        super(props);
        this.state = {isToggleOn: true};
        this.handleClick = this.handleClick.bind(this);/*构造函数中绑定this*/
    }
 
    handleClick() {
        this.setState(prevState => ({
            isToggleOn: !prevState.isToggleOn
        }));
    }
 
    render() {
        return (
            <button onClick={this.handleClick}>
                {this.state.isToggleOn ? 'ON' : 'OFF'}
            </button>
        );
    }
}
```



- 向事件处理程序传递参数。参数 `e` 作为 React 事件对象将会被作为第二个参数进行传递。通过箭头函数的方式，事件对象必须显式的进行传递，但是通过 `bind` 的方式，事件对象以及更多的参数将会被隐式的进行传递。

```react
/*参数 e 作为 React 事件对象将会被作为第二个参数进行传递*/
<button onClick={(e) => this.deleteRow(id, e)}>Delete Row</button>
 
 
/*通过 bind 方式向监听函数传参*/
<button onClick={this.deleteRow.bind(this, id)}>Delete Row</button>
```

