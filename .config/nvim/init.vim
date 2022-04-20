call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'omnisharp/omnisharp-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'alvan/vim-closetag'
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
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-j> <C-\><C-n><C-w>j
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
set completeopt=menu,menuone,noselect

" Scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <c-d> :call comfortable_motion#flick(150)<cr>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>

" Theme
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Identline Settings
let g:indentLine_char = ':'
autocmd FileType *.json let g:indentLine_setConceal = 0

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tokyonight'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ':'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [[ 'a', 'b', 'c'], ['x', 'z' ]]

" Tagbar
nmap <F8> :TagbarToggle<CR>

" FZF Settings
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Nerd Tree Settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CoC Settings
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_global_extensions = [
	\'coc-emmet', 
	\'coc-css', 
	\'coc-html', 
	\'coc-json', 
	\'coc-prettier', 
	\'coc-tsserver',
	\'coc-eslint',
	\'coc-styled-components',
	\'coc-tslint-plugin',
	\'coc-java',
	\'coc-omnisharp',
	\'coc-sh',
	\'coc-solargraph',
	\]

" Ctrl + space to auto completition
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

" Status line
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Auto close tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_shortcut = '>'

