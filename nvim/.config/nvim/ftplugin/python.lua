local set = vim.opt
set.autoindent = true
set.fileformat = unix

set.textwidth = 119
set.colorcolumn = '120'
vim.api.nvim_set_hl(0, 'ColorColumn', {ctermbg = 0, bg = 'lightgrey'})

python_highlight_all = 1 
syntastic_python_checkers = {'pylint', 'flake8'}
