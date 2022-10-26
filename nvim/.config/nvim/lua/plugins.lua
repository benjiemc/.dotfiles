-- CTRL-P settings
ctrlp_user_command = { '.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard' }

-- TMUX Nav
tmux_navigator_save_on_switch = 2

return require('packer').startup(function(use)
    use { 'vim-scripts/indentpython.vim' }
    use { 'git@github.com:kien/ctrlp.vim.git' }
    use { 'vim-syntastic/syntastic' }
    use { 'nvie/vim-flake8' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'vim-airline/vim-airline' }
    use { 'vim-airline/vim-airline-themes' }
    use { 'pineapplegiant/spaceduck', branch = 'main' }
    use { 'lervag/vimtex' }
    use { 'ledger/vim-ledger' }
    use { 'christoomey/vim-tmux-navigator' }
    use { 'christoomey/vim-system-copy' }
    use { 'benjiemc/vim-draw', run = './install.sh' }
end) 