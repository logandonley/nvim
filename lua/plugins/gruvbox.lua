return {
  'ellisonleao/gruvbox.nvim',
  config = function()
    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'gruvbox'
  end,
  priority = 1000,
  lazy = false,
}
