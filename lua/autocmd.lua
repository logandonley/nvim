vim.api.nvim_exec(
  [[
  autocmd BufRead,BufNewFile *.txt setlocal textwidth=90 colorcolumn=90
]],
  false
)
