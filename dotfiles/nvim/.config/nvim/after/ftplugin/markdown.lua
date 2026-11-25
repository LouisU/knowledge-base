-- ~/.config/nvim/after/ftplugin/markdown.lua

local map = vim.keymap.set
local opts = { buffer = true, noremap = true, silent = true }



-- set keys for markdown file
map("i", "<leader>f", "<Esc>/<++><CR>:nohlsearch<CR>c4l", {desc=""})
map("i", "<leader>n", "---<Enter><Enter>", {desc=""})
map("i", "<leader>b", "**** <++><Esc>F*hi", {desc=""})
map("i", "<leader>i", "** <++><Esc>F*i", {desc=""})
map("i", "<leader>d", "`` <++><Esc>F`i", {desc=""})
map("i", "<leader>C", "```python<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", {desc=""})
map("i", "<leader>c", "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", {desc=""})
map("i", "<leader>h", "====<Space><++><Esc>F=hi", {desc=""})
-- map("i", "<leader>p", "![](<++>) <++><Esc>F[a", {desc=""})
map("i", "<leader>p", "<img src=\"\" alt=\"<++>\" style=\"display:block; margin:0 auto; width:50%;\"><Enter><Enter><++><Esc>02kf\"a", {desc=""}) 
map("i", "<leader>a", "[](<++>) <++><Esc>F[a", {desc=""})
map("i", "<leader>1", "#<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>2", "##<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>3", "###<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>4", "####<Space><Enter><++><Esc>kA", {desc=""})
map("i", "<leader>l", "--------<Enter>", {desc=""})
map("i", "<leader>L", "- [ ] <++><Esc>F]i", {desc=""})



