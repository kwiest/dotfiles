set nocompatible                        " vi IMPROVED
set encoding=utf-8

silent! call pathogen#runttime_append_all_bundles()

set number                              " Display line numbers
set ruler                               " Display the cursor position

set showcmd                             " Display incomplete commands
set showmode                            " Always show the current mode

set backspace=indent,eol,start          " Smart backspacing

syntax enable                           " Syntax highlighting
filetype plugin indent on               " Filetype detection, and indentation

set wildmenu                            " Command line completion

set ignorecase                          " Ignore case while searching
set incsearch                           " Highlight search matches as you type
set hlsearch                            " Highlight search matches

set wrap                                " Allow line-wrapping

set autoindent                          " Automatic indents
set smartindent                         " Smart indents
set expandtab                           " Convert tabs to spaces

map <leader>nt :NERDTree                " NERDTree shortuct
