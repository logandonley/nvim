local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

vim.filetype.add({ extension = { templ = "templ" } })

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
-- Get list from here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "pyright",
    "gopls",
    "lua_ls",
    "html",
    "nil_ls",
    "ruff_lsp",
    "bashls",
    "tailwindcss",
    "emmet_language_server",
    "templ",
    "sqlls",
    "elixirls"
  },
  handlers = { default_setup },
})

lspconfig.html.setup({
  filetypes = { "html", "htmldjango", "templ" },
})

lspconfig.htmx.setup({
  filetypes = { "html", "htmldjango", "templ" },
})

lspconfig.tailwindcss.setup({
  filetypes = { "html", "htmldjango", "templ", "javascript", "typescript" },
  init_options = {
    userLanguages = {
      templ = "html",
    },
  },
})
