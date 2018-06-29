---
title: ubuntu安装Mongodb
date: 2018-06-28 11:54:03
tags: [ubuntu16.04, ubuntu18.04, mongodb]
categories: Ubuntu
---



## Ubuntu16.04自动安装mongodb

- 导入包管理系统使用的公钥

```shell
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
```

- 为mongodb创建一个列表文件

```shell
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
```

- 重新加载本地包数据库

```shell
sudo apt-get update
```

- 安装最新版mongodb软件包

```shell
sudo apt-get install -y mongodb-org
```

- 查看mongodb版本

```shell
mongod --version
```

- 启动mongodb

```shell
sudo service mongod start
```

- 开始使用mongodb

```shell
mongo
use admin
```

- 添加用户名和密码

```shell
db.createUser({user:'admin', pwd:'r00tme', roles: [ { role: "root", db: "admin" } ]})
```

- 查看所有用户

```shell
show users
```



### 其他操作

- 停止mongodb

```shell
sudo service mongod stop
```

- 重新启动mongodb

```shell
sudo service mongod restart
```



### 卸载Mongodb

- 停止mongodb

```shell
sudo service mongod stop
```

- 删除包

```shell
sudo apt-get purge mongodb-org*
```

- 删除数据目录

```shell
sudo rm -f /var/log/mongodb
sudo rm -f /var/lib/mongodb
```



## Ubuntu18.04手动安装mongodb

- 下载所需版本的mongodb二进制文件

```shell
curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.4.tgz
```

- 从下载的文档中提取文件

```shell
tar -zxvf mongodb-linux-x86_64-3.6.4.tgz
```

- 新建文件夹名为mongodb

```shell
mkdir -p mongodb
```

- 将解压的文件复制到mongodb文件夹中

```shell
cp -R -n mongodb-linux-x86_64-3.6.4/ mongodb
```

- 确保二进制文件的位置在PATH变量中（即将PATH路径指定为mongodb安装路径）

```shell
export PATH=/home/evey/mongodb/mongodb-linux-x86_64-3.6.4/bin:$PATH
```

- 创建数据目录

```shell
mkdir -p /data/db
```

- 设置数据目录的权限

```shell
chmod 777 data/
cd data/
chmod 777 db/
```

- 运行mongodb

```shell
mongod
```

- 开始使用mongodb

```shell
mongo
use admin
```

- 添加用户名和密码

```shell
db.createUser({user:'admin', pwd:'r00tme', roles: [ { role: "root", db: "admin" } ]})
```

- 查看用户

```shell
show users
```



### 其他操作

- 停止mongodb

```shell
Ctrl+C
```

- 重新启动mongodb则再次输入mongod即可

```shell
mongod
```

