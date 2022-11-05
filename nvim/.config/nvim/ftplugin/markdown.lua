local set = vim.opt
local map = vim.api.nvim_set_keymap

set.wrap = true
set.tw = 119
set.colorcolumn = '120'
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

vim.api.nvim_set_hl(0, 'ColorColumn', {ctermbg = 0, bg = 'lightgrey'})

vim.cmd 'set spell spelllang=en_ca'
