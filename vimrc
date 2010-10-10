" down with Russian translation! Do this at the beginning
lang messages none
set langmenu=none

" Use Pathogen. See http://stevelosh.com/blog/2010/09/coming-home-to-vim/
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

" Behave like Windows *********************************************************
source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode="" " except don't use Select mode, use Visual mode instead
set clipboard=unnamed

" Tab Options *****************************************************************
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " Replace tabs by spaces
set smarttab " <tab> inserts <shiftwidth> spaces in beginning of line
au FileType crontab,fstab,make set noexpandtab

" Indenting *******************************************************************
set autoindent " Automatically set the indent of a new line (local to buffer)
set smartindent " smartindent (local to buffer)

" Cursor highlights ***********************************************************
set cursorline " Highlight selected line
"set cursorcolumn " Highlight selected column

set fencs=utf-8,cp1251,koi8-r,utf-16,cp866
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" Searching *******************************************************************
set hlsearch " Highlight search results
set incsearch " Incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
" <esc> to remove highlighting! Huzzah!
nnoremap <esc> :noh<return><esc>

" Regexes *******************************************************************
set gdefault " global replace by default, add /g to replace first match only
" Always use perl-compatible replace syntax
nnoremap / /\v
vnoremap / /\v
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Line Wrapping ***************************************************************
"set nowrap
"set linebreak " Wrap at word
set wrap

" Text width ******************************************************************
set textwidth=79
set formatoptions=qrcn1
"set colorcolumn=85

" Highlight tabs and trailing spaces ******************************************
set listchars=tab:··
set list
"highlight LeadingTab ctermbg=lightblue guibg=lightblue
highlight EvilSpace ctermbg=darkred guibg=darkred
au Syntax * syn match LeadingTab /^\t\+/
au Syntax * syn match LeadingSpace /^\ \+/
au Syntax * syn match EvilSpace /\(^\t*\)\@<!\t\+/ " tabs not preceeded by tabs
au Syntax * syn match EvilSpace /[ \t]\+$/ " trailing space

" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.exe
" Change keys for visiting bookmarks
nnoremap ' `
nnoremap ` '

" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

map <Leader>p <C-^> " Go to previous file

" Ctrl+Movement moves to corresponding window
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Save on focus loss
au FocusLost * :wa

let mapleader = ","

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

" current directory always matches the content of the active window
set autochdir

" remember some stuff after quiting vim:
" marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" use console dialogs instead of popup
" dialogs for simple choices
set guioptions+=c

if has("gui") 
	" Set font
	if has("win32")
		set guifont=Consolas:h10:cRUSSIAN
	elseif has("gui_gtk2")
		set guifont=Terminus \10
	elseif has("gui_kde")
		set guifont=Terminus\ /10/-1/5/50/0/0/0/1/0
	elseif has("gui_macvim")
		set guifont=Monaco:h10
	endif

	" Maximize
	if has("win32") 
		au GUIEnter * :simalt ~x 
	elseif has("gui_gtk2")
		au GUIEnter * :set lines=99999 columns=99999
	elseif has("gui_macvim")
		au GUIEnter * :set fuoptions=maxvert,maxhorz
	endif
endif


" -----------------------------------------------------------------------------
" | Plug-ins |
" -----------------------------------------------------------------------------

