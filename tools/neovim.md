[TOC]

## Vim是纯文本编辑器
>
 Vim正式名称是Vi IMproved。是一个与Unix编辑器vi兼容并在此基础上增强的纯文本编辑器。
> 
> 它主要运行在终端里，支持几乎所有平台。 Vim编辑时，几乎所有操作都靠键盘完成。

**用vim的原因** 
1. **专注沉浸**。在编辑的过程中，手和眼睛不用从键盘下来去找鼠标、再用光标移动或者点击、最后再回到键盘。中间打断专注次数大幅减少，使人专注在编辑的内容里面。是一个能让人沉浸其中的编辑器。
2. **快速高效**。在熟练了vim的操作后，各种组合能大幅提高编辑效率。
3. **对接大模型**。用neovim编辑markdown文档, markdown文档是大模型理解的最好的一种格式。


## Vim核心概念
### 事件循环
vim是单线程、事件驱动的编辑器。它的主线程卡在一个循环里：等待事件->处理事件->等待事件->...
```python
# 伪代码
while not quit_flag:
    # 等待输入：键盘、鼠标、剪贴板、信号
    # 获得事件，分发处理
    #    - 如果是按键，交给按键映射、宏、命令解析、模式逻辑处理
    #    - 如果是定时器、信号，则执行对应的回调。
    # 刷新屏幕(redraw)
    # 回到循坏开头继续等待
```

### Mode模式
> vim是一个多模态编辑器。
>
> 有normal、insert、command、visual等主要模态。

**vim内部有一个全局的时间循环，主要做循环读取按键, 确定模态，根据当前模态解析按键，执行动作，修改缓冲区和视图。**

#### normal-普通模式
> vim进入文件后的默认模式是普通模式。从普通模式是进入其他模式的起点。**其他模式的起点必须是普通模式**。

在普通模式下,可以查看文件，同时也可以对文件就行operator-pending的操作。

`<ctrl-o>` 光标会退到上一个位置 
`<ctrl-i>` 光标前进到下一个位置 

#### insert-插入模式
键入i a A o O进入插入模式。


#### command-命令模式
键入:进入命令模式，后面接命令，再回车触发执行。

`:10,100y` 复制10-100行

`:10,100d` 删除10-100行

`:<C+f>` 查看历史跑过的命令

#### visual-可视化模式
#### operator-pending-操作等待模式

### Buffer缓冲区
> Buffer是内存中存放文件的容器，一个Buffer中可以存放多个文件。

`:e main.c` 该命令可以打开main.c文件

`:sp main.c` 该命令可以分屏(上下切成两个窗口)并打开main.c文件

`:ls` 该命令可以查看buffer中的文件列表,可以看到文件编号和文件名。

`:b n` 该命令可以打开编号为n的文件。

`:b ma.md` 该命令可以打开名为ma.md的文件。

`Ctr-^` 该按键组合在buffer中只有两个文件的时候进行方便的切换。

### Window
> 窗口用来展示buffer。

`:sp name.txt` 横切成左右两个窗口并打开name.txt文件

`:vsp name.txt` 竖切成左右两个窗口并打开name.txt文件

`<ctrl-w>方向键` 根据方向键切换窗口

`<ctrl-w>c` 关闭当前窗口

`<ctrl-w>o` 除了当前窗口，关闭其他窗口

### Tabpage
### operator+motion/text-object+范围(vim高效的灵魂)
d4l  -->  剪切操作 向右执行4次
y4l  -->  复制操作 向右执行4次
c4l  -->  删除并插入操作 向右执行4次
常见operator
| Operator | 效果 | 例子 |
|---|---|---|
| `d` | 删除 | `dw` 删除一个单词 |
| `y` | 复制 | `yy` 复制一行 |
| `c` | 修改 | `cw` 修改一个单词 |
| `~` | 切换大小写 | `~~` 切换当前行大小写 |
| `g~` | 反转大小写 | `g~w` 反转一个单词大小写 |
| `gu` | 转小写 | `guw` 一个单词转小写 |
| `gU` | 转大写 | `gUw` 一个单词转大写 |
| `>` | 右缩进 | `>>` 缩进当前行 |
| `<` | 左缩进 | `<<` 取消缩进 |
| `=` | 自动缩进 | `gg=G` 全文格式化 |
| `zf` | 创建折叠 | `zfap` 折叠当前段落 |

字符级的移动
| Motion | 效果 |
|---|---|
| `h` / `j` / `k` / `l` | 左 / 下 / 上 / 右 |

单词级的移动
| Motion | 效果 |
|---|---|
| `w` | 跳到下一个单词开头 |
| `b` | 跳到上一个单词开头 |
| `e` | 跳到当前单词结尾 |
| `W` / `B` / `E` | 同上，但以空格为分隔（忽略标点） |

行内的移动
| Motion | 效果 |
|---|---|
| `0` | 行首 |
| `^` | 行首第一个非空字符 |
| `$` | 行尾 |
| `f{char}` | 跳到右侧下一个指定字符 |
| `t{char}` | 跳到右侧指定字符之前 |
| `F{char}` / `T{char}` | 同上，但向左 |

行间的移动
| Motion | 效果 |
|---|---|
| `gg` | 文件首行 |
| `G` | 文件末行 |
| `nG` | 第 n 行 |
| `{` / `}` | 上一段 / 下一段 |
| `%` | 跳到匹配的括号 |

搜索移动
| Motion | 效果 |
|---|---|
| `/pattern` | 向下搜索 |
| `?pattern` | 向上搜索 |
| `n` / `N` | 重复搜索 |

组合公式:
> [count] + operator + [count] + motion

### Register
### Mapping
### Autocmd
> 当满足某个事件时(打开某类文件、进入buffer)，自动执行命令

当打开md类型的文件时执行映射设定。

`autcmd FileType markdown nmap <leader>m <Plug>MarkdownPreview` 
### Options
> vim行为、显示等控制开关

`set number` " 设定行号
`set hlsearch` " 设定搜索结果高亮
### Variable
> vimscript的变量。用let设定，设定的变量分作用域，g:全局、b:缓冲区、w:窗口

`let g:mkdp_auto_start=1` " 设定md文件打开后立刻执行markdown-preview插件展示md文件

### Script/Vimscript
### Plugin
> 各路vim爱好者，针对vim\nvim的痛点，开发插件，增强vim\nvim的功能。

首先是统一插件的管理器，这种管理器本身也是一种插件。主要完成插件的加载、安装、更新、卸载等任务。对比vim-plug和lazy.nvim两款插件管理器。
|对比项|vim-plug|lazy.nvim|
|--|--|--|
|支持编辑器|vim、neovim|只支持neovim(0.8+)|
|开发语言|vimscript|lua|
|懒加载|支持，但需要手动写on/for，默认全部加载|自动化懒加载。keys\cmd\ft\event插件只在触发时加载，启动速度快很多|
|懒加载管理|无自动依赖解析，插件加载顺序自己控制|自动识别依赖、保证加载先后顺序|
|版本锁定|有快照功能，但不方便|自带lazy-lock.json锁定每个插件版本，换机器可以复现一模一样的|
|管理UI|没有内置面板，只有简单命令行输出|:lazy打开可视化面板。看更新、回滚、查看启动消耗、性能分析|
|配置写法|vimscript语法，单文件|Lua语法，声明式结构。支持分成多个lua文件|
|自动安装|不会自动不缺失插件，必须手动:PlugInstall|打开nvim自动检测缺失插件，可以设置自动安装|
|适合场景|同时用vim和neovim、插件少|只用neovim、插件多|

> 总结：
>
> vim-plug：老牌、稳定、简单。它是一个单文件脚本，设计理念就是 “只管下载、更新、删除插件”，懒加载属于附加能力，不是强项。

> lazy.nvim：现代 Neovim 专用，能力更强。它不只是下载工具，**同时管理插件加载时机、依赖、性能、版本锁定**。

其他功能插件一般都可以通过对vim-plug和lazy.vim配置，来加载。以下，记录一些使用过的插件(我使用的是lazy.nvim)
| 插件名称         | 主要功能                                                                         | 使用体验                                                                        |
|------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| vim-startfy      | nvim启动后的首页,可以列出最近打开的文件，可根据首页文件列表按编码快捷进入文件    | 整体页面比较简单，最近打开的文件再进入会比较方便，但没有对vimwiki笔记的快捷入口 |
| vimwiki          | 快速创建wiki笔记本，快速的进入笔记本，快速创建目录与文件的连接，能快速形成知识网 | 形成知识网络比较好用的一款插件                                                  |
| markdown-preview | 在用nvim标记md文件时，可以实时在浏览器网页上看到md文件渲染的效果                 | 能实时看到笔记效果                                                              |
| mini.nvim        | nvim编辑器的套件，包含首页功能、括号对功能、基础git功能等等                      | 待更新                                                                          |
| telescope        | 在vimwiki笔记范围内进行搜索(可跨md文件搜索)                                      | 待更新                                                                          |
| catppuccin.nvim  | neovim的主题颜色                                                                 | neovim默认主题的行号颜色太淡了，catppuccin中可以将行号的亮度调整和正文一样亮    |

### Search
> 在文件内容中搜索关键字符，在当前行中搜索关键字符

`/apple<cr>` 向下查找 apple 关键词 

`n` 跳到下一个 apple 关键词

`N` 跳到上一个 apple 关键词

`?apple<cr>` 搜索光标前 apple 关键词

`Fa` 搜索当前行中光标左边最近的一个a

`fa` 搜索当前行中光标右边最近的一个a

`:nohl` 不高亮(搜索时关键词默认为高亮)


### macro
> vim的宏(macro)就是把一连串按键动作录下来，在批量重复操作。常用于批量操作(批量添加链接、批量添加-、批量格式化)

基础语法：
" 创建宏 使用宏

`qa` q=启动录制 a=存到寄存器a中 底部状态栏显示recoding @a代表正在录制

`q`  再按q=停止录制

" 使用宏

`@a` 执行1次录制的操作

`3@a` 执行3次录制的操作

`@@` 执行上一次的操作(该命令必须register被引用过一次才能正常使用。即必须`3@a`执行完成后，证明register被调用过一次，才能用`@@` )

" 查看宏

`:reg a` 查看寄存器a

" 修改宏

`:let @a="I-<Esc>j"` 直接复制，把按键序列写进寄存器中

## vim基本操作(高频)

|模式切换|操作|映射|
|--|--|--|
|从普通模式进入到插入模式|i、a、o、O||
|从插入模式进入到普通模式|Esc||
|从普通模式进入到命令模式|:、/、?||
|从命令模式进入到普通模式|Esc||
|从普通模式进入visual模式|v|
|从visual模式进入到普通模式|Esc|
- [ ] visual模式下的操作，比较欠缺

|文件保存退出|操作|映射|
|--|--|--|
|保存|:w||
|退出|:q||
|强制退出不保存|:q!||
|保存并退出|:wq|zz|

|复制粘贴删除行|操作|映射|
|--|--|--|
|复制一行|yy|
|复制5行|5yy|
|粘贴到下一行|p|
|粘贴到上一行|P|
|删除当前行|dd|
|删除当5行|5dd|
|复制全部内容到系统剪贴板|ggVG"+y、:%y+(vim要支持clipboard, 查看命令：vim --version | grep clipboard)|

|翻页|操作|映射|
|--|--|--|
|向下翻一页|Ctrl + f|
|向上翻一页|Ctrl + b|
|向下翻半页|Ctrl + d|
|向下翻半页|Ctrl + u|
|跳到指定行|行号G、行号gg|
|向对的当前行条n行|:行号<回车>|
|跳到首行|gg、:1|
|跳到末行|G、:$|

|搜索|操作|映射|
|--|--|--|
|向下搜索关键词|/关键词(按n找下一个，N找上一个)|
|向上搜索关键词|?关键词(按n找下一个，N找上一个)|

|行操作|操作|映射|
|--|--|--|
|跳到当前行的绝对开头|0|
|跳到当前行的第一个非空白字符|^|<|
|跳到当前行的最后一个字符|$|>|
|回到上次光标位置-往前|Ctrl+o|
|回答上次光标位置-往后|Ctrl+i|
|在本行里面搜索在光标左边的字符x|Fx|
|在本行里面搜索在光标右边的字符x|fx|

## 关键词解释
1. **< silent>**
```
" 当运行<leader>wi时，vim底部状态栏会闪过:VimwikiIndex。
nnoremap <leader>wi :VimwikiIndex<CR>
```
```
" 当运行<leader>wi时，vim底部状态栏什么都不显示，安静执行，界面干净。
nnoremap <silent> <leader>wi :VimwikiIndex<CR>
```
2. **autocmd FileType markdown inoremap ,b **** <Esc>F*hi**
> autocmd 自动命令。即当触发某个事件时，自动执行后面的命令。
>
> 命令格式：autocmd 事件 执行命令
>
> 事件: FileType markdown 检测到当前文件类型时markdown类型
>
> 执行命令：inoremap ,b **** <++><Esc>F*hi 即当按,b时，实际输出**** <++>并将光标停在四个*中间且进入插入模式。
>
> **该命令只在markdown文件的插入模式下，快捷键映射命令才生效。py、TXT、c等等文件，快捷键映射不生效。**

## 插件
### vim-plug 插件
> vim-plug本身是插件。它的主要功能是管理vim的插件(插件的下载、安装、更新、卸载)

用vim-plugin方式安装其他插件：
1. 在.vimrc文件中Plugin中添加要安装的插件
2. 在命令行中运行PluginInstall
### markdown-preview 插件
> markdown-preview主要功能是展示渲染后的markdown文件
当用vim打开md文件时，就立即启动浏览器渲染并用浏览器页面展示md。
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1 " 当关闭markdown文件，vim的缓冲从markdown的缓冲变成了其他的缓冲，就自动关闭已经打开的md页面
### NERDTree 插件
```
nnoremap <leader>n :NERDTreeFind<cr>   " 打开目录树，并定位到找到当前编辑的文件
nnoremap <leader>t :NERDTreeToggle<cr> " 打开目录树 或者 关闭目录树
```
## vimrc个性化设置
1. 加载自定一的关于markdown的快捷键
```
source ~/.vim/snippits.vim 
```
```
" 文件~/.vim/snippits.vim中的内容:
" set keys for markdown file
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,C ```python<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

```
2. 设置打开md浏览模式的快捷键
```
" set keys to start and stop Preview page
autocmd FileType markdown nmap <leader>m <Plug>MarkdownPreview
autocmd FileType markdown imap <leader>m <Plug>MarkdownPreview
```
3. 设置markdown-preview插件的variables
```
"set to 1, nvim will open the preview window after enter from collections import defaultdictering the markdown bugger. default 0, 
let g:mkdp_auto_start = 1

```





### 设置命令(set)
> 作用：用来打开、关闭和调整Vim的内置行为，控制编辑器怎么显示、怎么输入、怎么搜索、怎么处理文件。
> set option       " 打开（启用）这个选项
> set nooption     " 关闭这个选项
> set option=value " 给选项赋值（不是开关类）


##### 高频设置:
> set encoding=utf-8  " 
> set number          " 开启行号
>
> set relativenumber  " 相对行号（方便 j/k 跳转）
>
> set cursorline      " 高亮当前行
>
> set wrap            " 长文本自动折行（写markdown很有用）
>
> set nowrap          " 不折行，一行横向滚动（看代码）
> 
> set list            " 显示空白字符：制表符、空格、换行标记

### 映射命令(map)
> 作用：自定义的快捷键映射到操作、映射到命令
>
> 命令的格式：模式("n","i","v","c","t","o") + 是否递归("nore" or "") + "map"。比如普通模式下的非递归映射命令nnoremap, 插入模式下的递归映射命令imap
> 
> 重点：2个概念(递归、非递归)、6个模式(普通模式normal、插入模式insert、可视模式visual、命令行模式command、终端模式terminal、操作符模式operator-pending)

#### 递归、非递归
命令中带"nore"的，代表不递归; 命令中不带"nore"的，代表递归。  
```
nmap j gj
nmap gj <Down>
```
按j先触发gj 然后会触发<Down>，连锁递归

```
nnoremap j gj
nnoremap gj <Down>
```
按j只会触发gj，不会再触发<Down>。

`在日常自定义快捷键时，一律优先使用非递归命令，避开设置递归命令，反之模型奇妙的冲突。`

#### 模式
|模式|递归|非递归|
|--|--|--|
|insert|imap|inoremap|
|command|cmap|cnoremap|
|normall|nmap|nnoremap|
|visual|vmap|vnoremap|
|normal+visual|map|noremap|


实例：
```
nnoremap u k
nnoremap n j
nnoremap e h
nnoremap i l
inoremap jk <Esc>  
```

#### 查看当前映射
```
:map " 查看所有递归映射
:nmap "查看普通模式下的映射
:imap "查看插入模式下的映射
:vnoremap "查看可视模式下非递归映射
```
