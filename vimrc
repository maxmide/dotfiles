set nocompatible

filetype on
filetype plugin on
filetype plugin indent on
syntax on
set mouse=a
set rnu
set number

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup

set showcmd
set showmode
set showmatch

set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.pdf,*.pyc,*.xlsx

" Key Mpas
"============
nnoremap<c-p> :Files<Cr>


"           Plugins
"--------------------------
"Vim Plug
"--------
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'ziglang/zig.vim'

Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs' 

call plug#end()

set background=dark
colorscheme gruvbox

set encoding=utf-8
set t_co=256

"highlight Normal guibg=none
"highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
