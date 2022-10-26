lua require('plugins')
lua require('settings')
lua require('maps')
lua require('appearance')

set rtp+=/usr/local/opt/fzf

if executable('rg')
    let g:rg_derive_root='true'
endif
