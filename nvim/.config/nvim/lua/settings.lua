vim.cmd 'syntax on'

local set = vim.opt

set.encoding = 'utf-8'
set.number = true
set.relativenumber = true
set.foldenable = false
set.wrap = false
set.incsearch = true
set.smartindent = true
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.errorbells = false

set.backupdir = os.getenv("HOME") .. '/.vim/backup'
set.directory = os.getenv("HOME") .. '/.vim/swap'
set.undodir = os.getenv("HOME") .. '/.vim/undo'
set.undofile = true

set.backspace = {'indent', 'eol', 'start'}
