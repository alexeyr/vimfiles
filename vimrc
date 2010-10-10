lang English_US

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

" tab options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
au FileType crontab,fstab,make set noexpandtab

" set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" search options
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:··

" j/k move by screen lines instead of file lines
nnoremap j gj
nnoremap k gk

" Save on focus loss
au FocusLost * :wa

" Behave like Windows
source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode="" " except don't use Select mode, use Visual mode instead
set clipboard=unnamed

let mapleader = ","

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
