return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-mini/mini.nvim'
  },
  opts = {},
  config = function()
    local rm = require('render-markdown')
    rm.setup({})
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*.md',
      callback = function()
        vim.opt_local.conceallevel = 2
        rm.buf_enable()
      end,
    })
  end,
}
