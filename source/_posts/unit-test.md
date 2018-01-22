---
title: 第一个单元测试
date: 2017-12-06 16:42:08
tags: [单元测试, unit test]
categories: 单元测试
---

![JPG](http://p1cjg886l.bkt.clouddn.com/unit-vue1.jpg)

一开始让我学单元测试我是拒绝的，但是无奈师傅交给的任务。看了一早上的测试文章云里雾里差点睡着，下午就决定自己先来动手实践一下单元测试，到底单元测试是什么怎么写结果是怎样。

## 开始

#### 创建项目

使用vue-cli先创建一个vuejs项目，这里就不累赘了，另一篇文章《新建Vue项目》有写。

>注意！npm install安装依赖的时候要有耐心(其实是我网速慢)千万不要随便停止，因为那可能会漏装了东西导致后面会出BUG。我就是心急导致后面测试运行失败，只好默默地把node_modules删了再重新运行npm install

安装好依赖，接下来我们执行下面的命令，这个命令将会在本地运行你的应用并在浏览器中打开。

```
npm run dev
```

在项目中，可以找到下面这些目录：`build`、`config`、`node_modules`、`src`、`static` 和 `test`。对于本教程来说最重要的是`src`，它包括我们应用的代码，用来测试。

#### 第一次测试

我们将从创建简单的列表组件开始。在 `src/components` 里创建一个新文件叫做 `list.vue` 并且将下面代码写进去。

**list.vue**

```
<template>
    <div>
        <h1>My To Do List</h1>
        <br>
        <!-- displays list -->
        <ul>
            <li v-for="item in listItems">{{item}}</li>
        </ul>
    </div>  
</template>

<script>
export default {
  name: 'list',
  data () {
    return {
      listItems: ['buy food', 'play games', 'sleep']
    }
  }
}
</script>

```

在这个组件中，列表项被储存在数组（`listItems`）里面。数据被传递到模板，然后被遍历`v-for`，最后展现在页面上。

我们需要看到刚刚创建的列表，所以我们创建一个新的路由来展示这个组件。在`src/router/index.js`中创建一个路由，添加完了代码应该是下面这样的：

```
import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import List from '@/components/list'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/to-do',
      name: 'ToDo',
      component: List
    }
  ]
})
```

现在，访问[localhost:8080/#/to-do](http://localhost:8080/#/to-do)，可以看到我们做的页面。

![PNG](http://p1cjg886l.bkt.clouddn.com/unit-vue2.png)

首先，我们要测试的是数据的正确性。在`test/unit/specs`目录下创建一个`list.spec.js`，并且写入下面的代码：

```
// 在这个文件中我们describing了list.vue组件，并且创建了一个空的测试，
// 它将要检查这个组件的列表展示，这是一个基本的Mocha测试文件
import Vue from 'vue'
import List from '@/components/list'

describe('list.vue', () => {
  it('display items from the list', () => {
    // our test goes here
    // build component   我们继承了Vue组件并安装了这个组件
    const Constructor = Vue.extend(List)
    const ListComponent = new Constructor().$mount()
    // 下面是第一个断言，我们使用Chai断言提供的'expect'模式还有'should'和'assert'模式。这个断言用来检查HTML列表中的文本是否和组件的data里的数据列表吻合。
    expect(ListComponent.$el.textContent).to.contain('play game') 
    // 可以使用ListComponent.$el来获取组件的HTML，用ListComponent.$el.textContent获取HTML内的内容
  })
})

```



最后就是使用`npm run unit`来运行`cross-env BABEL_ENV=test karma start test/unit/karma.conf.js --single-run`。

>我就是被卡在了这里，运行`npm run unit`出现错误
>
>![PNG](http://p1cjg886l.bkt.clouddn.com/unit-vue3.png)
>
>综合github和stack overflow的回答，想了想问题可能出现在依赖安装上，我没有等它自己安装完就停止了，后来又用cnpm安装但是应该没装全，所以我把node_modules卸载了重装，现在还在装网速简直慢到不行
>
>![PNG](http://p1cjg886l.bkt.clouddn.com/unit-vue4.png)
>
>保持这个进度已经很久了，简直崩溃。
>
>最后建议网络慢的使用cnpm装，我用cnpm装快得飞起。

如果测试都通过了，将会有一个绿色的列表来显示测试报告，让你了解测试都覆盖了哪些代码。

![PNG](http://p1cjg886l.bkt.clouddn.com/unit-vue5.png)

#### 模拟用户输入

上一步做了一个简单的功能，只能展示数据并不能做交互，下一步要做的就是做简单的交互往to-do list中添加新项目。

创建一个Input框来输入内容，一个button用来提交内容。

**list.vue**

```
<!--使用v-model，输入框里面的内容将和newItem进行双向绑定。
当按钮被点击后执行addItemToList，将newItem添加到to-do list数组里，并且清空newItem里面的内容，新的项目将会被添加到列表中-->
<template>
    <div>
        <h1>My To Do List</h1>
        <br>
        <!-- displays list -->
        <input type="text" v-model="newItem"> 
        <button @click="addItemToList">Add</button>
        <ul>
            <li v-for="item in listItems">{{item}}</li>
        </ul>
    </div>  
</template>

<script>
export default {
  name: 'test',
  data () {
    return {
      listItems: ['buy food', 'play games', 'sleep'],
      newItem: ''
    }
  },
  methods: {
    addItemToList () {
      this.listItems.push(this.newItem)
      this.newItem = '' // 清空newItem里面的内容
    }
  }
}
</script>
```

然后更新测试文件

**list.spec.js**

```
import Vue from 'vue'
import List from '@/components/list'

describe('list.vue', () => {
  it('add a new item to list on click', () => {
    // build component   我们继承了Vue组件并安装了这个组件
    const Constructor = Vue.extend(List)
    const ListComponent = new Constructor().$mount()

    // set value of new item  给newItem设置内容
    ListComponent.newItem = 'brush my teeth'

    // find button  querySelector可以像选择真的元素一样选择这个按钮。
    const button = ListComponent.$el.querySelector('button')

    // simulate click event  模拟点击事件
    const clickEvent = new window.Event('click')
    button.dispatchEvent(clickEvent)
    ListComponent._watcher.run()

    // assert list contains new item  检查断言列表包含新项目
    expect(ListComponent.$el.textContent).to.contain('brush my teeth')
    expect(ListComponent.listItems).to.contain('brush my teeth')
  })
})
```

运行这个测试文件`npm run unit`

![PNG](http://p1cjg886l.bkt.clouddn.com/unit-vue6.png)

一个完整的成功的单元测试就完成啦~