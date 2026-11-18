# lua学习笔记
## 为什么学习lua
最近开始使用neovim编辑器做笔记、也想做开发。要精通neovim, lua语言是要熟悉的。因为neovim现在最好的插件管理器lazy.nvim就是用lua实现的，neovim全局的配置和插件的管理都是通过lua实现。所以长期来看，要扩展很多插件，增强neovim的功能的话，lua要熟悉，至少在neovim插件需要用的Lua语法和运行原理要明白怎么回事。

## 怎么学？
我将就neovim和lazy.nvim本身涉及的*.lua文件学习。遇到什么学什么。然后整理成系统的知识。

## 安装
macOS上直接运行`brew install lua`
安装完后运行 `lua -v` 正常返回版本号证明安装完成

## 第一个lua文件
```lua
-- 创建文件hello.lua，文件内容
print("Hello lua!")

```
保存文件后运行`lua hello.lua`输出: Hello lua!
> 输出用print()函数
> 
> 注释用 ---

## 变量
变量的命名规则：
1. 以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上 0 个或多个字母，下划线，数字（0 到 9）来命名变量。
2. 不允许使用特殊字符如 @, $, 和 % 来定义变量。
3. 区分大小写。Runo 与 runno 是两个变量。
4. 一般约定，一下划线开头连接一串大写字母的名字被保留用于Lua内部全局变量（比如——VERSION)。
```lua
a = "1" -- a是全局变量, **不用关键词local 声明的都是全局变量** 
print(a) -- 输出1
c = nil -- nil相当于为空。变量指向nil时，就不存在。
print(c)  -- 输出nil
print(d) -- 输出nil
```

## 数据类型
| 数据类型 | 描述 |
|--|--|
|nil|无效值，在条件表达式中相当于false|
|boolean|false\true|
|number|双精度类型的实浮点数|
|string|字符串，由双引号或单引号表示|
|function|函数|
|userdata|表示任意寸寸在变量中的c数据结构|
|thread|表示执行的独立线路，用于执行协同程序|
|**table**|Lua中的table。是关联数组。数组的索引可以是数字、字符串或表类型。table的创建时通过“构造表达式”来完成，最简单的构造表达式是{}，构造一个空表|
```lua
tab1 = {key1="val1", key2="val2", "val3"}
for k,v in pairs(tab1) do
	print(k .. "-" ..v)
end
tab1.key1 = nil
for k,v in pairs(tab1) do
	print(k .. "-" ..v)
end
-- 输出:
-- 1-val3  # "val3"没有定义key, 默认用数字作为key，而前面两个元素是自定义的key，那么就从"val3"开始用数字1. 没有指定key时，默认从1开始给索引
-- key2-val2 这里为什么先输出key2而不是key1？
-- key1-val1

-- 1-val3
-- key2-val2
```


