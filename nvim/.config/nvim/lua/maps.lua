vim.g.mapleader = ' '

-- General
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Movement
vim.keymap.set('n', '<leader>h', '<C-W><C-H>')
vim.keymap.set('n', '<leader>l', '<C-W><C-L>')
vim.keymap.set('n', '<leader>j', '<C-W><C-J>')
vim.keymap.set('n', '<leader>k', '<C-W><C-K>')
vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>')
vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>')
