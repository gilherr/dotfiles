" This must be first, because it changes other options as a side effect.
set nocompatible

set number relativenumber       " Both numbered lines and relative numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
"set visualbell                 " No sounds
set autoread                    " Reload files changed outside vim
set scrolloff=5                 " Bring search result to the middle of the screen
syntax on                       " Turn on syntax highlighting
set mouse=a                     " Enable mouse support in console
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""' " fzf with hidden files

" ================ Clipboard ==============
" test if clopboard available with :echo has('clipboard')
" if you get 0 - install vim-gtk (ubuntu) or gvim (arch)
set clipboard=unnamed           "Clipboard as default register

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Buffers ===========================

" set hidden  " Allow a buffer to stay unsaved in the background

" ================ Maps ===========================

"change leader to space
let mapleader = " "

"add new line below/above cursor and stay in normal mode
nnoremap <silent> zj o<Esc> 
nnoremap <silent> zk O<Esc>

" remove highlighting after you are done with the search
nnoremap <Leader><space> :noh<cr>

" fuzzy find - Ctrl+b to find buffer 
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-p> :Files<Cr>

" ================ Plugs ===========================

" Install vim-plug and all plugins if vim-plug not installed 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  Plug 'scrooloose/nerdtree'        "File Browser
  Plug 'vim-airline/vim-airline'    "Status Line
  Plug 'morhetz/gruvbox'            "ColorScheme
  Plug 'junegunn/fzf', { 'do': './install --bin' }  "FuzzyFinder
  Plug 'junegunn/fzf.vim'

call plug#end()

" close vim if only NERDtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ================ ColorScheme ===========================

colorscheme gruvbox
