return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-mini/mini.nvim'
  },
  opts = {
    -- 把链接跳转从 Enter 改成 gl
    keymaps = {
      follow = { 'gl' },
    }
  },
  config = function(_, opts)
    local rm = require('render-markdown')
    rm.setup(opts)
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'markdown',
      callback = function()
        vim.opt_local.conceallevel = 2
        rm.buf_enable()
      end,
    })
  end,
}
