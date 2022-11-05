set wrap
set tw=119
set colorcolumn=120
set spell spelllang=en_ca
set tabstop=2
set softtabstop=2
set shiftwidth=2

nnoremap <leader>c !:w !Rscript -e "rmarkdown::render('%', quiet = TRUE)"<CR>
