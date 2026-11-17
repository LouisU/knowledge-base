# diary
--------
check and [delete](delete.md)
[##](##.md) 2021
### [May](May.md)
### April 

+ [2021 04 04](2021-04-04.md)
+ [04 03](2021-04-03.md)
+ [04 02](2021-04-02.md)
+ [4 1](2021-04-01.md)
+ 261115
  
### [March](March.md) 
[3 1 ](2021-03-31.md)

### 20261117
** 原则： 最集中话学习分、最小化学习法则 **
- [x] 任务清单标记映射 - A
- [ ] 分屏应用，配置 - A
   - [x ] 关闭 台前调度 -- mac默认就是关闭的
   - [x ] 关闭 当切换到应用时，切换到含有该应用打开窗口的空间 -- 已关闭
   - [x ] 关闭 触控板设置-> 更多手势 中的所有涉及三个手指的调度功能
   - [x ] 关闭 键盘->键盘快捷键->调度中心 中的ctrl+方向键上\下
   - [ x] 熟悉快捷键
   - [ ] 熟悉配置 
- [x] 新窗口直接打开vim-startfiy页面 -A
- [ ] 安装git插件
- [ ] 安装显示键盘按键的插件
- [ ] nvim主题格式的插件
- [ ] 管理wiki的目录- A
- [ ] 输入md内容
   - [ ] .lua的问题导致plugins加载失败
   init.lua会加载lua/plugins/下所有*.lua文件，需要所有文件中都有return{}，但.lua文件很难发现其存在，就更不好发现其内容中没有return{}，所以一直报错:
Error in /Users/shaoye/.config/nvim/init.lua:
Invalid spec module: `plugins.`
   - [ ] 在按键映射中，<leader>sl 不应映射成 <leader>ss
map("n", "<leader>sl", ":set splitright<cr>:vsp<cr>:Startify<cr>", {desc="split window, go to right", silent=false})
vim.keymap.set 默认是 非递归映射，所以执行到这里时并不会触发你之前定义的 <leader>ss。<leader>ss 就会变成“执行完 vsplit 后再往按键队列里塞几个普通字符”，而不是“执行 <leader>ss 这个快捷键”。

