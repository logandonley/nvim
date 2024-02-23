vim.keymap.set('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- Tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Prev tab' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = 'New tab' })
