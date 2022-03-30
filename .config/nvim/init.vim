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
Plug 'kien/rainbow_parentheses.vim'
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'omnisharp/omnisharp-vim'
call plug#end()

" Editor Shortcuts
let mapleader = " "
noremap tt :tabnew .<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR>
nnoremap <leader>nv :wincmd v<CR>
nnoremap <leader>nw :wincmd S<CR>
nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Editor Settings
" colorscheme base16-default-dark
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile
set cmdheight=2
set updatetime=25
set shortmess+=c
set tabstop=2
set shiftwidth=2
set autoindent
set relativenumber
set nu
set nowrap
set pumheight=10
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

" Color Pairs Settings
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Identline Settings
let g:indentLine_char = ':'
autocmd FileType *.json let g:indentLine_setConceal = 0

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ':'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
inoremap <silent><expr> <c-space> coc#refresh()

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
