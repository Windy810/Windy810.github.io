---
layout: post
title: "数据可视化（二）之如何做好数据可视化"
date: 2021-06-15
description: "数据可视化知识点整理，包括如何做好数据可视化与数据可视化的一般流程"
tags: ["数据可视化"]
comments: true
image:
  path: "https://gitee.com/windy810/pictures/raw/master/%E7%AE%B1%E7%BA%BF%E5%9B%BE.png"
---
* content
{:toc}

## 2.1 什么是好的数据可视化

1. 适用于人类双眼和大脑的数据可视化
2. 相似的颜色代表相近的类别
3. 审美愉悦感
4. 准确高效，有吸引力，易懂，突出重点
5. 与数据分析相结合

## 2.2 数据可视化的一般流程

### 前期：数据收集，处理与分析

1. 数据收集：
   * 人工搜集
   * 网络爬虫
   * 客户端埋点
2. 数据处理：
   * 数据清洗：去除噪音
   * 数据整合：合并多个来源的数据
   * 数据简化：合并、聚合以及删除冗余
   * 数据转换：转换成与数据分析相匹配的结构
3. 数据分析：利用统计或机器学习方法分析数据的潜在规律，为可视化提供必要支持
* 补充：爬虫
  * 定义：通过既定规则提取网页信息
  * 常用库：urllib、requests、Beautiful Soup(HTML/XML解析器)、Scrapy(爬虫框架)  

### 中期：数据可视化展示
1. 确定关注的问题：数据可视化大部分的工作都来源于问题的提出，希望通过数据可视化回答的一个或多个问题是引导我们进行数据可视化的方向
2. **选择可视化视角**：可视化图形不宜过于复杂
   * 比较和排序
     * 定义：关注有序或无序的定性数据中的某个定量指标的大小关系
     * 图形：
        * 柱状图：从相同的基准(横坐标)出发,根据不同的数值来设计柱子的高度,表示无序或有序的定性数据之间某个定量指标的大小关系
        * 条形图
        * 矩形树图
        * 象柱状图
        * 玫瑰图
        * 漏斗图
        * 瀑布图：它一般表示某个指标随时间的涨跌规律，从前一个柱子的终点位置开始，这样既反映了每一个时刻的涨跌情况，也反映了数值指标在每一个时刻的值
        * 马赛克图
        * 雷达图
        * 词云图
   * 局部和整体
     * 定义：定性数据中的某一类与总体之间的比例关系
     * 图形：
       * 饼图：按比例顺时针；分类不超过9个
       * 堆栈柱状图：适合组的整体比较
       * 并排柱状图：适合组内比较
       * 圆环图
       * 旭日图
       * 矩形树图
   * 分布
     * 定义：定量数据在其取值范围内的分布特征；比较多个变量或者类别的分布
     * 图形：
       * 直方图
       * 箱线图
       * 核密度估计图
       * 小提琴图
       * 热力图
       * 平行坐标图
   * 相关性
     * 定义：注两个或多个定量变量之间的结构关系（相关并非一定有因果关系）；观察多个变量之间相关性
     * 图形：
       * 散点图
       * 气泡图
       * 相关矩阵图
       * 相关矩阵热力图
   * 网络关系
     * 定义：关注的是样本或节点之间的关系
     * 图形：
       * 网络图
       * 和弦图
       * 弧形图
       * 分层边缘捆绑图
       * 桑基图
   * 位置与地理特征
     * 定义：反映数据在二维或三维坐标空间中的位置关系
     * 图形：
       * 地图
       * 地球图 
   * 时间趋势
     * 定义：关注定量数据随时间变化的规律
     * 图形：
       * 折线图
       * 面积图
       * 主题河流图
       * 日历图
       * K线图
   * 基础图形的复合：使用文字或辅助线强调某些信息，或将几种不同的图像合并呈现

### 后期：综合可视化展示向受众讲述有趣的故事

## 2.3 可视化颜色选择
1. RGB颜色模型
2. HSB颜色模型
   * 色相H ( Hue )
   * 饱和度S ( saturation )
   * 亮度B ( brightness )
3. 颜色主题的搭配原理：通过排列组合实现二值色系、单色系、双色渐变系和多色系等颜色主题方案
4. 学术图表颜色主题
   * R语言Wesanderson包
   * Python Seaborn包
   * Colorbrewer2网页提供的颜色主题方案
   * R语言ggsci包
  
## 2.4 数据可视化基础图形
详见2.2章节的中期部分
1. 箱线图相关定义  
  
<center><img src="https://gitee.com/windy810/pictures/raw/master/%E7%AE%B1%E7%BA%BF%E5%9B%BE.png"></center>  

  * 四分位数：指将一组数据按从小到大的顺序排列后等分为四等份，处于三个分割点位置的数值就是四分位数。
  * 第一四分位数 (Q1)，又称“较小四分位数”或“下四分位数”，等于该样本中所有数值由小到大排列后第25%的数字。
  * 第二四分位数 (Q2)，又称“中位数”，等于该样本中所有数值由小到大排列后第50%的数字。
  * 第三四分位数 (Q3)，又称“较大四分位数”或“上四分位数”，等于该样本中所有数值由小到大排列后第75%的数字。
  * 第三四分位数与第一四分位数的差距又称四分位距（InterQuartile Range,IQR）
2. 箱线图相关计算
  * 第一步：确定四分位数的位置（n表示数据的个数）：
    * Q1的位置= (n+1) × 0.25 
    * Q2的位置= (n+1) × 0.5 
    * Q3的位置= (n+1) ×0.75
  * 第二步：根据四分位数的位置，确定其对应的四分位数
  * 注：若算出来位置不为整数，则按权值进行计算，如Q1位置=2.75，则Q1=0.25×第二项+0.75×第三项

## 2.5 使用数据可视化讲述故事
* 搞清受众->要受众听懂什么

1. 主动式叙事：数据、可视化图像以及故事主要由作者来选择并讲述给受众读者
   * 原则：简单、准确
   * 步骤：确保了解数据->明确想讲的故事->确保使用数据可视化是用于引导而非支配受众
2. 互动式叙事：提供工具和方法给读者，让他们自助展示数据，让读者有更多的自由度来选择、分析和理解数据背后的故事
   * 常用思路：
     *  抓住时间变化趋势
     *  从整体到局部的聚焦
     *  由点到面的分析
     *  突出对比
     *  探究交叉点
     *  描绘出异常值
     *  剖析原因

## 2.6 常用可视化工具
1. 工具类：Tableau, Excel, Google Spreadsheets, Power BI, IBM many eyes
2. 编程开发类：Python, R, Matlab
3. 交互类：D3.js, processing.js