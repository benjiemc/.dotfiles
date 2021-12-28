" spacevspaceim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/indentpython.vim'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ledger/vim-ledger'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-system-copy'
call plug#end()
 
 
let mapleader = " "

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>t :botright terminal<Cr>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>f :FZF<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
 
syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck

hi Visual cterm=None ctermfg=None ctermbg=blue
hi Search ctermfg=red ctermbg=yellow

set encoding=utf-8
set number
set relativenumber
set nofoldenable
set nowrap
set incsearch
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set rtp+=/usr/local/opt/fzf
set backspace=indent,eol,start

if executable('rg')
    let g:rg_derive_root='true'
endif

au BufNewFile,BufRead *.py
    \ set textwidth=119 |
    \ set autoindent |
    \ set colorcolumn=120 |
    \ let python_highlight_all=1 |
    \ highlight ColorColumn ctermbg=0 guibg=lightgrey |
    \ let g:syntastic_python_checkers = ['pylint', 'flake8'] |
    \ set fileformat=unix

 
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 
 
" Latex Settings
au BufNewFile,BufRead *.tex
    \ nnoremap <leader>c !:w !detex \| wc -w<CR> |
    \ set spell spelllang=en_ca |
    \ set wrap

" For ledger
au BufNewFile,BufRead *.dat,*.ldg,*.ledger setf ledger | comp ledger
let g:ledger_maxwidth = 120
let g:ledger_fold_blanks = 1
function LedgerSort()
    :%! ledger -f - print --sort 'date, amount'
    :%LedgerAlign
endfunction
command LedgerSort call LedgerSort()

" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$', '*\.egg-info']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <silent> <F3> :NERDTreeToggle<CR>

function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction 

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" highlighting
set hlsearch

" highlight git merge conflicts
function! ConflictsHighlight() abort
    syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
    syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
    syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/
    highlight conflictStart ctermbg=red ctermfg=black
    highlight conflictMiddle ctermbg=blue ctermfg=black
    highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction

augroup MyColors
    autocmd!
    autocmd BufEnter * call ConflictsHighlight()
augroup END

" vimtex config
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

" TMUX Nav
let g:tmux_navigator_save_on_switch = 2

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
