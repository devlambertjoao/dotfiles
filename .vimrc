call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" ### Vim Configs Start ######################################################
filetype plugin on
set path+=**
set colorcolumn=80
set wildmenu
set wildignore+=**/node_modules/**
set nocompatible
set relativenumber
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set nobackup
set nowritebackup
set autoindent
set backspace=indent,eol,start 
syntax enable
set nowrap
set noswapfile
set nobackup
set nu
set updatetime=50
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set smartcase
set noshowmode
set encoding=UTF-8
set termguicolors
" ### Vim Configs End ########################################################

" ### Vim Shortcuts Start ####################################################
let mapleader = " "
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>= :vertical resize +10<CR> 
nnoremap <leader>- :vertical resize -10<CR> 
nnoremap <C-n> :wincmd v<CR>
nnoremap <C-t> :tabnew .<CR>
" ### Vim Shortcuts End ######################################################

" ### Find files using Git, or find in files using silver searcher
nnoremap ; :GFiles<CR> 
nnoremap <C-f> :Ag<CR>

" ### Tagbar
nmap <F8> :TagbarToggle<CR>

" ### NerdTree
let g:NERDTreeIgnore = ['^node_modules$', '^bin$', '^obj$']
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeShowHidden=1
:let g:NERDTreeWinSize=40

" ### Open nerdtree if file is not specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ### Vim fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :G<CR>

" ### Identguide for show ident
let g:indentLine_char = '┊'

" ### Coc.nvim Configs Start #################################################
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf :CocFix<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

set shortmess+=c

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-angular',
  \ 'coc-css',
  \ 'coc-java',
  \ 'coc-omnisharp',
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" For .NET 
nmap <silent> <C-g>d :OmniSharpGotoDefinition<CR>

" ### Coc.nvim Configs End ###################################################

" ### Colorscheme
colorscheme PerfectDark
set bg=dark

" ### Virairline Configs Start ###############################################
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
" ### Virairline Configs End #################################################

" ### Multiple Cursors Config Start ##########################################
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" ### Multiple Cursors Configs End ############################################

