lua require('plugins')
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
