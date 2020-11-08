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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " sudo pacman -S the_silver_searcher
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
call plug#end()

" Configurações Vim
filetype plugin on
set path+=**
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
set autoindent
set backspace=indent,eol,start 
syntax enable
set nowrap
set noswapfile
set nobackup
set nu
set updatetime=300
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set smartcase
set noshowmode
set encoding=UTF-8
set termguicolors

" Atalhos
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

" Busca de arquivos com fzf e silver search
nnoremap ; :GFiles<CR> 
nnoremap <C-f> :Ag<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NerdTree
let g:NERDTreeIgnore = ['^node_modules$']
" CTRL B para abrir
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusWithFlags = 1
:let g:NERDTreeWinSize=40

" Vim fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :G<CR>

" Identguide
let g:indentLine_char = '┊'

" Coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>. :CocFix<CR>

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-angular',
  \ 'coc-css',
  \ ]
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
set nobackup
set nowritebackup
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Colorscheme
colorscheme materialbox
set bg=dark

" Virairline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

