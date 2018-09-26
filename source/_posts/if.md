---
title: 条件渲染
date: 2018-09-26 11:53:46
tags: [if, 与运算符, 三目运算符]
categories: React
---



- 使用JavaScript操作符if或条件运算符来创建表示当前状态的元素，然后让React根据它们来更新UI；
- 元素变量。可以声明一个变量来储存元素，渲染组件得其中一部分元素；
- 与运算符&&。通过用花括号包裹代码在JSX中嵌入任何表达式，也包括JavaScript的逻辑与&&，JavaScript中，true&&expression总是返回expression，而false&&expression总是返回false，如果条件是true，&&右侧的元素就会被渲染，如果是false，React会忽略并跳过它；
- 三目运算符。condition ？ true ： false；
- 阻止组件渲染：让render方法返回null即可阻止组件渲染

```react
function WarningBanner(props) {
  if(!props.warn) {
    return null; /*返回null，阻止组件渲染*/
  }
  const a = <a>超链接</a>;/*存储元素到变量*/
  if(props.warn == "a") { /*if条件句渲染*/
    return a;
  }
  return (
    <div className="warning">
      Warning!
    </div>
  );
}
class Page extends React.Component {
  constructor(props) {
    super(props);
    this.state = {showWarning: true}
    this.handleToggleClick = this.handleToggleClick.bind(this);
  }
  handleToggleClick() {
    this.setState(prevState => ({
      showWarning: !prevState.showWarning
    }));
  }
  render() {
    return (
      <div>
        <WarningBanner warn={this.state.showWarning} />
        <button onClick={this.handleToggleClick}>
          {this.state.showWarning ? 'Hide' : 'Show'} /*三目运算符渲染*/
        </button>
        {this.props.warn == "b" && <a>b超链接</a>} /*与运算符&&渲染*/
      </div>
    );
  }
}
```

