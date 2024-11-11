-- This file can be loaded by calling `lua require ('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'godlygeek/tabular'
  use 'preservim/nerdcommenter'
  use 'ryanoasis/vim-devicons'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'nvim-lua/plenary.nvim'
  use 'mhinz/vim-signify'
  use 'fatih/vim-go'
  use 'danilamihailov/beacon.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'eandrju/cellular-automaton.nvim'
  use 'xiyaowong/nvim-transparent'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'sbdchd/neoformat'
  use 'sindrets/diffview.nvim'
  use 'dyng/ctrlsf.vim'
  use 'f-person/auto-dark-mode.nvim'
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.4', }
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
  use { 'j-hui/fidget.nvim', tag = 'v1.4.1' }
  use { 'lervag/vimtex', tag = 'v2.15' }
  use 'github/copilot.vim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },      -- Required
      { 'hrsh7th/cmp-nvim-lsp' },  -- Required
      { 'L3MON4D3/LuaSnip' },      -- Required
    }
  }

  -- Theme plugins
  use 'morhetz/gruvbox'
  use 'EdenEast/nightfox.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'sonph/onehalf', rtp = 'vim' }
end)
