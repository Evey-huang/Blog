---
title: 从自动化测试到持续集成
date: 2017-12-20 16:53:47
tags: [jenkins, 持续集成, 自动化测试]
categories: 测试
---

## 背景

简单直接点，这篇文章就是写如何将自动化测试跟持续集成挂钩起来，怎么将单元测试在jenkins上跑起来。

持续集成整个过程大概是这样：

developer在本地工作，将本地工作push到代码仓库（可以是github公有仓库也可以是bitbucket私有仓库），然后会触发CI服务器（CI即持续集成服务器，CI服务器有很多，这里以jenkins做例子。）事先写好的脚本，脚本可以完成编译、单元测试等工作。最后如果代码没有问题则部署到开发环境。

![JPG](http://p1cjg886l.bkt.clouddn.com/jenkins13.jpg)



## 过程

### 准备

1. 在本地安装好jenkins并顺利跑起来
2. 有jenkins账号

### 创建jenkins项目

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins1.png)



新建一个pipeline风格的项目，名称为unit-test

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins2.png)



### Jenkins Job的基本配置

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins3.png)



pipeline script写的是需要执行的脚本，`git branch`是指要拉取的测试分支，`credentialsId`指拉取代码时需要的密钥，`url`指存放代码的仓库地址。

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins4.png)

点击`pipeline syntax`进入添加插件的页面

### 如何配置在jenkins生成测试覆盖率报告

进入添加插件页面后，选择`publish HTML reports`插件

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins5.png)

填写单元测试覆盖率报告路径和jenkins生成测试报告存放路径，点击`代码段生成器`按钮生成代码

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins6.png)



将代码生成器生成的代码粘贴到`pipeline script`

```shell
pipeline {
    agent { label 'slave0' }
    stages {
        stage('prepare') {
            steps {
                git branch: '需要测试的分支', credentialsId: '用于拉取代码的密钥', url: 'ssh://代码仓库地址'
            }
        }
        stage('build') {
            steps {
                sh 'cnpm install'
                sh 'npm run test' // 执行单元测试
                publishHTML (target: [
                  allowMissing: false,
                  alwaysLinkToLastBuild: false,
                  keepAll: true,
                  reportDir: 'test/unit/coverage/lcov-report', // 项目单元测试覆盖率报告存放路径
                  reportFiles: 'index.html', // 项目单元测试覆盖率报告文件
                  reportName: "RCov Report" // 在jenkins生成的测试报告
                ])
            }
        }
    }
}
```



### 执行pipeline脚本

保存后点击`立即构建`开始执行pipeline脚本。若是pipeline脚本有变动则需点`立即构建`，如果只是测试代码有变动则点`Replay`即可。

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins9.png)

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins10.png)

不管构建成不成功都会有一个日志`Logs`。若成功点开可查看测试结果，若失败可以查看失败原因然后调整再次进行构建。

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins11.png)

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins12.png)



### 查看测试报告

构建成功后会生成测试报告，点击`RCov Report`查看单元测试覆盖率。

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins7.png)

![PNG](http://p1cjg886l.bkt.clouddn.com/jenkins8.png)



## 最后

写了这么多，又是自动化测试又是持续集成什么的看似很高大上，但是做完这些也仅仅是入门而已，没错就是入门。离真正做到自动化还远着呢。私以为，搭环境这些都不难，难的是如何把单元测试用例写好，如何坚持下去。