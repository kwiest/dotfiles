"-------------------------------------------------------------------------------
" Vim configuration
" Template from Peepcode
" Lots taken from rtomayko's dotfiles (https://github.com/rtomayko/dotfiles
"-------------------------------------------------------------------------------

set nocompatible                        " vi IMPROVED
set encoding=utf-8
set backupdir=~/.vim/backup

"-------------------------------------------------------------------------------
" Autoload all plugins with Pathogen
" Package manager by Tim Pope
"-------------------------------------------------------------------------------

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"-------------------------------------------------------------------------------
" UI
"-------------------------------------------------------------------------------

syntax on                               " Syntax highlighting
filetype plugin indent on               " Filetype detection, and indentation

noremap <CR> :nohlsearch<cr>            " Clear the search with a carriage return after searching

set number                              " Display line numbers
set numberwidth=5                       " In case the file is REALLY long
set ruler                               " Display the cursor position
set ch=2                                " Command line height
set wildmenu                            " Command line completion
set nostartofline                       " Don't jump to the start of a line when scrolling
set showcmd                             " Display incomplete commands
set showmode                            " Always show the current mode
set backspace=indent,eol,start          " Smart backspacing

set t_Co=256                            " Use 256 colors
colorscheme ir_black                    " Color for gVim

"-------------------------------------------------------------------------------
" File Navigation
"-------------------------------------------------------------------------------
let mapleader=','                       " Map the leader key to ','

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>


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

"-------------------------------------------------------------------------------
" Tests
"-------------------------------------------------------------------------------
"
map <leader>t :call RunTestFile()<cr>   " Run tests for current file
map <leader>a :call RunTests('')<cr>    " Run all tests

function! SetTestFile()
    let t:kw_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously marked file
    let in_test_file = match(expand("%"), '\_spec.rb\$') != 1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:kw_test_file")
        return
    end
    call RunTests(t:kw_test_file . command_suffix)
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo

    if filereadable("script/test")
        exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
        exec ":!bundle exec rspec --color " . a:filename
    else
        exec ":!rspec --color " . a:filename
    end
endfunction
