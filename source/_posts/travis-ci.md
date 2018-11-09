---
title: 持续集成服务Travis CI了解下
date: 2018-09-26 14:40:38
tags: [Travis CI, 持续集成服务]
categories: git
---

## 什么是持续集成

持续集成(Continuous Integration,简称CI)，指的是在一个项目中，任何人对代码库的任何改动都会触发CI服务器自动对项目进行构建，自动运行测试，甚至自动部署到测试环境。优点是随时发现问题，随时修复。



## 如何为Github上托管的开源项目用Travis CI进行持续集成

### 什么是Travis CI

Travis CI是一个在线的、分布式的持续集成服务，用来构建及测试在Github托管的代码。

### 使用Travis CI先决环境

要开始使用Travis CI，需要满足以下条件：

- 拥有一个Github账户
- 拥有Github上托管的项目的所有者权限



### 开始使用Travis CI

1. 访问官方网站[https://travis-ci.org/](https://travis-ci.org/)，使用`github`账户登入`Travis CI`
2. 接受Travis CI的授权。
3. 单击绿色激活按钮，然后选择要与Travis CI一起使用的项目

![Travis CI](http://p1cjg886l.bkt.clouddn.com/travis1.png)

4. 到Github仓库获取TOKEN。打开`setting`->`Developer settings`->`Personal access tokens`

![Travis CI](http://p1cjg886l.bkt.clouddn.com/travis2.png)

5. 到[Travis](https://travis-ci.org/)添加TOKEN。`setting`->`Environment Variables`

![Travis CI](http://p1cjg886l.bkt.clouddn.com/travis3.png)

6. 添加`.travis.yml`文件到存储库以告知Travis CI要执行的操作。

```yaml
language: "node_js"
node_js:
     - "node"
install:
     - "npm install gitbook -g"
     - "npm install -g gitbook-cli"
script:
     - "gitbook build"
after_success:
     - "sh build.sh"

```



7. 添加`build.sh`脚本文件到存储库

```shell
#!/bin/bash

set -o errexit -o nounset
TRAVIS_BRANCH=master
if [ "$TRAVIS_BRANCH" != "master" ]
then 
	    echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!" 
		    exit 0
		fi
		rev=$(git rev-parse --short HEAD)
		cd _book
		git init
		git config user.name "Travis"
		git config user.email "evey_wong@163.com"
		git remote add upstream https://evey-huang:$TOKEN@github.com/yznu-cn/yznu-cn.github.io.git
		git fetch upstream
		git reset upstream/master
		#echo "custom domain" > CNAME
		git add -A
		git commit -m "rebuild pages at ${rev}"
		git push -q upstream HEAD:master
```

8. 将`.travis.yml`和`build.sh`文件添加到git，commit和push以触发Travis CI构建

9. 到[https://travis-ci.org/](https://travis-ci.org/)查看构建是否通过

![Travis CI](http://p1cjg886l.bkt.clouddn.com/travis4.png)



### Travis CI实战

这次之所以接触到Travis CI是因为学长组织了一个开源学习小组，要我帮忙做这个事。没接触之前觉得好难啊，接触之后觉得也没这么难，还挺好玩的。想看代码[戳这里](https://github.com/yznu-cn/yznu-wiki)

