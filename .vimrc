" Initializing these in vimrc.vim is too late
lang messages none
set langmenu=none

let mapleader = ","

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
