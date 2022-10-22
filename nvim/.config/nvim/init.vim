set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-system-copy'
Plug 'benjiemc/vim-draw', { 'do': './install.sh' }
call plug#end()

lua require('settings')
lua require('maps')
lua require('appearance') 

set rtp+=/usr/local/opt/fzf

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

 
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 
 
" Latex Settings
au BufNewFile,BufRead *.tex
    \ nnoremap <leader>c !:w !detex \| wc -w<CR> |
    \ set spell spelllang=en_ca |
    \ imap .<Space> .<CR>|
    \ imap ?<Space> ?<CR>|
    \ imap !<Space> !<CR>|
    \ set tw=119 |
    \ set colorcolumn=120 |
    \ highlight ColorColumn ctermbg=0 guibg=lightgrey

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

" Markdown Settings
au BufNewFile,BufRead *.md,*.rmd,*.Rmd
    \ set wrap |
    \ set tw=119 |
    \ set colorcolumn=120 |
    \ set spell spelllang=en_ca |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ nnoremap <leader>c !:w !Rscript -e "rmarkdown::render('%', quiet = TRUE)"<CR>

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


" TMUX Nav
let g:tmux_navigator_save_on_switch = 2
