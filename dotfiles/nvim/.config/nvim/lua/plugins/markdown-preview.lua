-- return{
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   ft = { "markdown", "vimwiki" },
--   build = "cd app && yarn install",
--   init = function()
--     vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
--     vim.g.mkdp_auto_start = 0
--     vim.g.mkdp_auto_close = 1
--   end,
--   config = function()
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = { "markdown", "vimwiki" },
--       callback = function()
--         vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", {
--           buffer = true,
--           desc = "markdown preview"
--         })
--       end
--     })
--   end
-- }

-- install with yarn or npm
return{
     "iamcco/markdown-preview.nvim",
     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
     ft = { "markdown" },
     build = "cd app && yarn install",
     init = function()
       vim.g.mkdp_filetypes = { "markdown" }
       vim.g.mkdp_auto_start = 0 -- 1 nvim auto open preview window
       vim.g.mkdp_auto_close = 1 -- 1 nvim auto close prewiew window
     end,
     keys = {
      { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "markdown preview" },
     }
}
