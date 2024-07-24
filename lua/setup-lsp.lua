local lspconfig = require 'lspconfig'
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
  end,
})

vim.filetype.add { extension = { templ = 'templ' } }

lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.elixirls.setup {
  cmd = { 'elixir-ls' },
  -- capabilities = lsp_capabilities,
}
lspconfig.emmet_ls.setup {
  filetypes = { 'astro', 'css', 'eruby', 'html', 'htmldjango', 'javascriptreact', 'less', 'pug', 'sass', 'scss', 'svelte', 'typescriptreact', 'vue', 'heex' },
}
lspconfig.nil_ls.setup {}
lspconfig.dockerls.setup {}
lspconfig.tsserver.setup {}
lspconfig.astro.setup {}
lspconfig.ruff_lsp.setup {}
lspconfig.pyright.setup {}
lspconfig.cssls.setup {}
lspconfig.svelte.setup {}
lspconfig.hls.setup {}
lspconfig.elmls.setup {}
lspconfig.yamlls.setup {}
lspconfig.fennel_ls.setup {}
lspconfig.crystalline.setup {}
lspconfig.terraformls.setup {}

lspconfig.html.setup {
  filetypes = { 'html', 'htmldjango', 'templ', 'heex' },
}

lspconfig.htmx.setup {
  filetypes = { 'html', 'htmldjango', 'templ' },
}

lspconfig.tailwindcss.setup {
  filetypes = { 'html', 'htmldjango', 'templ', 'javascript', 'typescript', 'astro', 'heex' },
  init_options = {
    userLanguages = {
      templ = 'html',
      heex = 'html-eex',
    },
  },
}
