[TOC]
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

print(type("hello lua"))  -- string
print(type(10.4*3))   -- number
print(type(print))   -- function
print(type(true))   -- boolean
print(type(nil))   -- nil
print(type(type(X)))   -- string
print(type(type(true)))   -- string
print(type(type(10.1)))   -- string
```
可见type函数返回一定是string类型。
#### nil
nil为空。任何没有赋值的变量都输出nil值

```lua
> print(X)
nil
> X == nil
true
> type(X) == nil
false
> type(X) == "nil"
true
>
```
#### boolean
``` lua
print(true)    -- true 直接输出boolean类型的值
print(type(true)) -- boolean 直接输出的是type函数的返回值，该值属于字符串类型
print(type(type(false))) -- string 直接输出字符串类型名称
if false or nil then  
     print("at least one true")
else
    print("all false")
end  -- all false 可知nil也是false

```

#### number
lua默认只有一种number类型--双精度类型
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
print(#len)  -- 4


```

#### table
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
