lang messages none
set langmenu=none

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Pathogen. See http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
filetype plugin indent on

set nocompatible

set modelines=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behave like Windows 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode="" " except don't use Select mode, use Visual mode instead
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " Replace tabs by spaces
set smarttab " <tab> inserts <shiftwidth> spaces in beginning of line
au FileType crontab,fstab,make set noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent " Automatically set the indent of a new line (local to buffer)
set smartindent " smartindent (local to buffer)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor highlights 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline " Highlight selected line
"set cursorcolumn " Highlight selected column

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " Highlight search results
set incsearch " Incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
" <esc> to remove highlighting! Huzzah!
nnoremap <esc> :noh<return><esc>

" Only letters, numbers, and underscore are treated as literals in regexes
nnoremap / /\v
vnoremap / /\v

set gdefault " replace global by default, add /g to replace first match only

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket matching 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " Highlight matching char when cursor goes over a bracket/quote/...
" Allow use of <tab> to go to matching char
"nnoremap <tab> %
"vnoremap <tab> %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert New Line 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Wrapping 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nowrap
"set linebreak " Wrap at word
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text width 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=79
set formatoptions=qrcn1
"set colorcolumn=85

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight tabs and trailing spaces 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:��
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

map <leader>p <C-^> " Go to previous file

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

" use console dialogs instead of popup dialogs for simple choices
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni completion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line completion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu " Show a list of possible completions when pressing <tab>/C-p/C-n
set wildmode=list:longest " And complete to longest common prefix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Error window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Always show status line
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,utf-16,cp1251,koi8-r,cp866 " Select encoding
set scrolloff=3 " Keep this number of lines below and above cursor
set showmode " If in Insert, Replace or Visual mode put a message on command line
set showcmd " Show (partial) command in the last line of the screen
set hidden " When abandoning a buffer it's hidden, not closed
set visualbell " Use visual bell on error instead of beeping
set ttyfast " More characters will be sent to the screen for redrawing
set ruler " Show the line and column number of the cursor position in status line
set backspace=indent,eol,start " Allow sane backspacing
" Show line numbers relative to cursor line (v. useful for movement commands)
if has('relativenumber')
    set relativenumber 
elseif has('number')
    set number
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !filewritable($TEMP."/vim/")
    silent execute '!mkdir "'.$TEMP.'/vim"'
endif

if v:version >= 703
    set undofile " Store undo info in a separate line, so it survives opening/closing
    set undodir=$TEMP/vim//
endif

set backup
set backupdir=$TEMP/vim//

color inkpot " Color scheme

" -----------------------------------------------------------------------------
" | Plug-ins |
" -----------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExpl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplorerMoreThanOne = 2

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

" -----------------------------------------------------------------------------
" | Host specific |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
