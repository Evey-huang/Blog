---
title: React理念
date: 2018-11-08 18:06:43
tags: React
categories: React
---

- 单向数据流
- 确定UI组件层级
- 确定state的位置
- 添加反向数据流

## 例子：可搜索的产品数据表格

### 实现步骤：

1. 把UI划分出组件层级
2. 定义UI状态的最小表示（即确定有哪些state）
3. 确定state位置
4. 添加反向数据流



### 1. 把UI划分出组件层级

#### 层级结构

- FilterableProductTable：包含整个例子
  - SearchBar：接受所有的用户输入
  - ProductTable：根据用户输入过滤并展示数据集合
    - ProductCategoryRow：展示每个分类的标题
    - ProductRow：用行来展示每个产品



#### 效果图

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fwyjcj6ip8j30ig0l0adg.jpg)

### 2. 定义UI状态的最小表示

找出应用程序的绝对最小表示并计算你所需要的其他任何请求。

考虑`State`时遵循的三个问题：

1. 它是通过`props`从父级传来的吗？如果是，它可能不是`state`。
2. 它随着时间推移不变吗？如果是，它可能不是`state`。
3. 你能根据组件中任何其他的`state`或`props`把它计算出来吗？如果是，它不是`state`。

该实例应用中所有数据：

- 原产品列表
- 用户输入的搜索文本
- 复选框的值
- 产品的筛选列表

原产品列表被作为` props `传入，所以它不是 `state`。搜索文本和复选框似乎是 `state`，因为它们随时间改变并且不能由其他任何值计算出来。最后，产品的筛选列表不是` state`，因为它可以通过将原始产品列表与搜索文本和复选框的值组合计算出来。

最后，我们的`state`有：

- 用户输入的搜索文本
- 复选框的值

### 3. 确定State位置

确定你的` State` 应该放在哪个组件中，遵循的4个问题如下：

- 确定每一个需要这个`state`来渲染的组件
- 找到一个公共所有者组件(一个在层级上高于所有其他需要这个`state`的组件的组件)
- 这个公共所有者组件或另一个层级更高的组件应该拥有这个`state`
- 如果你没有找到可以拥有这个`state`的组件，创建一个仅用来保存状态的组件并把它加入比这个公共所有者组件层级更高的地方

最后，我们`State`的位置有：

- `ProductTable`需要根据state过滤产品列表，`SearchBar`需要展示搜索文本和复选框状态
- 公共所有者组件是`FilterableProductTable`
- 筛选文本和复选框的值应该放在`FilterableProductTable`

### 4. 添加反向数据流

也就是向`props`中添加事件处理程序，触发父组件传递给子组件用于修改父组件中`state`的回调函数，注意这里每个组件只能直接修改存储在自己内部的`state`，调用`this.setState()`函数进行修改，并不能直接修改自己上级或者下级组件的`state`：当要修改自己上级组件的`state`时，可以调用上级组件通过`props`传递给自己的回调函数；对下级组件的数据传递通过`props`。



### 源码

可搜索的产品数据表格实例完整源码[戳这里](https://github.com/Evey-huang/ReactDemo/blob/master/demo/SearchableForm.html)