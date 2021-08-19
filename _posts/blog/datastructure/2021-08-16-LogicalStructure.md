---
layout: post
title: "数据结构总结（一）逻辑结构"
date: 2021-08-16
description: "数据结构"
tags: datastructure
category: blog
comments: true
sitemap: true
image:
  path: "https://pic1.zhimg.com/v2-12e282d5fc7073140a62377eb453728f_1440w.jpg?source=172ae18b"
---
* content
{:toc}

## 1.1 线性结构

1. 逻辑结构
2. 运算

### 1.1.1 顺序表

1. 特点：地址连续；方便读取；插入与删除需要大量移动元素
2. 结构定义：

```cpp
#define MAXSIZE 100
typedef struct{
  ElemType *elem;
  int length;
}SqList
```

### 1.1.2 单向链表

1. 特点：取值时间复杂度为O(n)；插入时间复杂度为O(1)；删除时间复杂度为O(1);在p的前面插入不方便

    ```cpp
    //p之后插入节点s
    s->next=p->next;
    p->next=s;

    //删除p之后的节点
    q=p->next;
    p->next=q->next;
    delete q;
    ```

2. 分类：带头结点（`first->next=null`)；不带头结点（`first=null`）
3. 结构定义：

    ```cpp
    typedef struct Node{
      ElemType data;
      struct Node *next;
    }LNode,*LinkList;
    ```

### 1.1.3 双向链表

```cpp
//在p之前实现插入s
s->prior=p->prior;
p->prior->next=s;
s->next=p;
p->prior=s;

//删除p
p->prior->next=p->next;
p->next->prior=p->prior;
delete p;
```

### 1.1.4 循环链表

1. 头节点的prior指向尾部  
2. 尾节点的next指向头部

### 1.1.5 顺序表与链表

|||顺序表|链表|
|----|----|----|----|
|空间|存储空间|预先分配，存在溢出|动态分配|
||存储密度|=1|<1(借助指针)|
|时间|存取元素|随机存取，时间复杂度为O(1)(|顺序存取，O(n)|
||插入、删除|平均移动表中一半元素，O(n)|O(1)|
|适用情况||①表长变化不大|①长度变化大
|||②很少插入或者删除，经常访问|②频繁插入删除

## 1.2 栈

1. 逻辑结构：一对一
2. 运算（后进后出）
3. 存储结构：顺序栈；链栈

### 1.2.1 顺序栈

1. 空栈：base==top（出栈需判定）
2. 栈满：top-base=stacksize（入栈需判断）
3. 结构定义：

    ```cpp
    #define MAXSIZE 100
    typedef struct{
      SElemType *base;
      SElemType *top;
      int stacksize;
    }SqStack;

    //入栈
    *S.top=e;
    *S.top++;

    //出栈
    --S.top;
    e=*S.top;
    ```

### 1.2.2 链栈

## 1.3 队列

1. 逻辑结构：一对一
2. 运算（先进先出）
3. 存储结构：顺序队列；链队列
4. 为空条件：  
链/循环队列：`Q->front=Q->rear`  
5. 为满条件：  
循环队列：`(Q->rear+1)%MAXQSIZE==Q.front`

## 1.4 串

# 树

## 2.1 二叉树

1. 性质：

    * 性质1：第i层最多结点数：$$ 2^{i-1} $$
    * 性质2：深度k至多的结点数：$$ 2^k-1 $$
    * 性质3：$$ n_0=n_2+1 $$
    * 性质4：n个结点完全二叉树的深度 $$ \lfloor log_2n \rfloor +1 $$
    * 性质5：完全二叉树的编号，父亲与孩子之间的关系 $$ 父节点：\frac i 2 $$ $$ 结点本身：i $$ $$ 左子结点：2i \ 右子结点：2i+1 $$

2. 二叉树的遍历及依据序列还原

    * 先序遍历：中左右（确定根，无法还原）

      ```cpp
      //先序遍历
      Status PreOrderTraverse(BiTree T){
        if(T==NULL)return OK;
        else{
          cout<<T->data;
          PreOrderTraverse(T->lchild);
          PreOrderTraverse(T->rchild);
        }
      }
      ```

    * 中序遍历：左中右（确定左右）
    * 后序遍历：左右中（确定根，无法还原）
    * 层次遍历：上到下，左到右