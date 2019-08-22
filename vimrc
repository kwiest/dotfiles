set nocompatible
filetype plugin indent on
syntax enable
colorscheme zenburn

" Set leader key to ','
let mapleader=","

set number
set ruler
set ch=2
set showmode
set encoding=utf-8

" Packages
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Utils
call minpac#add('dense-analysis/ale')
call minpac#add('ervandew/supertab')
call minpac#add('itchyny/lightline.vim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('scrooloose/nerdtree')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')

call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('Shougo/denite.nvim')
let g:deoplete#enable_at_startup = 1

" Fuzzy file search
call minpac#add('junegunn/fzf.vim')
set rtp+=/usr/local/opt/fzf

" HTML/CSS
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('slim-template/vim-slim')

" Ruby/Rails
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-rails')
call minpac#add('vim-ruby/vim-ruby')

" Javascript/Typescript
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('mhartington/nvim-typescript', {'do': './install.sh'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Set exeburent ctags dir
set tags=./tags;

" Highlight trailing whitespace and spaces before a tab
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Highlight all tabs :-(
set list
set listchars=tab:▸\

set backspace=indent,eol,start

set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set tw=80
set colorcolumn=+1
set nowrap

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Remove highlights with Enter
nmap <CR> :nohlsearch<cr>

" Toggle NERDTree File Explorer
map <leader>q :NERDTreeToggle<CR>

" fzf Fuzzy finder
map <leader>f :Files<CR>

" Use system clipboard for copy/paste
set clipboard=unnamed

" Autocompletion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Create dirs for backup/swap if they don't already exist
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
endif

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif

set backup
set backupdir^=~/.vim/backup//
set directory+=~/.vim/swap//

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

