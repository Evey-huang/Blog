---
title: 在ubuntu中使用ls和xargs命令转换png和jpg
date: 2018-06-28 18:21:28
tags: [ubuntu18.04, jpg, png]
categories: Ubuntu
---

#### PNG转JPG

```shell
$ ls -1 *.png | xargs -n 1 bash -c 'convert "$0" "${0%.png}.jpg"'
```

#### JPG转PNG

```shell
ls -1 *.jpg | xargs -n 1 bash -c 'convert "$0" "${0%.png}.png"'
```

`ls`命令可以列出所有的`png`图像文件，`xargs`使得可以从标准输入构建和执行`convert`命令，从而将所有`.png`图像转换为`.jpg`图像。



说明：

- `-1`：告诉`ls`每行列出一个图像名称的选项标识
- `-n`：指定最多参数个数，例子中为1
- `-c`：指示bash运行给定的命令
- `${0%.png}.jpg`：设置新转换的图像文件的名字，`%`符号用来删除源文件的扩展名

