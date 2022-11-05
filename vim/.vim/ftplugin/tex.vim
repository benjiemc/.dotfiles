" Latex Settings
set spell spelllang=en_ca 
set tw=119
set colorcolumn=120

nnoremap <leader>c !:w !detex \| wc -w<CR>
imap .<Space> .<CR>
imap ?<Space> ?<CR>
imap !<Space> !<CR>

highlight ColorColumn ctermbg=0 guibg=lightgrey

" vimtex config
let g:vimtex_view_method = 'zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
