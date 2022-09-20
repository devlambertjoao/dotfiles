local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Plugins Here
  -- Packer
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lsp' -- Lsp
  use 'williamboman/mason.nvim' -- LSP Installer
  use 'williamboman/mason-lspconfig.nvim' -- LSP Installer Config
  use 'neovim/nvim-lspconfig' -- Lsp Config  
  use 'hrsh7th/nvim-cmp' -- Completition
  use 'hrsh7th/cmp-nvim-lsp' -- Source for native lsp completition
  use 'hrsh7th/cmp-buffer' -- Buffer completition
  use 'hrsh7th/cmp-path' -- Path completition
  use 'hrsh7th/cmp-cmdline' -- Cmdline completition
  use 'hrsh7th/cmp-vsnip' -- Snipets
  use 'hrsh7th/vim-vsnip' -- Snipets
  use 'nvim-lua/plenary.nvim' -- Utils

  -- LSP UI
  use 'onsails/lspkind.nvim' -- Better view on pum completion like vs-code
  use 'ray-x/lsp_signature.nvim' -- Show methods params when typing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Treesitter
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'norcalli/nvim-colorizer.lua' -- Colorizers for hex, rgb...

  -- Theme
  use {
    'sainnhe/gruvbox-material',
    config = function()
      vim.cmd('colorscheme gruvbox-material')
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_better_performance = 1
    end
  }

  -- File Navigation
  use 'kyazdani42/nvim-tree.lua' -- Sidebar File Viewer
  use 'nvim-telescope/telescope.nvim' -- Find Files
  use 'lewis6991/gitsigns.nvim' -- Git Integration with signs
  use 'kdheepak/lazygit.nvim' -- Git UI

  -- Autopairs
  use 'windwp/nvim-autopairs' -- Autopairs
  use 'windwp/nvim-ts-autotag' -- Autopairs

  -- Neovim UI
  use 'nvim-lualine/lualine.nvim' -- Lua Line
  use 'akinsho/bufferline.nvim' -- Buffer Line
  use 'petertriho/nvim-scrollbar' -- Scrollbar
  use 'kevinhwang91/nvim-hlslens' -- Better Search engine
  use 'xiyaowong/nvim-transparent' -- Let Neovim Transparent
  use 'karb94/neoscroll.nvim' -- Smooth Scrolling

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
