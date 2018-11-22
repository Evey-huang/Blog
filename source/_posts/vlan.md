---
title: 交换机之VLAN
date: 2018-11-22 18:05:59
tags: [vlan, native vlan, allowed vlan, 交换机]
categories: Network
---

## VLAN

`VLAN`：VLAN(Virtual local area network)是一组与位置无关的逻辑端口。VLAN相当于一个独立的三层网络。

- 常规的部署是节点连接到交换机，交换机连接到路由器。所有的节点都位于同一IP网络，因为他们都连接到路由器同一接口。即在缺省情况下，所有节点实际上都是同一VLAN。例如：Cisco设备默认VLAN是VLAN1，也成为`管理VLAN`。默认配置下包含所有的端口，体现在源地址表(source address table,SAT)中，该表用于交换机按照目的MAC地址将帧转发至合适的二层端口。引入VLAN之后，源地址表按照VLAN将端口与MAC地址相对应起来，从而使得交换机能够作出更多高级转发决策。

![常规部署](https://ws4.sinaimg.cn/large/006tNbRwgy1fx8tseoadfj30zd0eq11v.jpg)

- 另一种常用的拓扑结构是两个交换机被一个路由器分离开来，如图所示：

![常用拓扑结构](https://ws3.sinaimg.cn/large/006tNbRwgy1fx8tsuv9cnj316s0tqtly.jpg)

这种拓扑逻辑在两个地方类似于多VLAN：同一VLAN下的节点共享一个通用地址，非本地数据流（对应多VLAN情况不同VLAN的节点）需通过路由器转发。

每一个VLAN相当于一个独立的三层IP网络，因此192.168.1.0上的节点试图与192.168.2.0上的节点通信时，`不同VLAN通信必须通过路由器，即使所有设备都连接到同一交换机`。二层单播、多播和广播数据只会在同一VLAN内转发及泛洪，因此VLAN1产生的数据不会为VLAN2节点所见。只有交换机能看得到VLAN，节点和路由器都感觉不到VLAN的存在。添加了路由决策之后，可以利用3层的功能来实现更多的安全设定、更多的流量以及负载均衡。



## VLAN的作用

1. 安全性：将敏感数据与网络其他部分隔离开，减少保密信息遭到破坏的可能性。
2. 节约成本：无需昂贵的网络升级，并且带宽及上行链路利用率更加有效。
3. 性能提高：将二层网络划分成多个逻辑工作组（广播域）减少网络间不必要的数据流并提升性能。
4. 缩小广播域：减少一个广播域上的设备数量。
5. 提升IT管理效率：网络需求相似的用户共享同一VLAN，使得网络管理更为简单。当添加一个新的交换机，在指定端口VLAN时，所有策略和步骤已配置好。
6. 简化项目和应用管理：VLAN将用户和网络设备汇集起来，以支持不同的业务或地理位置需求。

## 交换机间的VLAN

1. 两个交换机VLAN相同，都是默认VLAN1，即两个交换机之间的联系在同一个VLAN内，路由器是所有节点的出口。这时单播、多播和广播数据自由传输，所有节点属于同一IP地址。这时通信不会有问题，因为交换机的SAT显示它们在同一VLAN。如图所示：

![在同一VLAN](https://ws1.sinaimg.cn/large/006tNbRwgy1fx8vcz99u6j313m0g6qbl.jpg)

1. 以下连接方式就会有问题。由于VLAN在连接端口的主机之间创建了三层边界，它们将无法通信。问题有：
   - 所有主机都在同一IP网，尽管连接到不同的VLAN。
   - 路由器在VLAN1，因此与所有节点隔离。
   - 两台交换机通过不同的VLAN互连，每一点都会造成通信阻碍，合在一起，网络各元素之间会完全无法通信。

![无法通信](https://ws1.sinaimg.cn/large/006tNbRwgy1fx8vfuzk3sj313q0dkwi7.jpg)

1. 通过trunk连接交换机，在网络间传载VLAN信息。如图所示：

![trunk](https://ws2.sinaimg.cn/large/006tNbRwgy1fx8vmqwvtnj31680e40xj.jpg)

对之前拓扑的改进包括：

- PC1和PC2分配到192.168.1.0网段以及VLAN2
- PC3和PC4分配到192.168.2.0网段以及VLAN3
- 路由器接口连接VLAN2和VLAN3
- 交换机间通过trunk线互连



### 什么是Trunk

Trunk是在两个网络设备之间承载多于一种VLAN的端到端的连接，将VLAN延伸至整个网络。VLAN Trunk允许VLAN数据流在交换机间传输，所以设备在同一VLAN，但连接到不同交换机，能够不通过路由器来进行通信。`一个VLAN Trunk不属于某一特定VLAN，而是交换机和路由器间多个VLAN的通道`。

当安装好trunk线之后，帧在trunk线传输就可以使用trunk协议来修改以太网帧。这也就是意味着交换机端口有不止一种操作模式。缺省情况下，所有端口都称之为`接入端口（access）`；当一个端口用于交换机间互连传输VLAN信息时，这种端口模式称之为`trunk`。

#### Native VLAN

Native VLAN是trunk上才有的概念.主要的目的是不丢弃非标记帧(untagged).接收方交换机把所有接收到的未标记的数据包转发到NATIVE VLAN中,而不是丢弃.默认是VLAN1。

简单的来说Native Vlan 是802。1Q协议封装下的一种特殊Vlan,来自该VLAN的流量在穿越TRUNK接口时不打TAG，缺省时VLAN1为Native Vlan 。

#### Allowed VLAN

Allowed VLAN在trunk中传输数据时要被添加标记（即tagged）。