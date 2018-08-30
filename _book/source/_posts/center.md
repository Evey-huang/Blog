---
title: css实现居中
date: 2018-04-25 14:47:18
tags: [css, 居中]
categories: css
---

### translate+position实现居中

**HTML**

```html
<div class="menu">
    <span>dhsl</span>
</div>
```

**CSS**

```css
.menu {
    position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
```

