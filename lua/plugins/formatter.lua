return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local sources = {}
    sources[#sources + 1] = formatting.black

    if vim.fn.executable("djlint") == 1 then
      sources[#sources + 1] = formatting.djlint.with({
        command = "djlint",
        args = { "--reformat", "-" },
      })
    end

    sources[#sources + 1] = formatting.prettier
    sources[#sources + 1] = formatting.stylua
    sources[#sources + 1] = formatting.isort
    sources[#sources + 1] = diagnostics.flake8
    sources[#sources + 1] = formatting.nixfmt
    sources[#sources + 1] = code_actions.eslint_d

    null_ls.setup({
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
