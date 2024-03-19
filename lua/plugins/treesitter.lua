return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'javascript',
        'html',
        'css',
        'python',
        'go',
        'tsx',
        'bash',
        'markdown',
        'markdown_inline',
        'http',
        'json',
        'elixir',
        'twig',
        'elm',
      },
      ignore_install = {},
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }

    vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
      pattern = '*.njk',
      command = 'set filetype=twig',
    })
  end,
}
