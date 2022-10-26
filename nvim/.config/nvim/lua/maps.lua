local map = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<silent> gd', '<Plug>(coc-definition)', {})
map('n','<silent> gy', '<Plug>(coc-type-definition)', {})
map('n','<silent> gi', '<Plug>(coc-implementation)', {})
map('n','<silent> gr', '<Plug>(coc-references)', {})

map('n', '<leader>h', '<C-W><C-H>', {})
map('n', '<leader>l', '<C-W><C-L>', {})
map('n', '<leader>j', '<C-W><C-J>', {})
map('n', '<leader>k', '<C-W><C-K>', {})
map('n', '<leader>t', ':botright terminal<Cr>', {})
map('n', '<leader>+', ':vertical resize +5<CR>', {})
map('n', '<leader>-', ':vertical resize -5<CR>', {})
map('n', '<leader>ps', ':Rg<SPACE>', {})
map('n', '<leader>f', ':FZF<CR>', {})

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

map('v', 'J', ":m '>+1<CR>gv=gv", {})
map('v', 'K', ":m '<-2<CR>gv=gv", {})
