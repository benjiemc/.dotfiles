augroup filetypedetect
au BufNewFile,BufRead *.js,*.html,*.css setf web
au BufNewFile,BufRead *.md,*.rmd,*.Rmd setf markdown
au BufNewFile,BufRead *.ldg,*.ledger setf ledger
augroup END
