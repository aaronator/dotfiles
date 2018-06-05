call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'edkolev/tmuxline.vim'
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
let g:airline_theme='bubblegum'
" nerdtree
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
imap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && !exists("s:std_in") && filereadable(argv()[0]) | NERDTree | wincmd p | endif
" vim-gitgutter
set updatetime=100

" Spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Other settings
set number " enable line numbers in gutter
set cursorline
set backspace=2 " backspace over everything in insert mode (indent,eol,start)

filetype on
filetype plugin indent on

" Keep these around while modifying our vim colorscheme
"function! SyntaxItem()
"  return synIDattr(synID(line("."),col("."),1),"name")
"endfunction
"set statusline+=%{SyntaxItem()}
