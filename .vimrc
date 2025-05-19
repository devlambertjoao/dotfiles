set nocompatible
filetype off

set hidden          " opening new file hides current instead of closing
set nowrap          " switch off line wrapping
set tabstop=4       " Set tabs to 4 characaters wide
set shiftwidth=4    " Set indentation width to match tab
set expandtab       " Use spaces instead of actual hard tabs
set softtabstop=4   " Set the soft tab to match the hard tab width
set backspace=indent,eol,start  " Make bs work across line breaks etc
set autoindent      " Enable basic auto indentation
set copyindent      " Preserve manual indentation
set number
set relativenumber
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildmenu
set wildcharm=<Tab>	" Needed to open the wildmenu from shortcuts
"set clipboard=unnamed	" Use system clipboard, bonus copy/paste between local & SSH
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set ruler
set novisualbell
set noerrorbells
set lazyredraw
set laststatus=2
set cursorline
" set colorcolumn=85
set background=dark
set encoding=utf-8
set hidden                    " Allow buffer switching without saving
set nobackup                  " Don't create backup files
set nowritebackup             " Don't create a backup before overwriting a file
set noswapfile                " Don't use swap files
set autoread                  " Automatically reload changed files
set ttyfast                  " Faster redrawing
set lazyredraw               " Don’t redraw while executing macros


" netrw file browser settings
let g:netrw_banner=0		" Hide the directory banner
let g:netrw_liststyle=3		" 0=thin; 1=long; 2=wide; 3=tree

filetype plugin indent on
syntax on
" colorscheme koehler
" colorscheme desert
colorscheme lunaperche

" Map Ctrl+[hjkl] to navigate windows vim style
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Map Ctrl+[arrow] to navigate windows`
nnoremap <silent> <C-Left> <C-w>h
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l

" Increase/descrease window split size
if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
endif

" Pageup/down will scroll half-page and center the current line on the screen
nnoremap <silent> <PageUp> <C-U>zz
vnoremap <silent> <PageUp> <C-U>zz
inoremap <silent> <PageUp> <C-O><C-U><C-O>zz

nnoremap <silent> <PageDown> <C-D>zz
vnoremap <silent> <PageDown> <C-D>zz
inoremap <silent> <PageDown> <C-O><C-D><C-O>zz

let mapleader=";"

" Open netrw filebrowser in current window, with current file selected
nmap <leader>e :e .<CR>

" Quick save the current file
nmap <leader>w :w<CR>

" Clear search highlights
nmap <silent> <space> :noh<CR>

" Close buffer without affecting splits
nmap <leader>d :bprevious<CR>:bdelete #<CR>

" Easy buffer navigation
nmap <leader>n :bn<CR>
nmap <leader>p :bp<CR>
nmap <leader>b :buffer <Tab>

" Load vimrc
nmap <leader>v :e ~/.vimrc<CR>

