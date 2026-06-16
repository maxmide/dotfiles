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

"           Plugins
"--------------------------
"Vim Plug
"--------
call plug#begin()

Plug 'jiangmiao/auto-pairs'
"Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"Plug 'Raimondi/delimitMate'

call plug#end()

set background=dark
colorscheme onedark

set encoding=utf-8

highlight Normal ctermbg=none
highlight NonText ctermbg=none
