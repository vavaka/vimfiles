"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"setup settings after activating pathogen
filetype plugin on
filetype indent on
syntax on

"setup swp
set nobackup "do not keep backup files, it's 70's style cluttering
set noswapfile "do not write annoying intermediate swap files
set backupdir=~/.vim/.tmp,~/tmp,/tmp "store backup files in one of these directories (in case swapfile is ever turned on)
set directory=~/.vim/.tmp,~/tmp,/tmp "store swap files in one of these directories (in case swapfile is ever turned on)

if has("gui_running")
    set lines=999 columns=999

    set encoding=utf-8 "set default encoding
    set guifont=DejaVu\ Sans\ Mono\ 10 "set font

    "remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    colorscheme molokai
else
    set termencoding=utf-8 "set default encoding

    set t_Co=256 "tell the term has 256 colors

    colorscheme molokai
endif

set history=1000 "store lots of :cmdline history

set ruler "show the line and column number of the cursor position
set number "show line numbers
set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom set hidden "hide buffers when not displayed

set cmdheight=2 "set status bar height

"undo settings
if v:version >= 703
    set undofile
    set undodir=~/.vim/undofiles
endif
set undolevels=1000 "use many muchos levels of undo

"setup line wrap settihngs
set wrap! "dont wrap lines
set linebreak "wrap lines at convenient points

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set virtualedit=all "move to the last character in the line, not past it

"setup incremental search settings
set incsearch "find the next match as we type the search
set hlsearch "highlight searches by default
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

"setup indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"srtup folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

set wildmode=list:longest "make cmdline tab completion similar to bash
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O
au filetype vim set formatoptions-=o "somehow, during vim filetype detection, this gets set for vim files, so explicitly unset it again
set fo+=cr "fix <Enter> for comment

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"hide buffers when not displayed
set hidden

"turn off matching parenthesis, brackets, braces
let g:loaded_matchparen=1

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"highlight insert mode
autocmd InsertEnter * set cursorline
autocmd InsertEnter * highlight StatusLine guibg=#5E3140
autocmd InsertLeave * set nocursorline
autocmd InsertLeave * highlight StatusLine guibg=#1E392D

" При нажатии q: подсвечивать statusline темно-зеленым
autocmd CmdwinEnter * highlight StatusLine ctermbg=22
autocmd CmdwinLeave * highlight StatusLine ctermbg=236

"mappings for window navigation
nmap <C-S-h> <C-W>h
nmap <C-S-j> <C-W>j
nmap <C-S-k> <C-W>k
nmap <C-S-l> <C-W>l

"mappings for changing widnow size
nmap + <c-w>+
nmap - <c-w>-
nmap <c-m> <c-w><
nmap <c-n> <c-w>>


"mappings for completion
imap <C-Space> <C-X><C-O>

"turn off Vim's crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

"speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"mappings for search and replace of selected text
vmap / y/<C-R>"<CR>
vmap s y:%s/<C-R>"//gc<LEFT><LEFT><LEFT>

"mappings to make "Y"  work from the cursor to the end of line (which is more logical, but not Vi-compatible)
map Y y$

"mappings for quickly get out of insert mode without your fingers having to leave the home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>

"mappings for sudo to write
cmap w!! w !sudo tee % >/dev/null

"mappings for run ack fast
nnoremap <leader>a :Ack<Space>

"mappings to insert empty lines
nmap <leader>o o<esc>
nmap <leader>O O<esc>

augroup ruby_files "{{{
    au!
    autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup end " }}}
