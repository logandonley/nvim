return {
  'nvim-telescope/telescope-ui-select.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').load_extension 'ui-select'
  end,
}
