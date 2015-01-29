"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author:  Eric Schmidt
"
" Sections:
"   -> Package Management
"   -> General
"   -> Colors and Fonts
"   -> Vim User Interface
"   -> Moving Around, Tabs and Buffers.
"   -> Status Line
"   -> Files
"   -> Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Package Managment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" CtrlP package
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" GitHub repos
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/Raimondi/delimitMate'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" PHP Syntax Check
map <C-B> :!php -l %<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set 256 color mode 
if &term == "xterm"
    set t_Co=256
endif

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press i to enter insert mode, and ii to exit  
imap ii <Esc>

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4"

set ai "Auto indent
set si "Smart indent

"delete trailing whitespace
map <leader>ws :%s/\s\+$// 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving Around, Tabs and Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Ctrlp mappings
let g:ctrlp_map = '<c-f>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %y\                                  "FileType
set statusline+=%4*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%5*\ col:%03c\                            "Colnr


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn back-up stuff off - use GIT
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
