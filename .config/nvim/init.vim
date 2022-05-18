call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tami5/lspsaga.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Auto pairs 
Plug 'cohama/lexima.vim'

" Theme
Plug 'ghifarit53/tokyonight-vim'

" FZF (Finder)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Comments
Plug 'tomtom/tcomment_vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
call plug#end()

" Editor Shortcuts
" New tab -> tt
" Next tab -> tn
" Close tab -> tc
" New window on side -> nv
" New window on bottom -> nw
" Navigante in windows using Ctrl + HJKL 

let mapleader = " "
noremap tt :tabnew .<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR>
nnoremap nv :wincmd v<CR>
nnoremap nw :wincmd S<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Editor Settings
set encoding=utf-8
set fileencodings=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile
set cmdheight=1
set updatetime=25
set shortmess+=c
set tabstop=2
set shiftwidth=2
set autoindent
set relativenumber
set nu
set nowrap
set pumheight=15
set ruler
filetype plugin on
syntax enable
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set clipboard=unnamedplus
set colorcolumn=100
set noshowmode
set background=dark
set cursorline
set termguicolors
set completeopt=menuone,noinsert,noselect

" Theme
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lexima.vim
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" LSP Mapping
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> ;f :lua vim.lsp.buf.formatting()<CR>

" Lspsaga Mapping
nnoremap <silent> ;gd :Lspsaga preview_definition<CR>
nnoremap <silent> ;gi :Lspsaga implementation<CR>
nnoremap <silent> ;gr :Lspsaga lsp_finder<CR>
nnoremap <silent> ;rn :Lspsaga rename<CR>
nnoremap <silent> ;ca :Lspsaga code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-U> <Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>
nnoremap <silent> <C-D> <Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>
autocmd CursorHold * silent! Lspsaga show_line_diagnostics
nnoremap <silent> ;dn :Lspsaga diagnostic_jump_next<CR>

lua << EOF
	-- Treesitter
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "bash", "c_sharp", "css", "dart", "dockerfile", "go", "html", "java", 
			"javascript", "json", "lua", "python", "ruby", "rust", "scss", "typescript", "vim", "vue", 
			"yaml" 
		},
	  highlight = {
	    enable = true,
	  },
		indent = {
			enable = true
		}
	}

	-- Lsp
	local nvim_lsp = require('lspconfig')
	local protocol = require('vim.lsp.protocol')
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local cmp = require'cmp'

	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		buf_set_keymap(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
		buf_set_keymap(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_command [[augroup Format]]
			vim.api.nvim_command [[autocmd! * <buffer>]]
			vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
			vim.api.nvim_command [[augroup END]]
		end

	end
	
	cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-f>'] = cmp.mapping.scroll_docs(-4),
      ['<C-b>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   	  ["<C-n>"] = cmp.mapping(function(fallback)
   	    if cmp.visible() then
   	      cmp.select_next_item()
   	    elseif vim.fn["vsnip#available"](1) == 1 then
   	      feedkey("<Plug>(vsnip-expand-or-jump)", "")
   	    elseif has_words_before() then
   	      cmp.complete()
   	    else
   	      fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
   	    end
   	  end, { "i", "s" }),
   	  ["<C-p>"] = cmp.mapping(function()
   	    if cmp.visible() then
   	      cmp.select_prev_item()
   	    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
   	      feedkey("<Plug>(vsnip-jump-prev)", "")
   	    end
   	  end, { "i", "s" }),
   	  }),
   	  sources = cmp.config.sources({
   	    { name = 'nvim_lsp' },
   	    { name = 'vsnip' }, 
   	  }, {
   	    { name = 'buffer' },
   	  })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Check for install new servers: 
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

	local nvim_lsp_handler = {
     ["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false
       }
    ),
	}

	nvim_lsp.tsserver.setup {
		on_attach = on_attach,
		handlers = nvim_lsp_handler,
		capabilities = capabilities,
		filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
		root_dir = function() return vim.loop.cwd() end
	}

	nvim_lsp.jdtls.setup {
		handlers = nvim_lsp_handler,
		capabilities = capabilities,
	}

	nvim_lsp.html.setup {
		handlers = nvim_lsp_handler,
		capabilities = capabilities,
		cmd = { "html-languageserver", "--stdio" },
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true
			}
		},
		settings = {}
	}

	nvim_lsp.omnisharp.setup {
		handlers = nvim_lsp_handler,
		capabilities = capabilities,
		cmd = { '/Users/lambert/Programs/omnisharp/run', "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) }
	}

	nvim_lsp.cssls.setup {
		handlers = nvim_lsp_handler,
	  capabilities = capabilities,
	}

	require('nvim-lsp-installer').setup {
		automatic_installation = true
	}

	-- Lualine 
	require('lualine').setup {
  	options = {
  	  icons_enabled = true,
  	  theme = 'auto',
  	  component_separators = { left = '', right = ''},
  	  section_separators = { left = '', right = ''},
  	  disabled_filetypes = {},
  	  always_divide_middle = true,
  	  globalstatus = false,
  	},
  	sections = {
  	  lualine_a = {'mode'},
  	  lualine_b = {'branch', 'diff', 'diagnostics'},
  	  lualine_c = {'filename'},
  	  lualine_x = {'encoding', 'fileformat', 'filetype'},
  	  lualine_y = {'progress'},
  	  lualine_z = {'location'}
  	},
  	inactive_sections = {
  	  lualine_a = {},
  	  lualine_b = {},
  	  lualine_c = {'filename'},
  	  lualine_x = {'location'},
  	  lualine_y = {},
  	  lualine_z = {}
  	},
  	tabline = {},
  	extensions = {}
	}

	-- lspsaga
	local saga = require'lspsaga'
	saga.init_lsp_saga {
		debug = false,
  	use_saga_diagnostic_sign = true,
  	-- diagnostic sign
  	error_sign = "",
  	warn_sign = "",
  	hint_sign = "",
  	infor_sign = "",
  	diagnostic_header_icon = "   ",
  	-- code action title icon
  	code_action_icon = " ",
  	code_action_prompt = {
  	  enable = false,
  	  sign = true,
  	  sign_priority = 40,
  	  virtual_text = false,
  	},
  	finder_definition_icon = "  ",
  	finder_reference_icon = "  ",
  	max_preview_lines = 10,
  	finder_action_keys = {
  	  open = "o",
  	  vsplit = "s",
  	  split = "i",
  	  quit = "q",
  	  scroll_down = "<C-F>",
  	  scroll_up = "<C-B>",
  	},
  	code_action_keys = {
  	  quit = "q",
  	  exec = "<CR>",
  	},
  	rename_action_keys = {
  	  quit = "<C-c>",
  	  exec = "<CR>",
  	},
  	definition_preview_icon = "  ",
  	border_style = "single",
  	rename_prompt_prefix = "➤",
  	rename_output_qflist = {
  	  enable = false,
  	  auto_open_qflist = false,
  	},
  	server_filetype_map = {},
  	diagnostic_prefix_format = "%d. ",
  	diagnostic_message_format = "%m %c",
  	highlight_prefix = false,
	}

EOF

