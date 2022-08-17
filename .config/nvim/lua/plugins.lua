local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Plugins Here
  -- Packer
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lsp' -- Lsp
  use 'neovim/nvim-lspconfig' -- Lsp Config  
  use 'hrsh7th/nvim-cmp' -- Completition
  use 'hrsh7th/cmp-nvim-lsp' -- Source for native lsp completition
  use 'hrsh7th/cmp-buffer' -- Buffer completition
  use 'hrsh7th/cmp-path' -- Path completition
  use 'hrsh7th/cmp-cmdline' -- Cmdline completition
  use 'hrsh7th/cmp-vsnip' -- Snipets
  use 'hrsh7th/vim-vsnip' -- Snipets
  use 'nvim-lua/plenary.nvim' -- Utils
  use 'MunifTanjim/prettier.nvim'

  -- LSP UI
  use 'onsails/lspkind.nvim' -- Better view on pum completion like vs-code
  use 'glepnir/lspsaga.nvim' -- LSP Better UI
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Treesitter
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'folke/tokyonight.nvim' -- Tokyonight theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  } -- Neosolarized
  use 'norcalli/nvim-colorizer.lua' -- Colorizers for hex, rgb...

  -- File Navigation
  use 'kyazdani42/nvim-tree.lua' -- Sidebar File Viewer
  use 'nvim-telescope/telescope.nvim' -- Find Files
  use 'lewis6991/gitsigns.nvim' -- Git Integration with signs
  use 'sindrets/diffview.nvim' -- Git Diffview

  -- Autopairs
  use 'windwp/nvim-autopairs' -- Autopairs
  use 'windwp/nvim-ts-autotag' -- Autopairs

  -- Neovim UI
  use 'nvim-lualine/lualine.nvim' -- Lua Line
  use 'SmiteshP/nvim-gps' -- Lua Line Breadcrumbs
  use 'akinsho/bufferline.nvim' -- Buffer Line
  use 'petertriho/nvim-scrollbar' -- Scrollbar
  use 'kevinhwang91/nvim-hlslens' -- Better Search engine
  use 'tomtom/tcomment_vim' -- Comment lines and code blocks


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


