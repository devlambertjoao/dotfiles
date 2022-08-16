local status, diffview = pcall(require, "diffview")
if (not status) then return end

diffview.setup { }

vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<CR>', buf_opts)
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>', buf_opts)
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory<CR>', buf_opts)
vim.keymap.set('n', '<leader>gl.', '<cmd>DiffviewFileHistory %<CR>', buf_opts)
