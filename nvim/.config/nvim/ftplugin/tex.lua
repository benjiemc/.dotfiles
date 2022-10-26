local map = vim.api.nvim_set_keymap

vim.opt.tw = 119 
vim.opt.colorcolumn = '120'
vim.api.nvim_set_hl(0, 'ColorColumn', {ctermbg = 0, bg = 'lightgrey'})

map('i', '.<Space>', '.<CR>', {noremap = true})
map('i', '?<Space>', '?<CR>', {noremap = true})
map('i', '!<Space>', '!<CR>', {noremap = true})
map('n', '<leader>c', '!:w !detex | wc -w<CR>', {noremap = true})

vim.cmd 'set spell spelllang=en_ca'

-- vimtex config
vimtex_view_method = 'zathura'
tex_flavor = 'latex'
vimtex_quickfix_mode = 0
