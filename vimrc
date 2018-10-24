set nocompatible
set encoding=utf-8

" Set for Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle dependency management
Plugin 'VundleVim/Vundle.vim'

" Snipmate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

" Snipmate snippets
Plugin 'garbas/vim-snipmate'

" Ruby/Rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-endwise'

" Ale language server for Rubocop
Plugin 'w0rp/ale'

" Slim templating
Plugin 'slim-template/vim-slim.git'

" SCSS
Plugin 'cakebaker/scss-syntax.vim'

" Comment/uncomment lines
Plugin 'tomtom/tcomment_vim'

" Surround text
Plugin 'tpope/vim-surround'

" Auto pair for {, [, (
Plugin 'jiangmiao/auto-pairs'

" Tab completions
Plugin 'ervandew/supertab'

" NerdTree navigation
Plugin 'scrooloose/nerdtree'

" Ctrl-P fuzzy search
Plugin 'ctrlp/ctrlp.vim'

" Tests
Plugin 'janko-m/vim-test'

call vundle#end()
filetype plugin indent on

" Set exeburent ctags dir
set tags=./tags;

syntax on
syntax enable

" Highlight trailing whitespace and spaces before a tab
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Set leader key to ','
let mapleader=","

set number
set ruler
set ch=2
set showmode

set nostartofline
set backspace=indent,eol,start

set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set tw=80
set nowrap

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Remove highlights with Enter
nmap <CR> :nohlsearch<cr>

" Testing
map <Leader>c :call <CR>
nmap <silent> <leader>tf :TestFile<CR>   " ,tf to test current file
nmap <silent> <leader>s :TestNearest<CR> " ,tl to test current line
map <leader>t :A<CR>                     " ,t to jump to test file
map <leader>r :r<CR>

" Toggle NERDTree File Explorer
map <leader>q :NERDTreeToggle<CR>

" Use system clipboard for copy/paste
set clipboard=unnamed

" Autocompletion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Backup TMP files
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
endif

set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save .swp files someplace better than current directory
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif

set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores previous editing session
set viminfo+=n~/.vim/viminfo

if exists('+undofile')
  " undofile - this allows you to undo even after exiting and re-starting
  " This, like .swp and .backup uses .vim-undo first, then ~/.vim/undo
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

