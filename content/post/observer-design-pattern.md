---
title: "观察者模式（Observer Design Patterns）"
date: 2019-02-20T18:01:54+08:00
categories:
- 设计模式
tags:
- observer
- 设计模式
keywords:
- observer
- 设计模式
#thumbnailImage: //example.com/image.jpg
comments:       false    # 是否显示评论按钮
showMeta:       true    # 是否在标题下显示详细信息
# metaAlignment: center # 标题下显示详细信息的位置
showActions:    true    # 是否显示详情页右下角的按钮
#thumbnailImage: //example.com/image.jpg    # 缩略图地址
# thumbnailImagePosition: left      # 缩略图地址 显示位置
---
设计模式（Design pattern）代表了最佳的实践，通常被有经验的面向对象的软件开发人员所采用。设计模式是软件开发人员在软件开发过程中面临的一般问题的解决方案。使用设计模式的目的：为了代码可重用性、让代码更容易被他人理解、保证代码可靠性。 从而实现项目工程化。
<!--more-->

## 什么是观察者模式

> 模式核心思想: 对象之间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖它的对象都可以得到通知。

**观察者模式和发布订阅模式最大的区别就是发布订阅模式有个事件调度中心。如下图：**

<img src="/pub-sub-and-observer-design-patterns.png"/>

*图片源自网络*

从图中可以看出，观察者模式中观察者和目标直接进行交互，而发布订阅模式中统一由调度中心进行处理，订阅者和发布者互不干扰。这样一方面实现了解耦，还有就是可以实现更细粒度的一些控制。比如发布者发布了很多消息，但是不想所有的订阅者都接收到，就可以在调度中心做一些处理，类似于权限控制之类的。还可以做一些节流操作等。

## Javascript 代码实现

```js
// 观察者类
class Observer {
  constructor(subject, {name = 'Defaut', base = 2}) {
    this.name = name
    this.log = console.log
    this.base = base
    this.subject = subject
    this.subject.addObserver(this)
  }

  // 检测subject数据变化
  update(val) {
    this.log(`${this.name}: `, parseInt(val, 10).toString(this.base).toUpperCase())
  }
}

// 目标类
class Subject {
  constructor() {
    this.observers = new Map()
  }

  addObserver(observer) {
    // console.log(this.observers)
    if (!this.observers.has(observer.name)) {
      this.observers.set(observer.name, observer)
    }
  }

  removeObserver(observer) {
    return this.observers.delete(observer.name)
  }

  notify(val) {
    for (const [, observer] of this.observers) {
      observer.update(val)
    }
  }
}

// 创建Subject实例
const subject = new Subject()

// 创建实体观察类
const hexaObserver = new Observer(subject, {name: 'HexaObserver', base: 16})
const octalObserver = new Observer(subject, {name: 'OctalObserver', base: 8})
const binaryObserver = new Observer(subject, {name: 'BinaryObserver'})

// 数据变化
subject.notify(15)
console.log()
subject.notify(10)
subject.removeObserver(hexaObserver)
console.log()
subject.notify(10)

// 输出:
// HexaObserver:  F
// OctalObserver:  17
// BinaryObserver:  1111

// HexaObserver:  A
// OctalObserver:  12
// BinaryObserver:  1010

// OctalObserver:  12
// BinaryObserver:  1010
```
