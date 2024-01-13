"====================================================================================
"                          VIM SETTINGS
"====================================================================================
"
"Basic setup
"-------------
filetype on
filetype plugin on
filetype plugin indent on
syntax on
set rnu
set number

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup
set nowrap

set showcmd "show partial command
set showmode "show mode on last line
set showmatch "show matching words during search

set wildmenu "autocomplete on TAB
set wildmode=list:longest " make wildmenu similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,".gif,*.pdf,*.pyc,*.exe,*.xlsx

"
" Key maps
"-------------------------------------------
nnoremap <C-p> :Files<Cr>

" GUI
" -----------------------
:set guioptions-=m "remove menu bar
:set guioptions-=T "remove toolbar
:set guioptions-=r "remove right-hand scroll bar
:set guioptions-=L "remove left-hand scroll bar

" Font settings
if has("gui_running")
    if has("gui_gtk2")
        set guifont=iosevka\ Mono:h14
    elseif has("gui_win32")
        set guifont=Iosevka\ Medium:h14
        :set lines=999 columns=999
    endif
endif

"    Plugins
"    --------
" Vim Plug
"---------------------------------
call plug#begin()

Plug 'morhetz/gruvbox'

" Zig
Plug 'ziglang/zig.vim'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"Autocomplete
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif


call plug#end()

" Vundle
" -----------------------------------
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

colorscheme gruvbox

"   Pathogen
"   -----------------
execute pathogen#infect()

" C/C++ Language server
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


set encoding=utf-8
set t_Co=256
set termguicolors
