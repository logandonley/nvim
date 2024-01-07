return {
  "mrcjkb/rustaceanvim",
  version = '^3',
  ft = { 'rust' },
  depdenencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set(
      "n",
      "<leader>a",
      function()
        vim.cmd.RustLsp('codeAction')
      end,
      { silent = true, buffer = bufnr }
    )
  end,
}
