---
layout: post
title: "区块链学习（二）以太坊详解"
date: 2021-06-25
description: "以太坊相关知识"
tags: blockchain
category: blog
comments: true
sitemap: true
image:
  path: "https://cdn.8btc.com/wp-content/uploads/2017/10/201710110601133046.jpeg"
---
* content
{:toc}

## 2.1 基本概念

### 2.1.1 以太坊基础定义

1. 定义：以太坊的本质就是一个基于交易的状态机
2. 本质流程：以太坊的状态有百万个交易。这些交易都被“组团”到一个区块中。一个区块包含了一系列的交易，每个区块都与它的前一个区块链接起来。只有交易全是有效的情况下，才能让一个状态转换为下一个状态。
3. 运行过程：存在交易->矿工创建一个包含有效交易的区块[]({{page.url}}#以太坊)->其他节点验证区块->证实矿工得到代币奖赏

### 2.1.2 GHOST协议

1. 定义：GHOST = Greedy Heaviest Observed Subtree 贪婪最重可见子树协议
2. 产生原因：