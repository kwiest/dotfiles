"-------------------------------------------------------------------------------
" Vim configuration
" Template from Peepcode
" Lots taken from rtomayko's dotfiles (https://github.com/rtomayko/dotfiles
"-------------------------------------------------------------------------------

set nocompatible                        " vi IMPROVED
set encoding=utf-8

"-------------------------------------------------------------------------------
" Autoload all plugins with Pathogen
" Package manager by Tim Pope
"-------------------------------------------------------------------------------

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"-------------------------------------------------------------------------------
" UI
"-------------------------------------------------------------------------------

syntax enable                           " Syntax highlighting
filetype plugin indent on               " Filetype detection, and indentation

set number                              " Display line numbers
set numberwidth=5                       " In case the file is REALLY long
set ruler                               " Display the cursor position
set ch=2                                " Command line height
set wildmenu                            " Command line completion
set nostartofline                       " Don't jump to the start of a line when scrolling
set showcmd                             " Display incomplete commands
set showmode                            " Always show the current mode
set backspace=indent,eol,start          " Smart backspacing

set background=dark
colorscheme solarized                   " Color for gVim

"-------------------------------------------------------------------------------
" Text Formatting 
"-------------------------------------------------------------------------------

set autoindent                          " Automatic indents
set smartindent                         " Smart indents
set expandtab                           " Convert tabs to spaces
set tabstop=4                           " Tabs should be 4 spaces
set shiftwidth=4                        " Indent with 4 spaces too
set nowrap                              " Do not allow line wrap

"-------------------------------------------------------------------------------
" Visual Cues 
"-------------------------------------------------------------------------------

set showmatch                           " Show matching bracket/brace
set ignorecase                          " Ignore case while searching
set incsearch                           " Highlight search matches as you type
set hlsearch                            " Highlight search matches
set visualbell                          " Don't beep at me!

set wrap                                " Allow line-wrapping

set cursorline                          " Highlight the current line
hi CursorLine cterm=NONE ctermbg=black  
autocmd VimEnter * NERDTree             " Autostart NERDTree
autocmd VimEnter * wincmd p

let mapleader=','                       " Map the leader key to ','
