---
title: ubuntu安装软件
date: 2018-06-28 11:59:55
tags: [ubuntu18.04, TeamViewer, 微信, jdk-8]
categories: Ubuntu
---

## 安装ubuntu版TeamViewer

1. 下载软件包：https://www.teamviewer.com/zhcn/download/linux/

2. 添加32位架构

   ```shell
   $ sudo dpkg --add-architecture i386  
   ```

3. 更新

   ```shell
   $ sudo apt-get update
   ```

4. 安装

   ```shell
   $ sudo  dpkg  -i teamviewer_13.1.3026_amd64.deb 
   ```

   

## ubuntu安装微信

1. 下载安装包:https://github.com/geeeeeeeeek/electronic-wechat/releases
2. 解压

```
tar zxvf linux-x64.tar.gz
```

3. 找到解压后的`electronic-wechat`文件，双击运行或者右键选择运行即可



## ubuntu安装JDK-8

1. 查看apt库都有哪些jdk版本

```shell
$ apt-cache search java|grep jdk
```

2. 选择版本进行安装

```shell
$ sudo apt-get install openjdk-8-jdk
```

3. 设置环境变量

```shell
$ sudo vim /etc/profile
```

4. 添加以下内容

```shell
# set java environment
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

5. 让修改生效

```shell
source /etc/profile
```

6. 验证

```shelll
java -version
```



