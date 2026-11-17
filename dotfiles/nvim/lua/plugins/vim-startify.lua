
return {
  "mhinz/vim-startify",
  -- 启动时自动加载，打开nvim不带文件就唤起首页
  event = "VimEnter",
  -- 配置写在 init 里（vim-startify 是vimscript插件，用vim.g设置）
  init = function()
    -- 示例：自定义列表，适合你 vimwiki 知识库
    vim.g.startify_lists = {
      { type = "files", header = { "   Recent Files" } },
      { type = "dir", header = { "   Current Directory" } },
      { type = "commands", header = { "   Commands" } },
      { type = "bookmarks", header = { "   Bookmarks" } },
    }

    -- 书签，直接写你的vimwiki首页
    vim.g.startify_bookmarks = {
      { w = "~/knowledge-base/README.md" },
    }

    -- 关闭默认banner，可选
    vim.g.startify_enable_special = 0
    -- 自动打开startify，默认开启
    vim.g.startify_open = 1
  end,
  keys = {
    -- 随时快捷键调出startify首页
    { "<leader>ss", "<cmd>Startify<CR>", desc = "Open Startify" },
  }
}
