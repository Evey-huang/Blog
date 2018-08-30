---
title: 常用正则表达式
date: 2017-12-12 21:58:21
tags: 正则表达式
categories: JS
---



- 匹配IP地址，比如192.168.1.1

```
/((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d)/
```

-  匹配subnet（子网掩码），比如192.168.1.1/22

```
/((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d)\/(3[0-2]|[0-2]\d)/
```

-  匹配IP范围，比如192.168.0.1~192.168.0.2

```
/((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d)~((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d)/
```

- 比如：192.168.1.1~10

```
/((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d)\~(25[0-5]|2[0-4]\d|[01]?\d?\d)/
```





- 匹配：1.http://{IP}/ 2.http://{IP}:端口/ 3.http://{域名}/ 4.http://{域名}：端口/


- 比如：1.http://192.168.0.1/ 2.http://192.168.0.1:8080/ 3.http://www.baidu.com/ 4.http://www.baidu.com:8080/

```
/^((http|https|ftp):\/\/)((((25[0-5]|2[0-4]\d|[01]?\d?\d).){3}(25[0-5]|2[0-4]\d|[01]?\d?\d))|(a-zA-Z0-9{0,62})((.a-zA-Z0-9{0,62})+?)?):?([0-9]|[1-9]\d|[1-9]\d{2}|[1-9]\d{3}|[1-5]\d{4}|6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d|6553[0-5])?\/$
```

- 匹配端口号，一般0-65535。两种写法都可以，第一种就是把最大的数提到最前面不需要开始和结尾的符号，第二种就是最小的在最前面需要开始和结尾符号不然匹配不到

```
1./(6553[0-5]|655[0-2]\d|65[0-4]\d{2}|65[0-4]\d{2}|6[0-4]\d{3}|[1-5]\d{4}|[1-9]\d{3}|[1-9]\d{2}|[1-9]\d|[0-9])/
2./^([0-9]|[1-9]\d|[1-9]\d{2}|[1-9]\d{3}|[1-5]\d{4}|6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d|6553[0-5])$/
```





- 匹配ASCII字符串，只匹配ASCII字符，ASCII字符包括什么自行google

```
/[\x00-\xff]+/g
```

- 匹配字母/数字/下划线/短横线/中文

```
/^([\w-]+|[\u4e00-\u9fa5]+)$/
```

- 匹配数字字母下划线及短横线

```
/[\w-]+/
```

- 单个数字

```
/[0-9]/或/\d/
```

- 多个数字

```
/[0-9]/或/[0-9]+/或/\d+/或/\d/
```



 