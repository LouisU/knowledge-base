### 1.3 保留最后N个元素
#### 问题
在迭代操作或者其他操作的时候，怎样只保留最后有限几个元素的历史记录？

```python
# -*- coding: utf-8 -*-
# author = "Louis"

from collections import deque

def search(lines, pattern, history=5):
    pervious_lines = deque(maxlen=history)
    for line in lines:
        if pattern in line:
            yield line, pervious_lines
        pervious_lines.append(line)


if __name__ == '__main__':
    from collections import Iterator

    with open("save_history.txt", 'r') as f:
        # print(f)
        # print(isinstance(f, Iterator))
        # for line in f:
        #     print(line)
        file_context = search(f, ',')
        for line, previous_lines in file_context:
            print("x" * 10)
            for pline in previous_lines:
                print(pline, end='')
            print("x" * 10)
            print(line, end='')
            print('-'*20)
            print('\n')
# 知识点扩展
# 1. search第一个参数是可读文件对象，说明可读文件对象直接迭代，默认调用readline()方法。
# 2. 使用yield使得函数search变成一个生成器。
#       f本身是一个可读文件对象 是一个生成器对象
#       这样search()生成器函数惰性的调用 惰性的可读文件对象。
#       这样使得生成器的应用的非常到位，这个文件如果是500G的文件也不会使内存撑爆。
# 3. 对于读取文件之类的操作。生成器函数传入的参数必须可迭代，生成器才有意义。不然生成器就yield一次就对出了。
# -*- coding: utf-8 -*-
# author = "Louis"
# 问题
# 在迭代操作或者其他操作的时候，怎样只保留最后有限几个元素的历史记录？

from collections import deque

def search(lines, pattern, history=5):
    pervious_lines = deque(maxlen=history)
    for line in lines:
        if pattern in line:
            yield line, pervious_lines
        pervious_lines.append(line)


if __name__ == '__main__':
    from collections import Iterator

    with open("save_history.txt", 'r') as f:
        # print(f)
        # print(isinstance(f, Iterator))
        # for line in f:
        #     print(line)
        file_context = search(f, ',')
        for line, previous_lines in file_context:
            print("x" * 10)
            for pline in previous_lines:
                print(pline, end='')
            print("x" * 10)
            print(line, end='')
            print('-'*20)
            print('\n')
```
#### 知识点扩展
1. search第一个参数是可读文件对象，说明可读文件对象直接迭代，默认调用readline()方法。
2. 使用yield使得函数search变成一个生成器。
      f本身是一个可读文件对象 是一个生成器对象
      这样search()生成器函数惰性的调用 惰性的可读文件对象。
      这样使得生成器的应用的非常到位，这个文件如果是500G的文件也不会使内存撑爆。
 3. 对于读取文件之类的操作。生成器函数传入的参数必须可迭代，生成器才有意义。不然生成器就yield一次就对出了。
