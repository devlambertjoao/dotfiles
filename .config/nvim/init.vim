call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'yggdroot/indentline'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'yggdroot/indentline'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'janko-m/vim-test'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

"" COMMANDS
" CTRL + WW: change window
" CTRL + b: open or close nerd tree
" CTRL + H or L: navigate between windows inside vim 
" CTRL + p: open fzf and find files
" CTRL + f: open fzf and find inside files
" F8 Tagbar toggle
" Space q: Close file
" Space w: Save file
" Space wq: Save and close file
" Space nv: New window on side
" Space nw: New window bellow
" Space =: Vertical Resize +
" Space -: Vertical Resize -
" / to search in file -> Enter -> n to next match -> N to previous match
" Space enter to clean highlight of search
" q + letter or number to start a macro recording, and q to stop macro. Use @ + letter to run macro

" In visual mode
" gc for comment block

" In normal mode
" gd go to definition 
" gi go to implementation
" gr go to references
" gf fix errors
" rn for rename
" tt: New tab
" tn: Next tab
" tp: Previous tab
" tc: Close tab ff for format file using prettier
" gcc for comment this line

" Git commands
" Space gd: diff file 
" Space gc: git commit
" Space gc: git push
" Space gs: git status
" Space gl: git log
" Space gaa: git add .

" Rails
" Space rwu: :RuboCop -a
" Space tn: Run test nearest of cursor
" Space tf: Run test on file
" Space ta: Test all project
" Space tl: Run last test

" Editor configs
"" Indent and line configs
set tabstop=2
set shiftwidth=2
set autoindent
set relativenumber
set nu
set nowrap
set cursorline
set pumheight=10
set ruler

"" Remove file backup and swapfile
set nobackup
set nowritebackup
set noswapfile
"" Filetype works 
filetype plugin on
syntax enable
"" Better autocomplete
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
"" Better performance
set updatetime=25
"" Better interface and theme
set encoding=UTF-8
set termguicolors
set noshowmode
colorscheme solarized8_dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let g:indentLine_char = '|'
"" Search ignore case sensitivity 
set ignorecase
"" Better handling comments (Not continue on new line)
set formatoptions-=cro
"" Copy and paste between everthing else
set clipboard=unnamedplus
""
set colorcolumn=100

"Editor shortcuts
let mapleader = " " 
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>nv :wincmd v<CR>
nnoremap <leader>nw :wincmd S<CR>
nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap tt :tabnew .<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR>

" Navigate between windows inside vim
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Clean search highlight
nmap <Leader><CR> :nohlsearch<CR>

" Configure NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" FZF For find files configuration
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Coc for autocomplete and intellisense configuration
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf :CocFix<CR>
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> ff :CocCommand prettier.formatFile<CR>

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

autocmd CursorHold * silent call CocActionAsync('highlight')

" Tagbar configuration 
nmap <F8> :TagbarToggle<CR>

" Vim airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='atomic'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Auto close tags configuration
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*jsx,*tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'

" Vim fugitive
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gc :Git push<CR>
nmap <leader>gs :Git<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gaa :!git add .<CR>i

" Rails 
nmap <leader>rwu :RuboCop -a<CR>
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ta :TestSuite<CR>
map <Leader>tl :TestLast<CR>

" Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", '~/.config/nvim']
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
nnoremap <silent> <C-s> :Snippets<CR>
