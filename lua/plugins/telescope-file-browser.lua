return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').load_extension 'file_browser'
    local file_browser = require('telescope').extensions.file_browser
    local themes = require 'telescope.themes'
    vim.keymap.set('n', '<leader>ff', function()
      file_browser.file_browser(themes.get_ivy())
    end, { desc = 'File browser' })
  end,
}
