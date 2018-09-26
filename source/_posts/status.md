---
title: 状态提升
date: 2018-09-26 11:56:56
tags: [status, props]
categories: React
---

# 状态提升

在构建真实应用的时候，随着业务的复杂度的提升，我们编写的组件的结构层次也会越来越复杂，处理的数据也会越来越庞大，同一份数据有时会由多个不同的组件渲染，因此在多个不同的组件内部有可能会修改同一份数据，这样便出现了数据共享问题。解决这个问题的初步方式之一就是状态提升。

## 状态提升过程

状态提升的做法就是将在某个界面位置相邻组件的数据统一交由公共的父组件管理，由父组件负责接收数据，将其变为内部的state，然后将公共部分的state数据以props的方式传入到子组件，然后子组件通过暴露updateState的回调接口给父组件，在子组件内部需要更新新的数据时，只要通过回调接口把数据传回给父组件，之后父组件再接收新数据同时调用setState()方法来更新数据状态，这样其他子组件也会随之而更新。这样便将状态的维护统一由一个组件来维护，将可能的bug完全封装在一个组件内部。如果将来界面变动，要求添加新的子组件时，只要按这个做法继续添加就可以，不会影响到其它组件。

![状态提升](http://p1cjg886l.bkt.clouddn.com/status.png)



例如：

下列示例中，定义了两个会修改温度temperature的输入框组件，把这个temperature属性交给Calculator组件来维护，然后在Calculator里将temperature属性分别以props的形式向下传递给输入组件，同时暴露一个回调，在内部以事件的形式，在用户输入后将新的数据回传给Calculator修改，Calculator在获得新数据后使用setState()方法来进行刷新，这样两个输入框数据就可以同步更新。

```react
const scaleNames = {
  c: 'Celsius',
  f: 'Fahrenheit'
};
 
// 摄氏度和华氏度互相转换函数
function toCelsius(fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}
 
function toFahrenheit(celsius) {
  return (celsius * 9 / 5) + 32;
}
 
// 当temperature输入不合法时，这个函数就会返回空字符串
function tryConvert(temperature, convert) {
  const input = parseFloat(temperature);
  if(Number.isNaN(input)) {
    return '';
  }
  const output = convert(input);
  const rounded = Math.round(output * 1000) / 1000;
  return rounded.toString();
}
 
function BoilingVerdict(props) {
  if(props.celsius >= 100) {
    return <p>The water would boil</p>;
  }
  return <p>The water would not boil</p>;
}
 
class TemperatureInput extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }
 
  handleChange(e) {
    this.props.onTemperatureChange(e.target.value);
  }
 
  render() {
    const temperature = this.props.temperature;
    const scale = this.props.scale;
    return (
      <fieldset>
        <legend>Enter temperature in {scaleNames[scale]}</legend>
        <input value={temperature} onChange={this.handleChange} />
      </fieldset>
    );
  }
}
class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.handleCelsiusChange = this.handleCelsiusChange.bind(this);
    this.handleFahrenheitChange = this.handleFahrenheitChange.bind(this);
    this.state = {temperature: '', scale: 'c'};
  }
   
  handleCelsiusChange(temperature) {
    this.setState({scale: 'c', temperature});
  }
 
  handleFahrenheitChange(temperature) {
    this.setState({scale: 'f', temperature});
  }
  render() {
    const scale = this.state.scale;
    const temperature = this.state.temperature;
    const celsius = scale === 'f' ? tryConvert(temperature, toCelsius) : temperature;
    const fahrenheit = scale === 'c' ? tryConvert(temperature, toFahrenheit) : temperature;
    return (
      <div>
        <TemperatureInput scale="c" temperature={celsius} onTemperatureChange={this.handleCelsiusChange}/>
        <TemperatureInput scale="f" temperature={fahrenheit} onTemperatureChange={this.handleFahrenheitChange}/>
        <BoilingVerdict celsius={parseFloat(celsius)}/>
      </div>
    );
  }
}
 
ReactDOM.render(
  <Calculator />,
  document.getElementById('root')
);
```

