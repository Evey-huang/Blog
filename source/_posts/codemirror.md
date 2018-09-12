---
title: CodeMirror——在线代码编辑器
date: 2018-09-12 19:24:54
tags: codeMirror
categories: 其他
---

学React正开心，同事突然叫我帮忙弄一下这个编辑器，什么鬼？？我没搞过，whatever，撸起袖子开造就对了。

## 什么是CodeMirror

- github[戳这里](https://github.com/codemirror/CodeMirror)
- 官方文档[戳这里](https://codemirror.net/)
- 其他[自行google](https://www.google.com.hk/?gws_rd=cr,ssl)



## 使用CodeMirror的一个例子

先执行下列命令

```shell
$ npm install -g create-react-app
$ create-react-app editor
$ cd editor/
$ cd src/
$ rm -rf *
$ touch index.js
```

给index.js添加以下内容：

```js
import React from 'react';
import ReactDOM from 'react-dom';
import IceContainer from '@icedesign/container';
import { UnControlled as CodeMirror } from 'react-codemirror2';
import { Grid } from '@icedesign/base';
import 'codemirror/lib/codemirror.css';
import 'codemirror/theme/icecoder.css'; // 主题
import 'codemirror/mode/shell/shell.js'; // 代码高亮

require('codemirror/mode/javascript/javascript');

const { Row, Col } = Grid;

const codeString = `npm run dev`;
class CustomCodemirror extends React.Component {
    static displayName = 'CustomCodemirror';

    static propTypes = {};

    static defaultProps = {};

    constructor(props) {
        super(props);
        this.state = {
        value: codeString,
        };
    }

    onChange = (editor, data, value) => {
        console.log({ data, value });
        this.setState({
        value,
        });
    };
    renderCodeMirror = () => {
        const options = {
            mode: 'shell',
            lineNumbers: true,
            tabSize: '2',
            theme: "icecoder",
        };

        return (
            <CodeMirror
            value={this.state.value}
            options={options}
            onChange={this.onChange}
            />
        );
    };
    
    render() {
        return (
            <IceContainer>
            <Row wrap>
                <Col l="12" xxs="24">
                {this.renderCodeMirror()}
                </Col>
            </Row>
            </IceContainer>
        );
    }
}
ReactDOM.render(
    <CustomCodemirror />,
    document.getElementById('root')
);
```

然后再执行以下命令：

```shell
$ npm install @icedesign/base @icedesign/container codemirror react-codemirror2
$ npm start
```

查看效果：

![](http://p1cjg886l.bkt.clouddn.com/codemirror.png)

查看[全部代码](https://github.com/Evey-huang/CodeMirror)

## 具体使用

- 更改主题
- 设置编译器编程语言
- 折叠代码
- 智能提示
- 括号匹配
- 绑定Vim
- 显示行号
- 全屏模式

#### 更改主题

CodeMirror内置50+种主题，可以[戳这里预览](https://codemirror.net/demo/theme.html)

```js
import 'codemirror/theme/icecoder.css';
options = {
    theme: "icecoder",
};
```

#### 设置编译器编程语言

CodeMirror支持很多种编程语言，想知道具体有哪些，可以[戳这里](https://codemirror.net/mode/index.html)

```js
import 'codemirror/mode/shell/shell.js'; // 设置语言关键词高亮
options = {
    mode: 'shell',
};
```

#### 折叠代码

仅支持JavaScript、HTML、Markdown和Python，预览[戳这里](https://codemirror.net/demo/folding.html)

```js
import 'codemirror/addon/fold/foldcode.js';
import 'codemirror/addon/fold/foldgutter.js';
import 'codemirror/addon/fold/brace-fold.js';
import 'codemirror/addon/fold/comment-fold.js';
import 'codemirror/addon/fold/foldgutter.css';

options = {
    lineWrapping:true,
    foldGutter: true,
    gutters:["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
};
```

#### 智能提示

[效果预览戳这里](https://codemirror.net/demo/complete.html)

```js
import 'codemirror/addon/hint/show-hint.js';
import 'codemirror/addon/hint/anyword-hint.js';
import 'codemirror/addon/hint/show-hint.css';

options = {
    extraKeys:{"Ctrl-Space":"autocomplete"},
};
```

#### 括号匹配

[效果预览戳这里](https://codemirror.net/demo/closebrackets.html)

```js
import 'codemirror/addon/edit/matchbrackets.js';

options = {
    matchBrackets:true,
};
```

#### 绑定Vim

[效果预览戳这里](https://codemirror.net/demo/vim.html)

```js
options = {
    keyMap:"vim",
};
```

#### 显示行号

```js
options = {
    lineNumbers:true,
};
```

#### 全屏模式

[效果预览戳这里](https://codemirror.net/demo/fullscreen.html)

```js
import 'codemirror/addon/display/fullscreen.js';
import 'codemirror/addon/display/fullscreen.css';

options = {
    fullScreen:true,
};
```

## 其他

更多用法[戳这里](https://codemirror.net/)

更多预览效果[戳这里](