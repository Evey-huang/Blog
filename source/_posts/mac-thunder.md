---
title: Mac迅雷瘦身
date: 2018-10-10 11:26:22
tags: Mac
categories: 其他
---

1. 打开`应用程序`目录，选中迅雷App，在辅助菜单中点击`显示包内容`进入其内部
2. 删除`Contents > Bundles`目录
3. 进入`Contents > PlugIns`目录，删除插件，建议删除的插件有：
   - advertising(广告)
   - featuredpage(主页)
   - feedback(反馈)
   - iOSThunder(手机迅雷)
   - myvip(会员中心)
   - softmanager(软件管家)
   - viprenew(会员开通)
   - viptips(会员提示)
   - xlbrowser(内置浏览器)
   - xlplayer(迅雷影音)

1. 如果不需要开机自启动迅雷，可以删除`Contents > Library > LoginItems`目录