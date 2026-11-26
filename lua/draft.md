[TOC]
# lua学习笔记
## 为什么学习lua
最近开始使用neovim编辑器做笔记、也想做开发。要精通neovim, lua语言是要熟悉的。因为neovim现在最好的插件管理器lazy.nvim就是用lua实现的，neovim全局的配置和插件的管理都是通过lua实现。所以长期来看，要扩展很多插件，增强neovim的功能的话，lua要熟悉，至少在neovim插件需要用的Lua语法和运行原理要明白怎么回事。

## 怎么学？
我将就neovim和lazy.nvim本身涉及的*.lua文件学习。遇到什么学什么。然后整理成系统的知识。

## 安装
macOS上直接运行`brew install lua`
安装完后运行 `lua -v` 正常返回版本号证明安装完成

## 注释 
lua文件中，注释用`--` 开头
```lua
-- 创建文件hello.lua，文件内容
print("Hello lua!")

```

## 表达式与语句
Lua文件时一个chunk(代码块)，chunk里只能放语句, 不允许放表达式。
| 概念             | 作用                       | 例子                          |
| ---              | ---                        | ---                           |
| expression表达式 | 求\取出一个值(拿到一个值)  | 1+2，"hello", 2.2             |
| statement语句    | 执行一个动作(拿值做了操作) | x = 1，pint(),if .. else..end |
1. 表达式不是语句。
2. 语句中包含表达式。
3. 表达式不参与任何操作(比如赋值、函数、条件语句等)时，即取到值后立即被释放了，这样的表达式被认定为无意义。
```lua
8+2 -- 在lua文件中执行报错：lua: statement_expression.lua:1: unexpected symbol near '8'
tbl1[1] -- 报错
X -- 报错
local x = 1
print(x)
if x > 0 then print("ok") end
return x
```

## 变量
#### 变量的命名规则：
1. 以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上 0 个或多个字母，下划线，数字（0 到 9）来命名变量。
2. 不允许使用特殊字符如 @, $, 和 % 来定义变量。
3. 区分大小写。Runo 与 runno 是两个变量。
4. 一般约定，一下划线开头连接一串大写字母的名字被保留用于Lua内部全局变量（比如——VERSION)。
```
@1 不允许
9_app 不允许
_abc 允许
fish_ 允许
app_1 允许
```

#### 变量类型：
1. 变量有三种类型：全局变量、局部变量、表中的域
2. 编译程序执行代码之前，需要给变量开辟存储区，用于存储变量的值。全局变量、局部标量、表中的域，它们分别怎么存。

#### 全局变量和局部变量:
| 特性 | 局部变量 (`local`) | 全局变量 (默认) |
|---|---|---|
| **存储位置** | 虚拟机寄存器/栈 | 全局表 `_G` |
| **访问速度** | 极快（索引访问） | 较慢（哈希查找） |
| **作用域** | 仅限声明所在的代码块 | 整个 Lua 程序 |
| **内存回收** | 超出作用域自动回收 | 需手动赋 `nil` 才回收 |
| **推荐程度** | ⭐⭐⭐⭐⭐（默认选择） | ⭐（尽量避免） |<websource>source_group_web_10</websource>


```lua
a = 1
func = function()
    b = "apple"
    local c = "Louis"
    print(a)
    print(b)
    print(c)
end
func()
print(a)
print(b)
print(c)
print("end")
-- 输出
-- 1
-- apple
-- Louis
-- 1
-- apple
-- nil   

```
#### 变量赋值
```lua
a = {"hello", "lua", "python"}
print(a) 
h, k = 10, 2*10
print(h, k) 
x = 1
y =2
print(x, y)
x, y = y, x
print(x, y) 
print(a[1], a[2]) 
a[1], a[2] = a[2], a[1]
print(a[1], a[2]) 
d, c, e = a[1], a[2]
print(d, c, e) 
f, g, h = a[2], a[3]
print(f, g, h) 
-- 依次输出：
-- 10	20
-- 1	2
-- 2	1
-- hello	lua
-- lua	hello
-- lua	hello	nil
-- hello	python	nil

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
print(type(nil))   -- nil
print(type(true))   -- boolean
print(type(10.4*3))   -- number
print(type("hello lua"))  -- string
print(type(print))   -- function
print(type({}))   -- table 
print(type({"apple", "banana"}))  -- table
print(type(type(10.1)))   -- string
```

#### nil
1. nil为空。
2. 任何没有赋值的变量都输出nil值
3. 条件语句中nil为false

```lua
print(X) -- nil
X == nil -- true
if nil
    print(true)
else:
    print(false)
end  -- false
```
#### boolean
1. 值为true false
2. 常用于条件判断
``` lua
print(true)    -- true 直接输出boolean类型的值
print(type(true)) -- boolean 直接输出的是type函数的返回值，该值属于字符串类型
if true then  
     print("at least one true")
else
    print("all false")
end  -- all false 可知nil也是false

```

#### number
1. lua默认只有一种number类型--双精度类型。双精度就是用 64 位来存一个浮点数，比单精度更精确、范围更大，但仍然会有浮点误差。
```lua
print(2)  -- 2
print(2.2)  -- 2.2
print(2e+1)  -- 20.0 
print(7.2333e-06)  -- 7.2333e-06
print(type(2))  -- number
print(type(2.2))  -- number
print(type(2e+1))  -- number
print(type(7.23e-06))  -- number
```
#### string
1. 字符串不是表
```lua
string1= "this is sring1"  -- 字符串
string2 = [[      
<html>
<head></head>
<body>
    <a href="xx"></a>
</body>
</html>
]]   -- 字符块
-- 字符运算
print("2"+6) -- 8
print("2"+"6") -- 8
print("2+6") -- 2+6
print("-2e2"*6) -- -1200.0
print("-2e2"*"6") -- -1200.0
print("number"+6) -- lua: number.lua:14: attempt to add a 'string' with a 'number'
print(type("2"+6)) -- number
print(type("2"+"6")) -- number
print(type("2+6")) -- string
print(type("-2e2"*6)) -- number 
print(type("-2e2"*"6")) -- number

-- 字符连接
print("a" .. 'b') -- ab
print(157 .. 428) -- 157428

-- 字符长度
len = "abcd"
print(#len)  -- # 符号代表计算长度
```

#### table
1. 创建表 即 表的初始化
```lua
tbl1 = {}
tbl2 = {"apple", "banana", "candy"}

```
2. 表的索引可以是数字，也可以是字符串。没有定义索引时，默认有从1开始的数字索引
```lua
tbl2 = {"apple", "banana", "candy"}
print(tbl2[1], tbl2[2]) 
tbl2[10] = "jacky"
tbl2["age"] = 18
for k,v in pairs(tab1) do
	print(k .. "-" ..v)
-- apple  banana
-- 1-apple
-- 2-banana
-- 3-candy
-- 10-jacky
-- age-18
```


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
-- key1-val1
-- key2-val2 

-- 1-val3   key1=nil相当于空值，可以理解为不存在了。
-- key2-val2
tab2 = {key1="val1", "val2", key3="val3", "val4"}
for k,v in pairs(tab2) do
	print(k .. "-" ..v)
end

tab2.key3 = nil
for k,v in pairs(tab2) do
	print(k .. "-" ..v)
end
-- 输出:
-- 1-val2
-- 2-val4  优先输出默认的数组索引
-- key1-val1 在输出定义的键值对
-- key3-val3
-- 1-val2
-- 2-val4
-- key1-val1
-- 

```
可见type函数返回一定是string类型。
```lua
local tbl1 = {} -- 创建空表
local tbl2 = {"apple","banana", "orange"} -- 创建有值的table
tbl2['name"] = "fruit"
for k,v in pairs(tbl2) do
print(k .."-"..v)
end
-- 1-apple
-- 2-banana
-- 3-orange
-- name-fruit
print(tbl2["name"]) -- fruit
print(tbl2[1]) -- apple
tbl2[1] -- apple

```












-----
## 错误收集
#### 1. 函数语句中不用逗号分割语句

```lua

return{
   "catppuccin/nvim",
   name = "catppuccin",
   lazy = false,
   priority = 1000,
   config = function()
    require("catppuccin").setup({
      flavour = "mocha",  -- latte / frappe / macchiato / mocha
    })
    vim.cmd.colorscheme("catppuccin")
   end
}

```

上面Lua代码中，我写成`vim.cmd.colorscheme("catppuccin"),`就多了一个,号，就执行失败了。错误的原因是语法错误。因为函数中不能有逗号。
```lua
return {
  "catppuccin/nvim",       -- 表字段1
  name = "catppuccin",     -- 表字段2
  lazy = false,            -- 表字段3
  priority = 1000,         -- 表字段4
  config = function()      -- 表字段5，值是一个函数
    require("catppuccin").setup({ flavour = "mocha" })
    vim.cmd.colorscheme("catppuccin")   -- ← 这是函数体内的语句，不是表字段
  end,                       -- ← 这个逗号才是分隔符，分隔 config 字段和后面的字段
}

```

逗号是分割表字段的，而不是用在函数中的语句之间的。函数语句之间用换行符即可。
`function() .. end` 中间的语句不能用,号
