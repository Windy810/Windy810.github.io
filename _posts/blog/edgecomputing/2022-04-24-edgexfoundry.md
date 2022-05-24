---
layout: post
title: "EdgeX Foundry踩坑日常"
date: 2022-04-24
description: "记录搭建EdgeXFoundry框架过程中的问题"
tags: edgecomputing
category: blog
comments: true
sitemap: true
image:
  path: "https://docs.edgexfoundry.org/2.2/general/EdgeX_architecture.png"
---
* content
{:toc}

## 一、Docker制作服务镜像

## 问题1：卡在RUN make build，无法下载相关包

解决方法：在RUN make build命令前加入`RUN go env -w GOPROXY=https://goproxy.cn,direct`
