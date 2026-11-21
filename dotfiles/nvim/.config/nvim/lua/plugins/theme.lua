return{
   "catppuccin/nvim",
   name = "catppuccin",
   lazy = false,
   priority = 1000,
   config = function()
    require("catppuccin").setup({
      flavour = "mocha",  -- latte / frappe / macchiato / mocha
      custom_highlights = function(colors)
        return {
          -- 普通行号：用 text，几乎和正文一样亮
          LineNr = { fg = colors.text },
          -- 当前行号：更醒目一点
          CursorLineNr = { fg = colors.rosewater, style = { "bold" } },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
   end
}
