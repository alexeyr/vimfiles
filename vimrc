lang English_US

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

" Behave like Windows
source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode="" " except don't use Select mode, use Visual mode instead
set clipboard=unnamed

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

" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
" Change keys for visiting bookmarks
nnoremap ' `
nnoremap ` '

" j/k move by screen lines instead of file lines
nnoremap j gj
nnoremap k gk

" Save on focus loss
au FocusLost * :wa

" <esc> to remove highlighting! Huzzah!
:nnoremap <esc> :noh<return><esc>

let mapleader = ","

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" search for visually highlighted text
vmap // y/<C-R>"<CR>       

" Don't use Ex mode, use Q for formatting
map Q gq


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" current directory is always matching the
" content of the active window
set autochdir

" remember some stuff after quiting vim:
" marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" use console dialogs instead of popup
" dialogs for simple choices
set guioptions+=c

if has("gui_win32")       " NT Windows
    autocmd GUIEnter * :simalt ~x " Maximize
endif
