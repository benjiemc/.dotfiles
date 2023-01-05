vim.g.mapleader = ' '

-- General
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Movement
vim.keymap.set('n', '<leader>h', '<C-W><C-H>')
vim.keymap.set('n', '<leader>l', '<C-W><C-L>')
vim.keymap.set('n', '<leader>j', '<C-W><C-J>')
vim.keymap.set('n', '<leader>k', '<C-W><C-K>')
vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>')
vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>')

-- Telescope keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

