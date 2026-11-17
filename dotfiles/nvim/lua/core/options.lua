local opt = vim.opt
-- global options 
opt.encoding = "utf-8" -- neovim内部使用的编码
opt.fileencoding = "utf-8" -- 读写文件时使用的编码
opt.number = true -- 显示绝对行号
opt.relativenumber = true -- 相对行号开关
opt.clipboard = "unnamedplus" -- 把系统剪贴板当做默认寄存器
