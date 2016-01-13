"   -----------------------------------
"   0.  GO AWAY VI, BE IMPROVED
"   -----------------------------------

set nocompatible
imap jj <Esc>

"   -----------------------------------
"   1.  VUNDLE PLUGINS
"   -----------------------------------

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on

"   -----------------------------------
"   2.  AIRLINE & THEME CONFIGURATION
"   -----------------------------------

    " Airline has integration support with tmuxline so the airline theme
    " specified here will also carry over to tmux.

let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set laststatus=2

syntax enable
set background=dark
set number
set t_Co=256

"   -----------------------------------
"   3.  WHITESPACE MANAGEMENT
"   -----------------------------------

autocmd BufWritePre * StripWhitespace  " strip trailing whitespace on save

set tabstop=4                          " tabs have a width of four
set shiftwidth=4                       " auto-indent width
set noexpandtab                        " tabs FTW!

    " I like to use tabs for semantic indentation and spaces for presentational
    " indentation. Unfortunately, in my experience, most editors do not
    " visually distinguish between tabs and spaces. It almost inevitable that
    " shared codebases that attempt to maintain this utopia get corrupted by
    " the mixture of tabs and spaces.
    "
    " I still use it though... ;)

let g:indentLine_char = '|'            " show indentation
set list lcs=tab:\|\                   " highlight tabs

autocmd FileType make set noexpandtab  " don't expand tabs in Makefiles

"   -----------------------------------
"   4.  COPY & PASTE BETWEEN VIMs
"   -----------------------------------

    " Copy and paste between vim instances via shared text file buffer.
    " Source: http://stackoverflow.com/a/11052783

vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
map <C-p> :r ~/.vimbuffer<CR>

"   -----------------------------------
"   5.  C++ SYNTAX HIGHLIGHTING
"   -----------------------------------

    " Enable optional options for the vim-cpp-enhanced-highlight plugin.
    " This plugin contains additional syntax highlighting for C++11/14, but
    " has some optional features disabled by default.
    "
    "   1. Highlight class scope
    "   2. Highlight template functions
    "
    " Note: C++ template syntax is notoriously difficult to parse, so don't
    " expect this feature to be perfect.

let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

