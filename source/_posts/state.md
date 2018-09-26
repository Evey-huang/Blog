---
title: State&生命周期
date: 2018-09-26 14:35:54
tags: [state, 生命周期]
categories: React
---

## State

- 局部状态state：一个功能只适用于类定义组件；
- 构造函数(constructor)是唯一能够初始化this.state的地方；
- 应当使用setState()更新局部状态，而不是直接更改this.state的值；
- this.props和this.state可能是异步更新，不能用来计算this.state的下一个值，应该用setState回调函数的方式传入参数；
- 当你调用setState()时，React将你提供的对象合并到当前状态，更新其中一个(state.name)属性时，会将该属性合并到this.state对象中；
- 自顶向下或单向数据流，任何状态始终由某些特定组件所有，并且从该状态导出的任何数据或UI只能影响树中的下方组件。

## 生命周期

- 挂载：组件加载到DOM中
- 卸载：生成的DOM被移除
- 生命周期钩子：componentWillUnmount()挂载前，componentDidUnmount()挂载后

```react
class Clock extends React.Component {
    constructor(props) { /*构造函数*/
        super(props); /*传递props*/
        this.state = {date: new Date()};/*唯一能够初始化this.state的地方*/
    }
    componentDidMount() { /*挂载，react元素加载到DOM中*/
        this.timerID = setInterval(
            () => this.tick(),
            1000
        );
    }
    componentWillUnmount() { /*卸载，react元素即将从DOM中删除*/
        clearInterval(this.timerID);
    }
    tick() {
        this.setState({ /*使用this.setState()来更新组件局部状态*/
            date: new Date()
        });
        /* setState回调函数的方式传入参数更改state的值
          this.setState((prevState, props) => ({
            date: prevState.date + 1
          }));
        */
    }
 
    render() {
        return (
            <div> /*自顶向下或单向数据流，结果为先渲染h1然后是h2，最后是h3*/
                <h1>Hello, world!</h1>
                <h2>Hello, Evey!</h2>
                <h3>It is {this.state.date.toLocaleTimeString()}</h3>
            </div>
        );
    }
}
ReactDOM.render(
    <Clock />,
    document.getElementById('root')
)
```

