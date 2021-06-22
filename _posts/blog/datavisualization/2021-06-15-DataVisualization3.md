---
layout: post
title: "数据可视化（三）之python基础"
date: 2021-06-15
description: "数据可视化知识点整理，包括python编程基础等"
featured: false
tags: datavisualization python
category: blog
comments: true
sitemap: true
image:
  path: "https://gitee.com/windy810/pictures/raw/master/dv3.jpg"
---
* content
{:toc}

## 3.1 开始使用Python IDE

### 3.1.1 Anaconda

1. 定义：Conda 是一个开源的软件包管理系统和环境管理系统，用于安装多个版本的软件包及其依赖关系，并在它们之间轻松切换
2. 可视化导航工具：Anaconda Navigator可对Anaconda中的环境和组件以及软件包进行管理
3. 命令：

* 创建环境
  * 查看：conda env list
  * conda create -n myenvname python=3.5
* 进入环境
  * activate myenvname
* 退出环境
  * conda deactivate
* 删除环境
  * conda remove -n myenvname --all
* 安装软件包
  * conda search numpy
  * conda list numpy
  * conda install numpy=1.0.0
  * conda remove numpy

### 3.1.2 Spyder

1. 定义：Spyder是Python(x,y)的作者为它开发的一个简单的集成开发环境
2. 优点：它最大的优点是模仿MATLAB的“工作空间”功能，可以很方便地观察和修改数据对象的值。因此它的界面与Matlab和RStudio都非常类似，是数据科学家最常使用的Python IDE之一

### 3.1.3 Jupyter Notebook

1. 定义：Jupyter Notebook是一个汇集开发、执行和文档为一体，而且支持包含Python、Julia、R、Ruby、Matlab等多种语言并可以实现交互式代码的网页版IDE
2. 优点：支持Markdown和Latex语法，支持代码运行、文本输入、数学公式编辑、内嵌式画图和其他如图片文件的插入，是一个对代码友好的交互式笔记本

## 3.2 Python编程基础

### 3.2.1 Python基础知识

1. 定义：面向对象的交互式解释性脚本语言
2. 常用帮助指令
   * help()：查看函数或模块用途的详细说明
   * dir() ：查看模块内都有什么方法，输出的是方法列表
   * ? ：查看具体对象的帮助信息
3. Python标识符：
   * 定义：标识符由字母、数字、下划线组成，但不能以数字开头，标识符是区分大小写的
   * 下划线开头的标识符
     * 以单下划线开头（`_foo`）：保护变量，代表不能直接访问的类属性，只有类对象和子类对象自己能访问到这些变量，不能用”from xxx import *”导入
     * 以双下划线开头（`__foo`）：子类对象也不能访问到这个数据私有变量，只有类对象自己能访问
     * 以双下划线开头和结尾的（`__foo__`） ：代表python里特殊方法专用的标识，如__init__（）代表类的构造函数

4. Python保留字符：
   * 定义：保留字符不能用作常量或变量，或任何其他标识符名称，所有Python关键字只包含小写字母
   * 例子：exec、and、assert等

5. 引用传递：赋值即为创建等号（“=”）右侧对象的一个引用，即绑定
6. 复制：
   * 浅复制：只拷贝父对象，不会拷贝对象的内部的子对象

    ```python
    >>> a=[1,2,['ch1','ch2']]
    >>> import copy
    >>> b=copy.copy(a)
    >>> c=a[:]
    >>> b
    [1, 2, ['ch1', 'ch2']]
    >>> c
    [1, 2, ['ch1', 'ch2']]
    >>> id(c)
    139771676705408
    >>> id(a)
    139771676691456
    >>> id(b)
    139771676705024
    >>> a.append(3)
    >>> b
    [1, 2, ['ch1', 'ch2']]
    >>> c
    [1, 2, ['ch1', 'ch2']]
    >>> a[2].append('ch3')
    >>> a
    [1, 2, ['ch1', 'ch2', 'ch3'], 3]
    >>> b
    [1, 2, ['ch1', 'ch2', 'ch3']]
    >>> c
    [1, 2, ['ch1', 'ch2', 'ch3']]
    ```

   * 深复制：完全的拷贝一个对象和一个对象的所有元素的值，即：拷贝对象及其子对象

    ```python
    >>> d=copy.deepcopy(a)
    >>> a.append('ch4')
    >>> a
    [1, 2, ['ch1', 'ch2', 'ch3'], 3, 'ch4']
    >>> d
    [1, 2, ['ch1', 'ch2', 'ch3'], 3]
    ```

7. 字符串
   * 定义：字符串是Python中用于表示非数值型数据的对象
   * 注：字符串不可变，如str1[1]='a'再进行str1[1]='e'则会报错
   * 转化为字符串的str函数：str()
   * 在字符串最左边引号前面加上“r”，表示所有字符应该按照原本样子进行解释

8. 列表(list)
   * 定义：列表是一种有序集合（各元素用逗号分隔，写在[]中，也可用list函数来定义），可随时添加和删除其中的元素
   * 注意点：
     * 分片：通过“：”隔开的两个索引来实现。如果提供两个索引作为边界，则第1个索引的元素包含在分片内，而第2个则不包含在分片内
     * list(seq)：将序列转换为列表

9. 元组(tuple)
   * 定义：元组的元素不能修改与删除
   * 区别：元组使用小括号，列表使用方括号
   * 元组拆包：对元组型变量表达式进行赋值，Python就会尝试将“=”右侧的值进行拆包

    ```python
    >>> country=('China','USA','UK')
    >>> a1,a2,a3=country
    >>> a1
    'China'
    >>> a2,a3
    ('USA', 'UK')
    ```

10. 字典(dictionary)
    * 定义：Python中使用键(key)-值(value)存储，其中，字典中的键值对是无序的，键作为指标是唯一访问值的方式。字典中的键不可重复，值可重复；键若重复字典中只会标记该键对应的最后一个值
    * 基本操作：
      * d[k]=v：将值v关联到键k上
      * del d[k]：删除键为k的项
    * 特性：
      * 键类型：字典的键可以是任意的不可变类型，如浮点、字符串或元组
      * 自动添加：即使键在字典中并不存在，也可以为它赋值，这样字典就会建立新的项
      * 成员资格：成员资格查找的是键，而不是值。表达式v in list则用来查找值，而不是索引
      * 键必须不可变，所以可以用数、字符串或元组充当，用列表就不行

11. 参数
    * 定义：在Python里都是按引用传递。如果在函数里修改了参数，那么在调用这个函数的函数里，原始的参数也被改变
    * 类型：必备参数、命名参数、缺省参数、不定参数

12. 匿名函数（lambda函数）
    * 定义：仅由单条语句组成，该语句的结果就是返回值。其得名于省略了用def声明函数的标准步骤，没有名称属性
    * 特点：
      * lambda函数能接收任何数量的参数但只能返回一个表达式的值，同时不能包含命令或多个表达式
      * 匿名函数不能直接调用print，因为lambda需要一个表达式
      * lambda函数拥有自己的名字空间，且不能访问自有参数列表之外或全局名字空间里的参数
      * 虽然lambda函数看起来只能写一行，调用函数时不占用栈内存从而增加运行效率

13. 常见内建函数
    * filter(bool_func,seq)：此函数的功能相当于过滤器。调用一个布尔函数bool_func来迭代遍历每个seq中的元素
    * map(func,seq1[,seq2…])：将函数func作用于给定序列的每个元素，并用一个列表来提供返回值；如果func为None，func表现为身份函数，作用同zip()。返回一个含有每个序列中元素集合的n个元组的列表
    * reduce(func,seq[,init])：func为二元函数，将func作用于seq序列的元素，每次携带一对（先前的结果以及下一个序列的元素），连续的将现有的结果和下一个值作用在获得的随后的结果上，最后化简序列为一个单一的返回值

14. 文件I/O
    * 基本语法：`open(file_name [, access_mode][, buffering])`
      * file_name：一个包含了要访问文件名称的字符串，即文件的绝对路径
      * access_mode：access_mode决定了打开文件的模式：只读，写入，追加等。所有可取值见如下的完全列表。这个参数是非强制的，默认文件访问模式为只读(r)
      * buffering:如果buffering的值被设为0，就不会有寄存。如果buffering的值取1，访问文件时会寄存行。如果将buffering的值设为大于1的整数，表明了这就是的寄存区的缓冲大小。如果取负值，寄存区的缓冲大小则为系统默认

15. 包
    * 定义：为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）
    * 例子：若abc.py这个abc的模块名字与其他模块冲突，则引入选择顶层包名mycompany，mycompany.abc则不会冲突
    * 注意每一个包目录下面都会有⼀个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是⼀个包。__init__.py可以是空文件，也可以有Python代码，因为__init__.py本身就是一个模块，而它的模块名就是mycompany

16. 异常
    * 定义：即非正常状态，在python中使用异常对象来表示异常
    * 异常处理：
      * raise手动抛出⼀个通用的异常类型(Exception)。raise关键字后跟异常的名称，异常名称能够标识出异常类的对象。一旦执行raise语句，程序就会被终止
  
        ```python
        def raisetest(obj):
            if obj !=‘test raise’:
                raise ValueError('Invalid value') #或者 raise ValueError,'Invalid value’
        raisetest(‘test raise')
        ```  

      * assert：根据后面的表达式的真假来控制程序流。若为True，则往下执行。若为False，则中断程序并调用默认的异常处理器，同时输出指定的提示信息
      * 捕捉异常可以使用try...except...else语句：

        ```python
        try:
        可能触发异常的语句块
        except [exceptionType]:
        捕获可能触发的异常[可以指定处理的异常类型]
        except [exceptionType][,date]:
        捕获异常并获取附加数据
        except:
        没有指定异常类型，捕获任意异常
        else：
        没有触发异常时，执⾏的语句块
        ```

        * try..finally语句：无论try语句块中是否触发异常，都会执行finally子句中的语句块，因此一般用于关闭文件或关闭因系统错误无服务法正常释放的资源。比如文件关闭，释放锁，把数据库连接返还给连接池等
        * 资源清理：with语句提供了一种非常方便的处理方式。一个很好的例子是文件处理，你需要获取一个文件句柄，从文件中读取数据，然后关闭文件句柄
