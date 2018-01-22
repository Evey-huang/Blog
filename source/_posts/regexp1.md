---
title: RegExp正则表达式基本使用
date: 2017-12-12 22:08:02
tags: 正则基本使用
categories: 教程
---



## 正则表达式是什么？

正则表达式是用于匹配字符串中字符组合的模式。在 JavaScript中，正则表达式也是对象。这些模式被用于 [`RegExp`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/RegExp) 的 [`exec`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) 和 [`test`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) 方法, 以及 [`String`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/String) 的 [`match`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/match)、[`replace`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/replace)、[`search`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/search) 和 [`split`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/split) 方法。本章介绍JavaScript的正则表达式（因为目前我只学过JavaScript的正则表达式呀）。

## 可以做什么？

### 检验格式

比如判断某字符串是否全部由数字组成

```
/^\d+$/.test('12345');
// true

/^\d+$/.test('12345abc');
// false
```

### 内容替换

比如将字符串中的数字替换成$号

```
'abcd1234'.replace(/\d/g,'$');
// "abcd$$$$"
```

### 提取内容

字符串的 `match` 方法可以将匹配到的字符串片段复制到数据中并返回

```
'abcd1234'.match('cd12');
// ["cd12", index: 2, input: "abcd1234"]
```

### 确定位置

用下面两种方法可以获得被匹配字符串片段的起始和终止位置。

```
var regexp = /<span>.*?<\/span>/g;
regexp.exec('aabb');

// ["<span>aa</span>", index: 5, input: "aabb"](从1数起，第一个span结尾>的位置)
'aabb'.search(regexp);
// 5(从0数起，第一个span的<的位置)
```

### 分割字符串

一般的字符串分割都是基于固定的分隔符，但是在某些场景下需要用正则做更复杂的处理， 比如用空格来分割字符串，如果有两个连续的空格出来的结果可能不是我们期待的， 这时就要用正则来处理。

```
'a   b c'.split(' ');
// ["a", "", "", "b", "c"]
```

## 怎么玩？

### 创建正则

两种方式，一种是使用一个正则表达式字面量，其由包含在斜杠之间的模式组成

```
const regex = /ab+c/;
const regex = /^[a-zA-Z]+[0-9]*\W?_$/gi;
```

另一种是调用`RegExp`对象的构造函数

```
let regex = new RegExp("ab+c");
let regex = new RegExp(/^[a-zA-Z]+[0-9]*\W?_$/, "gi");
```

###### 参数

- g :全局匹配;找到所有匹配，而不是在第一个匹配后停止
- i :忽略大小写
- m :多行; 将开始和结束字符（^和$）视为在多行上工作（也就是，分别匹配每一行的开始和结束（由 \n 或 \r 分割），而不只是只匹配整个输入字符串的最开始和最末尾处。
- u :Unicode; 将模式视为Unicode序列点的序列
- y :粘性匹配; 仅匹配目标字符串中此正则表达式的lastIndex属性指示的索引(并且不尝试从任何后续的索引匹配)。

### 特殊字符

特殊字符有很多，其含义和用法可以参考MDN文档

### RegExp对象方法

这里想讲test、match、exec和replace这四种方法，因为这几种非常常见和常用也是我学习正则时遇到的难点。

| 用法                                  | 说明                                      | 返回值                      |
| ----------------------------------- | --------------------------------------- | ------------------------ |
| `pattern.test(str)`                 | 判断`str`是否包含匹配结果                         | 包含返回`true`，不包含返回`false`。 |
| `pattern.exec(str)`                 | 根据`pattern`对`str`进行正则匹配                 | 返回匹配结果数组,如匹配不到返回`null`   |
| `str.match(pattern)`                | 根据`pattern`对str进行正则匹配                   | 返回匹配结果数组,如匹配不到返回`null`   |
| `str.replace(pattern, replacement)` | 根据`pattern`进行正则匹配,把匹配结果替换为`replacement` | 一个新的字符串                  |

###### test()

字符串的`test`方法，比较常用在判断语句中，用于检测一个字符串是否匹配某个模式：

```
RegExpObject.test(string)
```

例：如果字符串 string 中含有与 RegExpObject 匹配的文本，则返回 true，否则返回 false：

```
/\d/.test('asdf2')
// true （字符串中含有数字所以返回true）
```

###### match()

`match()` 方法可在字符串内检索指定的值，或找到一个或多个正则表达式的匹配。

- 非全局匹配

  例：

  ```
  var a = 'abcd'.match(/\w/);
  console.log(a);
  // ["a", index: 0, input: "abcd"] （只匹配第一个就停止了）
  ```

- 全局匹配

  例：

  ```
  var a = 'abcd'.match(/\w/g);
  console.log(a);
  // ["a", "b", "c", "d"] （匹配全部才停止）
  ```

###### exec()

exec()方法用于比较复杂的模式匹配或者是说你为你提供更多的信息：

```
RegExpObject.exec(string)
```

如果在string中找到了匹配的文本，则返回一个包含这些文本的数组，否侧返回`null`。

- 返回的数组的第一个元素是与整个正则匹配的文本，然后数组的第二个元素是与整个正则的第一个子表达式(分组)相匹配的文本，数组的第三个元素整个正则的第二个子表达式(分组)相匹配的文本，以此类推。例：

```
var result = /(\d+)-(\w+)/.exec('12-ab');
console.log(result);
// ["12-ab", "12", "ab", index: 0, input: "12-ab"]
```

- 从上面返回的数组结果可知，数组添加了两个额外的属性，分别是：`index, input`

  `index:` 匹配文本的第一个字符的位置。

  `input:` 指输入的整体的文本。

  例：

  ```
  console.log(result.index)
  // 0
  console.log(result.input)
  // 12-ab
  ```

  ​

- 执行exec函数时，尽管是全局匹配的正则表达式，但是exec方法只对指定的字符串进行一次匹配，

  获取字符串中第一个与正则表达式想匹配的内容，并且将匹配内容和子匹配的结果存储到返回的数组中。

  例：

  ```
  /\d/g.exec('aa22')
  // ["2", index: 2, input: "aa22"] （只匹配一个数字就停止了）
  ```

  ​

###### replace()

replace()方法用于在字符串中用一些字符替换另一些字符，或替换一个与正则表达式匹配的子串。这个方法接收两个必须的参数：

- `pattern:` 这个参数可以是字符串或是RegExp对象。
- `replacement：` 替换匹配项的字符串或处理函数的返回值

返回结果：

- 当未找到匹配项的时候，返回原始字符串。

  例：

  ```
  'aaaa'.replace('bbb', 'b')
  // "aaaa"
  ```

- 当pattern为字符串或者为非全局的RegExp对象的时候，只替换找到的第一项匹配项。

  例：

  ```
  'aaaa'.replace('a', 'b')
  // "baaa"
  ```

- 当pattern为全局的RegExp对象的时候，替换每一项匹配项。

  例：

  ```
  'aaaa'.replace(/\w/g, 'b')
  // "bbbb"
  ```

- replacement为函数时，函数的返回值将作为替换字符串;函数的第一个参数的值是每一个匹配项,当然还有第二个参数，它的值是每个匹配项在原始字符串的中位置，从0开始。

  例：

  ```
  aaaa'.replace(/\w/g, function() {
      return 'b';
  });
  // "bbbb"
  ```

  ​

## 最后

学习正则最重要的就是正则表达式要写对，我比较笨有时候会写很久。这里推荐两个比较有用的好帮手帮助更有效率地学习正则。

- <http://regex.zjmainstay.cn/>（可以在线检测表达式写的是否正确）
- <https://jex.im/regulex/#!flags=&re=%5E(a%7Cb)*%3F%24>（可以看到清晰明了的逻辑图）