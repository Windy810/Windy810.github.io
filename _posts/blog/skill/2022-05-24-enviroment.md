---
layout: post
title: "开发环境搭建常见问题"
date: 2022-05-25
description: "用于备忘一些问题的解决办法"
tags: skill
category: blog
comments: true
sitemap: true
image:
  path: "https://www.picpedia.org/handwriting/images/skill.jpg"
---
* content
{:toc}

## 一、WSL2代理问题

wsl2经常访问不了外网，难以下载一些文件，所以在本机有clash等代理方式的情况下，可以在zshrc中加入以下参数：

```bash
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
export https_proxy="http://${hostip}:7890"
export http_proxy="http://${hostip}:7890"
export all_proxy = 'sock5://172.30.48.1:7890'
export ALL_PROXY = 'sock5://172.30.48.1:7890'
```

## 二、GitHub连接问题

1. 设置公私钥
2. 在zshrc内写入：

```bash
eval "$(ssh-agent)"
ssh-add ~/.ssh/github
```
