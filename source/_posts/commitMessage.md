---
title: 规范commit message
date: 2018-11-22 17:32:02
tags: [git, commit message]
categories: git
---

## 为什么需要标准化的commit message

- 提供更多的历史信息，方便快速浏览
- 可以直接从commit生成Changelog
- 为了装B

## 如何规范commit message

commit规范可以通过以下工具来约束：

- [commitlint](https://github.com/marionebl/commitlint):用来校验 `git commit message` 的工具
- [husky](https://github.com/typicode/husky):可以防止坏的git commit
- [commitizen](https://github.com/commitizen/cz-cli):用来格式化 `git commit message` 的工具



### Install commitlint

```shell
npm install --save-dev @commitlint/cli @commitlint/config-conventional
```

在项目中添加`commitlint.config.js`文件

```js
module.exports = {extends: ['@commitlint/config-conventional']}
```



### Install husky

```bash
npm install --save-dev husky
```

在`package.json`中添加

```json
"husky": {
    "hooks": {
      "pre-commit": "npm test",
      "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
    }
  },
```

### Test

wrong

![wrong test](https://ws2.sinaimg.cn/large/006tNbRwgy1fxdhcu6ctkj31740d944k.jpg)

correct

![correct test](https://ws1.sinaimg.cn/large/006tNbRwgy1fxdhfa13saj311t0anaep.jpg)

### Install commitizen

```bash
npm install -g commitizen
npm install cz-conventional-changelog --save-dev // changelog，是生成changelog的工具
commitizen init cz-conventional-changelog --save-dev --save-exact // 使其支持Angular的Commit message格式
```

在`package.json`中添加

```json
"config": {
    "commitizen": {
      "path": "./node_modules/cz-conventional-changelog"
    }
  },
```

Use `git cz` instead of `git commit` when committing

### Test

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fxdiyepfpnj31a60f3gt3.jpg)

#### Commit Type

- feat：新功能（new feature）
- fix：修补bug（bug fix）
- docs：文档更新（documentation change）
- style：格式，不影响代码运行的变动（not affect the meaning of the code）
- refactor：重构，既不是新增功能也不是修补bug的代码变动（a code change that neither fixes a bug nor a feature）
- perf：性能，提高性能的代码变动（a code change that improves performance）
- test：增加测试
- build：涉及构建系统和依赖的修改，比如npm、gulp
- ci：涉及CI配置文件的修改，比如travis
- chore：构建过程或辅助工具的变动（other changes that don't modify src or test files）
- revert：恢复之前的提交