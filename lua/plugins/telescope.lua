return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require 'telescope.builtin'
    local themes = require 'telescope.themes'

    local function apply_theme(cmd)
      return function()
        cmd(themes.get_ivy())
      end
    end

    vim.keymap.set('n', '<leader><leader>', apply_theme(builtin.find_files), { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', apply_theme(builtin.live_grep), { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', apply_theme(builtin.buffers), { desc = 'Search buffers' })
    vim.keymap.set('n', '<leader>fh', apply_theme(builtin.help_tags), { desc = 'Search helps' })
    vim.keymap.set('v', '<leader>fs', apply_theme(builtin.grep_string), { desc = 'Search selection' })
    vim.keymap.set('n', '<leader>fm', apply_theme(builtin.man_pages), { desc = 'Search man pages' })
    vim.keymap.set('n', '<leader>ft', apply_theme(builtin.filetypes), { desc = 'Search filetypes' })
  end,
}
