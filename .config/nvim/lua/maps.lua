local keymap = vim.keymap

vim.g.mapleader = ";"

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move between windows
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')

-- Resize windows
keymap.set('n', '<C-w><h>', '<C-w><')
keymap.set('n', '<C-w><l>', '<C-w>>')
keymap.set('n', '<C-w><k>', '<C-w>+')
keymap.set('n', '<C-w><j>', '<C-w>-')

-- Save and Close
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':bd<CR>')
