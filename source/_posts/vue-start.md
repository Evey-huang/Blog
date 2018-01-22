---
title: 新建Vue项目
date: 2017-12-04 10:04:43
tags: vue 教程
categories: 教程
---



> 在新建vue项目之前应该先检查一下是否已经安装好npm、node

## 新建一个vue项目

1. 设置镜像

   ```
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   ```

2. 安装webpack

   ```
   npm install webpack -g
   ```

3. 安装vue-cli

   ```
   npm install vue-cli -g
   ```

4. 创建项目

   ```
   vue init webpack-simple 项目名称
   ```

5. 进入项目所在目录，安装依赖

   ```
   npm install
   ```

6. 启动项目

   ```
   npm run dev
   ```

> 在创建项目初始化的时候（也就是第四步）遇到了问题。
>
> ### 问题：
>
> vue-cli · Failed to download repo vuejs-templates/webpack-simple: tunneling socket could not be established, cause=connect ECONNREFUSED 127.0.0.1:80
>
> ### 解决：
>
> 删除无效代理
>
> ### 定位问题的过程：
>
> 1. 本机ping外网发现正常，说明本机网络OK
> 2. 本机尝试安装其他的包，发现进度条不动；其他机器尝试安装一样的包，发现能安装成功，证明包本身没问题
> 3. 经过上面两步确定不是网络问题不是包问题而是本机有问题，然后npm config查看本机配置与其他机器配置有什么不一样，发现本机比其他机器多了无效代理
> 4. 删除无效代理。vim /usr/local/etc/npmc找到设置代理的语句然后删除
>
>

启动后的界面

![选区_007.png](https://eveywongblog.files.wordpress.com/2017/11/e98089e58cba_007.png)