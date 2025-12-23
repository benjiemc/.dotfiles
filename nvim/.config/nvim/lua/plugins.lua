-- vimtex config
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_quickfix_mode = 0

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use { 'vim-scripts/indentpython.vim' }
    use { 'vim-syntastic/syntastic' }
    use { 'nvie/vim-flake8' }
    use { 'neovim/nvim-lspconfig' }
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
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end) 
