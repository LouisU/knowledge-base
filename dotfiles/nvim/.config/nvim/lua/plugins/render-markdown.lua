return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown", "vimwiki" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-mini/mini.nvim'
  },
  opts = {
    keymaps = {
      follow = {},  -- disable built-in follow mapping, release <CR> to vimwiki
    }
  },
  config = function(_, opts)
    local rm = require('render-markdown')
    rm.setup(opts)
    -- register vimwiki filetype to use markdown treesitter parser
    vim.treesitter.language.register('markdown', 'vimwiki')

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = {'markdown', 'vimwiki'},  -- add vimwiki into pattern
      callback = function()
        vim.opt_local.conceallevel = 2
        rm.buf_enable()
      end,
    })
  end
}
