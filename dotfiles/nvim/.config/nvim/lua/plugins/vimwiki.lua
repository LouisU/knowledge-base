-- vimwiki，和你之前配置一致
return   {
     "vimwiki/vimwiki",
     init = function()
       vim.g.vimwiki_list = {
         {
           path = "~/knowledge-base/",
           index = "README",
           syntax = "markdown",
           ext = ".md",
           template_path = "~/knowledge-base/templates/",
           template_default = "def_template",
           template_ext = ".md",
           links_space_char = "-"
         },
       }
       vim.g.vimwiki_global_ext = 0
       vim.g.vimwiki_markdown_link_ext = 1
       vim.g.vimwiki_dir_link = ""
     end,
     keys = {
       { "<leader>wi", "<cmd>VimwikiIndex<cr>", desc = "Vimwiki Index" }, -- 默认打开~/knowledge-base/README.md
       { "<leader>wd", "<cmd>VimwikiDiaryIndex<cr>", desc = "Vimwiki Diary" }, -- 默认打开~/knowledge-base/diary/diary.md
     }
   }
