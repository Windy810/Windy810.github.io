---
layout: post
title: "开发环境搭建常见问题"
date: 2022-05-24
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

然后还需要在clash内打开allow lan

## 二、GitHub连接问题

### 2.1 ssh认证失败问题

1. 设置公私钥
2. 在zshrc内写入：

```bash
eval "$(ssh-agent)"
ssh-add ~/.ssh/github
```

### 2.2 `kex_exchange_identification: Connection closed by remote host` 问题

1. 经检查发现Github平台与本地的ssh key均配置正常
2. 执行命令`ssh -T git@github.com`返回上述结果
3. 原因：在锅锅的有效搜索方法下，发现可能是使用的梯子封禁了 Github 端口 22 的连接
4. 解决方案：为`~/.ssh/config`添加以下代码：
  ```
  Host github.com
      HostName ssh.github.com
      User git
      Port 443
  ```

## 三、GitHub Action的小用处

有时候有些jio本可能想让他定期执行，并给自己发送一些推送，但是为此开一个服务器比较浪费，所以可以用一手GitHub的action功能，实现定时/触发执行代码。

1. 在项目底下建立目录`.github/workflows`
2. 目录下建立`xxx.yml`文件
3. 编写触发条件及环境等，具体代码如下：

```yaml
name: CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ python-dev ]
  pull_request:
    branches: [ python-dev ]
  schedule:
    - cron: '0 5 5,20 * *'
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  get-proxy:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      - name: 'Checkout codes' # 步骤一，获取仓库代码
        uses: actions/checkout@v2
      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: python3 ./jisujioben.py
```
