local map = vim.keymap.set

-- 基本映射
-- 文件的退出和保存操作
map("n", "ZQ", ":q<cr>", {desc="quit"})
map("i", "ZQ", "<Esc>:q<cr>", {desc="quit"})
map("n", "ZZ", ":wq<cr>", {desc="Save and quit"})
map("i", "ZZ", "<Esc>:wq<cr>", {desc="Save and quit"})
map("n", "zz", ":w<cr>", {desc="Save"})
map("i", "zz", "<Esc>:w<cr>", {desc="Save"})
map("i", "jk", "<Esc>", {desc="change into normal mode from insert mode"})


-- 创建窗口操作
map("n", "<leader>sl", ":set splitright<cr>:vsp<cr>:Startify<cr>", {desc="split window, go to right", silent=false})
map("n", "<leader>sh", ":set nosplitright<cr>:vsp<cr>:Startify<cr>", {desc="split window, stay at left"})
map("n", "<leader>sj", ":set splitbelow<cr>:sp<cr>:Startify<cr>", {desc="split window, go to down"})
map("n", "<leader>sk", ":set nosplitbelow<cr>:sp<cr>:Startify<cr>", {desc="split window, stay at top"})
-- 切换窗口操作
map("n", "<leader>h", "<C-w>h", {desc="go to left window"})
map("n", "<leader>j", "<C-w>j", {desc="go to down window"})
map("n", "<leader>k", "<C-w>k", {desc="go to top window"})
map("n", "<leader>l", "<C-w>l", {desc="go to right window"})
-- 调整窗口尺寸操作
map("n", "<left>", ":vertical resize-5<cr>", {desc="当前窗口横向变小5个单位"})
map("n", "<down>", ":res -5<cr>", {desc="当前窗口纵向变小5个单位"})
map("n", "<up>", ":res +5<cr>", {desc="当前窗口纵向变大5个单位"})
map("n", "<right>", ":vertical resize+5<cr>", {desc="当前窗口横向变大5个单位"})

-- set keys for markdown file
map("i", "<leader>f", "<Esc>/<++><CR>:nohlsearch<CR>c4l", {desc=""})
map("i", "<leader>n", "---<Enter><Enter>", {desc=""})
map("i", "<leader>b", "**** <++><Esc>F*hi", {desc=""})
map("i", "<leader>i", "** <++><Esc>F*i", {desc=""})
map("i", "<leader>d", "`` <++><Esc>F`i", {desc=""})
map("i", "<leader>C", "```python<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", {desc=""})
map("i", "<leader>c", "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", {desc=""})
map("i", "<leader>h", "====<Space><++><Esc>F=hi", {desc=""})
map("i", "<leader>p", "![](<++>) <++><Esc>F[a", {desc=""})
map("i", "<leader>a", "[](<++>) <++><Esc>F[a", {desc=""})
map("i", "<leader>1", "#<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>2", "##<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>3", "###<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>4", "####<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>l", "--------<Enter>", {desc=""})
map("i", "<leader>L", "- [ ] <++><Esc>F]i", {desc=""})

