流畅的Python
==========
```
本文是对Python相关技术书籍的一个学习和总结.
《流畅的Python》作者: Luciano Ramalho
```
## 《流畅的Python》
```
一段话总结：
	.......
```
### 第1章 python数据模型
<++>
### 第2章 序列结构的数组
#### 2.1 内置序列类型概览
#### 2.2 列表推导和生成器表达式

##### 2.2.1 列表推导和可读性
```python
In [1]: symbols = "&^%$#"

In [2]: codes = [ord(symbol) for symbol in symbols]

In [3]: codes
Out[3]: [38, 94, 37, 36, 35]
```
可读性好

*列表推导*
+ 列表推导是构建列表（list）的快捷方式--快速生成列表

*生成器表达式*
+ 生成器提供了一种实现迭代器协议的便捷方式。
+ Generator是一个使用带有yield语句的函数创建的迭代。
+ 在带有yield语句的函数中，函数的状态从上次调用中“保存”，并且可以在下次调用生成函数时被拾取。
+ 生成器表达式允许在没有yield关键字的情况下即时创建生成器。但是它们不能分享用yield函数创建的生成器的全部功能。
+ 生成器表达式则可以用来创建其他任何类型的序列
##### 2.2.2 列表推导同filter和map的比较
```python
import timeit

TIMES = 10000

SETUP = """
symbols = '$¢£¥€¤'
def non_ascii(c):
    return c > 127
"""

def clock(label, cmd):
    res = timeit.repeat(cmd, setup=SETUP, number=TIMES)
    print(label, *(f'{x:.3f}' for x in res))

clock('listcomp        :', '[ord(s) for s in symbols if ord(s) > 127]')
clock('listcomp + func :', '[ord(s) for s in symbols if non_ascii(ord(s))]')
clock('filter + lambda :', 'list(filter(lambda c: c > 127, map(ord, symbols)))')
clock('filter + func   :', 'list(filter(non_ascii, map(ord, symbols)))')
```

说明下map、filter函数的使用方法:
```Python
map(func, iterable_object) # 返回map对象，用list函数可以序列化
filter(func, iterable_object) # 返回filter对象，用list函数可以序列化
```

##### 2.2.3 笛卡儿积
<++>
##### 2.2.4 生成器表达式
- 生成器表达式背后遵守了迭代器协议可以逐个地产出元素，而不是先建立一个完整的列表
- 生成器表达式的语法跟列表推导差不多，只不过把方括号换成圆括号而已。
- 列表推导可以初始化元祖、数组和其他序列类型，但是可见，生成器表达式是更好的选择。
#### 2.3 元组不仅仅是不可变的列表
元组可不简单的理解为不可变列表。
##### 2.3.1 元组和记录
元组出了有不可变列表的特性，还可以高效的对数据进行记录。想象元组的每个元素都是一个mysql数据表中的一个字段，只是这个字段只有值没有字段名而已。

这样，元组中的每个元素都存放了记录中的一个字段的数据，外加这个字段的位置。正式这个位置信息给数据赋予了意义。

如果只把元组理解为不可变的列表，那其他信息——它所含有的元素的总数和它们的位置——似乎就变得可有可无。但是如果把元组当作一些字段的集合，那么数量和位置信息就变得非常重要了。

```python

country_language_list = [
	("China","Chinese"),
	("English", "English"),
	("America", "English")
]
for country, language in country_language_list:
	print(country, language)
```
```
输出：
China Chinese
English English
America English
```
##### 2.3.4 具名元组
collections.namedtuple, 一个工厂函数。可以用来构建一个带字段名的元组和一个有名字的类。

##### 2.3.5 作为不可变列表的元组
元组中的元素不可改变。

#### 2.4 切片
在Python里，像列表（list）、元组（tuple）和字符串（str）这类序列类型都支持切片操作，但是实际上切片操作比人们所想象的要强大很多。
##### 2.4.1 为什么切片和区间会忽略最后一个元素
<++>
##### 2.4.2 对对象进行切片
<++>
##### 2.4.3 多维切片和省略
<++>
##### 2.4.4 给切片赋值
```python
In [19]: a = [1,2,3,4,5,6,7]

In [20]: a[2:5] = 100
----------------------------------------------------------
TypeError                Traceback (most recent call last)
<ipython-input-20-146b6af3d873> in <module>
----> 1 a[2:5] = 100

TypeError: can only assign an iterable

In [21]: a[2:5] = [100]

In [22]: a
Out[22]: [1, 2, 100, 6, 7]
```
##### 2.5 对序列使用+和*
Python程序员会默认序列是支持+和*操作的。通常+号两侧的序列由相同类型的数据所构成，在拼接的过程中，两个被操作的序列都不会被修改，Python会新建一个包含同样类型数据的序列来作为拼接的结果。
```python
In [26]: a = [1, 2]

In [27]: b = [3, 4]

In [28]: c = (5, 6)

In [29]: d = a + b

In [30]: d
Out[30]: [1, 2, 3, 4]

In [31]: e = a + c
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-31-de3ddefe6a7a> in <module>
----> 1 e = a + c

TypeError: can only concatenate list (not "tuple") to list

In [32]:
```
如果想要把一个序列复制几份然后再拼接起来，更快捷的做法是把这个序列乘以一个整数。同样，这个操作会产生一个新序列：
```python
In [23]: l = [1,2]
In [24]: l * 5
Out[24]: [1, 2, 1, 2, 1, 2, 1, 2, 1, 2]

In [26]: l = [None]
In [27]: l * 5
Out[27]: [None, None, None, None, None]

In [25]: 5*"abc"
Out[25]: 'abcabcabcabcabc'
```

*建立由列表组成的列表*

#### 2.6 序列的增量赋值
增量赋值运算符+=和*=的表现取决于它们的第一个操作对象。
+=背后的特殊方法是__iadd__ （用于“就地加法”）。但是如果一个类没有实现这个方法的话，Python会退一步调用__add__ 。

总体来讲，可变序列一般都实现了__iadd__方法，因此+=是就地加法。而不可变序列根本就不支持这个操作，对这个方法的实现也就无从谈起。


上面所说的这些关于+=的概念也适用于*=，不同的是，后者相对应的是__imul__。


```python
In [35]: d = [1, 2, 3]

In [36]: id(d)
Out[36]: 4358776192

In [37]: d *= 2

In [38]: d
Out[38]: [1, 2, 3, 1, 2, 3]

In [39]: id(d)
Out[39]: 4358776192  # 运行*=后，列表id没有变

In [40]: t = (1, 2, 3)

In [41]: id(t)
Out[41]: 4358333696

In [42]: t *= 2

In [43]: t
Out[43]: (1, 2, 3, 1, 2, 3)

In [44]: id(t)
Out[44]: 4360771520    # 运行*=后，元组id变化了
# 对不可变序列进行重复拼接操作的话，效率会很低，
# 因为每次都有一个新对象，而解释器需要把原来对象中的元素先复制到新的对象里，
# 然后再追加新的元素。
```
#### 2.7 list.sort方法和内置函数sorted
list.sort方法会就地排序列表，也就是说不会把原列表复制一份。这也是这个方法的返回值是None的原因，提醒你本方法不会新建一个列表。

与list.sort相反的是内置函数sorted，它会新建一个列表作为返回值。这个方法可以接受任何形式的可迭代对象作为参数，甚至包括不可变序列或生成器。而不管sorted接受的是怎样的参数，它最后都会返回一个列表。


#### 2.8 用bisect来管理已排序的序列
bisect模块包含两个主要函数，bisect和insort，两个函数都利用二分查找算法来在有序序列中查找或插入元素。
##### 2.8.1 用bisect来搜索
bisect(haystack, needle)在haystack（干草垛）里搜索needle（针）的位置，该位置满足的条件是，把needle插入这个位置之后，haystack还能保持升序。
- haystack 必须是一个有序的序列

##### 2.8.2 用bisect.insort插入新元素
排序很耗时，因此在得到一个有序序列之后，我们最好能够保持它的有序。bisect.insort就是为了这个而存在的。
insort(seq, item)把变量item插入到序列seq中，并能保持seq的升序顺序。

#### 2.9 当列表不是首选时
##### 2.9.1 数组
如果我们需要一个只包含数字的列表，那么array.array比list更高效。数组支持所有跟可变序列有关的操作，包括.pop、.insert和.extend。另外，数组还提供从文件读取和存入文件的更快的方法，如.frombytes和.tofile。

##### 2.9.2 内存视图
memoryview是一个内置类，它能让用户在不复制内容的情况下操作同一个数组的不同切片。

内存视图其实是泛化和去数学化的NumPy数组。它让你在不需要复制内容的前提下，在数据结构之间共享内存。其中数据结构可以是任何形式，比如PIL图片、SQLite数据库和NumPy的数组，等等。这个功能在处理大型数据集合的时候非常重要。

memoryview.cast的概念跟数组模块类似，能用不同的方式读写同一块内存数据，而且内容字节不会随意移动。memoryview.cast会把同一块内存里的内容打包成一个全新的memoryview对象给你。

```python
In [46]: import array

In [47]: numbers = array.array("h", [-2, -1, 0, 1, 2])

In [48]: memv = memoryview(numbers)

In [49]: memv[0]
Out[49]: -2

In [50]: len(memv)
Out[50]: 5

In [51]: memv
Out[51]: <memory at 0x103b56280>

In [52]: memv_oct = memv.cast("B") # 把memv里的内容转换成"B"类型(无符号字符) 赋值给memv_oct

In [53]: memv_oct
Out[53]: <memory at 0x103b56e80>

In [54]: memv_oct.tolist()
Out[54]: [254, 255, 255, 255, 0, 0, 1, 0, 2, 0]

In [55]: numbers
Out[55]: array('h', [-2, -1, 0, 1, 2])

In [56]: memv_oct[5] = 4

In [57]: numbers
Out[57]: array('h', [-2, -1, 1024, 1, 2])
```
array的用法。

```python

```

<++>

##### set 和 frozenset
set 初始化
```python
In [1]: s = set('abcdee')

In [2]: s
Out[2]: {'a', 'b', 'c', 'd', 'e'}

In [3]: s = set(['a','b','c','d','e'])

In [4]: s
Out[4]: {'a', 'b', 'c', 'd', 'e'}

In [5]:  s = {'a','b', 'c'}

In [6]: s
Out[6]: {'a', 'b', 'c'}

In [7]:
```

<++>

## Python的惯例
##### 1. 如果一个函数或者方法对对象进行的是就地改动，那它就应该返回None，好让调用者知道传入的参数发生了变动，而且并未产生新的对象。


## 待分类知识待分类知识
<++>
<++>
### 魔法函数
<++>
### 鸭子类型 多态
<++>
### 类 和 对象
<++>
### 自定义序列类
手动实现可切片的序列类
什么可切片，就是可以用切片语法, a=object[:2]其中[:2]就是切片语法。其中object称为可切片对象。object对象的类，称为可切片的序列类。
\_\_getitem\_\_
\_\_contains\_\_
\_\_iter\_\_
### bisect维护一排序序列
#### \_\_getattr\_\_ 、\_\_getattribute\_\_魔法函数
\_\_getattr\_\_: when \_\_getattribute\_\_ cannot find the attribute, then it would get into \_\_getattr\_\_.
```python

class User:

    def __init__(self, name, info={}):
        self.name = name
        self.info = info

    def __getattr__(self, item):
        return item


if __name__ == "__main__":
    user = User(name="bobby", info={"company_name":"ABC"})
    print(user.name)
    print(user.test)
    
    # test is not a attribute of person, but because we defined __getattr__. it would take effect.
--------
# reuslt turned out:
bobby
test
```
And we can re-define \_\_getattr\_\_ function to control the object.attribute returns.
```python

class User:

    def __init__(self, name, info={}):
        self.name = name
        self.info = info

    def __getattr__(self, item):
        return self.info[item]


if __name__ == "__main__":
    user = User(name="bobby", info={"company_name":"ABC"})
    print(user.name)
    print(user.company_name) # so with re-defined __getattr__, we can visit user.comany_name which is a key of self.info.
--------
# result turned out:
bobby
ABC

```


\_\_getattribute__ this function is more advan then getattr
+ When we visit a attribute of object with farmat object.attribute, it would call __getattribute__ anyway. no matter the "attribute" exist or not exist.
+ \_\_getattribute\_\_ would cover \_\_getattr\_\_  
+ DO NOT re-define \_\_getattribute\_\_ function if we cannot take good control of it.


```python

class User:
    def __init__(self,info={}):
        self.info = info

    def __getattr__(self, item):
        print("#2")
        return self.info[item]

    def __getattribute__(self, item):
        print("#1")
        print("something in getattribute")
	

if __name__ == "__main__":
    user = User(info={"company_name":"imooc", "name":"bobby"})
    print(user.name)
    print(user.test)
    
--------
# result below:
#1
something in getattribute
None
#1
something in getattribute
None
```


#### 元类
用来创建类的类，是元类.
