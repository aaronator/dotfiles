call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
"Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'vim-scripts/SyntaxAttr.vim'
call plug#end()

" vim-solarized8
syntax on " enable text highlighting
colorscheme bright_lights
if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
hi Normal guibg=NONE
" vimw-airline
let g:airline_powerline_fonts = 1
" vim-airline-themes
let g:airline_theme='bright_lights'
" nerdtree
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
imap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && !exists("s:std_in") && filereadable(argv()[0]) | NERDTree | wincmd p | endif
" vim-gitgutter
set updatetime=100

" Folding
set foldenable
set foldcolumn=0
set foldlevel=20
set foldmethod=syntax

" Keybinds
nnoremap <space> za
nnoremap <expr> <C-space> foldclosed('.') != -1 ? 'zO' : 'zc'

" Spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
filetype plugin on
filetype indent on

" Other settings
set ruler
set so=7 " add 7 lines of vertical buffer to the cursor when navigating up/down
set number " enable line numbers in gutter
set cursorline
set backspace=2 " backspace over everything in insert mode (indent,eol,start)

set wildmenu
set lazyredraw

set autoread

set incsearch
set hlsearch

set modifiable

set hid " need to check this out more
set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Keep these around while modifying our vim colorscheme
"function! SyntaxItem()
"  return synIDattr(synID(line("."),col("."),1),"name")
"endfunction
"set statusline+=%{SyntaxItem()}

