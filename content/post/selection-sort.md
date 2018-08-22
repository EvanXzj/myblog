---
title: "选择排序"
date: 2018-08-22T16:54:36+08:00
categories:
- 排序算法学习
tags:
- sort algorithm
- sort
- selection sort
- 选择排序
keywords:
- 排序
- 算法
- algorithm
- 选择排序
- slection sort
comments:       false    # 是否显示评论按钮
showMeta:       true    # 是否在标题下显示详细信息
# metaAlignment: center # 标题下显示详细信息的位置
showActions:    true    # 是否显示详情页右下角的按钮
#thumbnailImage: //example.com/image.jpg    # 缩略图地址
# thumbnailImagePosition: left      # 缩略图地址 显示位置
---

**选择排序(Selection Sort)**是一种简单直观的排序算法。它也是重要的基本算法之一，也是面试者需要掌握的算法之一。

<!--more-->

## 算法步骤

1. 在初始未排序序列中找到最小（大）元素，放到序列的起始位置作为 **已排序序列**。
2. 然后再从剩余未排序的序列中找到最小（大）元素，放到 **已排序序列的末尾**。
3. 重复第二步，直到所有元素已排序为止。

## 动图演示

<img src="https://github.com/EvanXzj/JS-Sorting-Algorithm/blob/master/res/selectionSort.gif?raw=true"></img>

## 复杂度分析

    1. 时间复杂度是O(n^2)
    2. 空间复杂度是O(1)

## Javascript 代码实现

```js
function selectionSort(arr) {
    const length = arr.length
    let minIndex, temp

    for(let i = 0; i < length - 1; i++) {
        minIndex = i
        for (let j = i + 1; j < length; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j
            }
        }

        temp = arr[i]
        arr[i] = arr[minIndex]
        arr[minIndex] = temp
    }

    return arr
}
```

## Go代码实现

```go
func selectionSort(arr []int) []int {
	length := len(arr)
	for i := 0; i < length-1; i++ {
		minIndex := i
		for j := i + 1; j < length; j++ {
			if arr[j] < arr[minIndex] {
				minIndex = j
			}
		}

		arr[minIndex], arr[i] = arr[i], arr[minIndex]
	}

	return arr
}
```

## 选择排序与冒泡排序的区别

冒泡排序通过依次交换相邻两个顺序不合法的元素位置，从而将当前最小（大）元素放到合适的位置；而选择排序每遍历一次都记住了当前最小（大）元素的位置，最后仅需一次交换操作即可将其放到合适的位置。

## 工作日报

### 2018-08-21 
1. 学习英语语法，了解了 **名词**（Noun）， 规则名词的 **单复数(Singular/Plural)**、**普通名词(CommonNouns)** 和 **专有名词(Proper Nouns)** 的区分及其特性。

2. 阅读《走遍美国》第一节， 背诵 GRE 单词。

3. 修改 **msg-watcher** 和 **cron-job** 服务 LMSR 相关代码，合并代码将新功能发布正式环境。

4. 查看[Koa](https://github.com/koajs/koa)源码。

### 2018-08-22

1. 学习英语语法—不规则名词的复数形式：
   - 以 **f** 结尾的单词
   - child 的复数为 **children**，特殊的复数形式
   - 单复数同形
   - 突变的复数形式
   - 派生词复数形式
2. 背诵《走遍美国》第一节。
3. 查看 **koa-compose** 源码, 了解 **Koa 中间件 await next** 的实现。
4. 学习[PostgreSQL](https://www.postgresql.org/)数据库相关知识。

## 参考链接
- [Koa](https://github.com/koajs/koa)
- [koa-compose](https://github.com/koajs/compose)
- [koa2 中间件里面的next到底是什么](http://www.cnblogs.com/cloud-/p/7239819.html)
- [如何理解koa中的next](https://segmentfault.com/q/1010000011033764)

<font face="Microsoft YaHe" color="lightgray">声明: 本文只作学习用途，如有侵权请及时联系<a href="mailto:chuidylan@gmail.com">Chui Dylan</a>删除，谢谢！！！</font>