" This must be first, because it changes other options as a side effect.
set nocompatible

"change leader to space
let mapleader = " "

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
  Plug 'tpope/vim-surround'             "surroind stuff
  Plug 'yuttie/comfortable-motion.vim'  "smooth scrolling

  " Python
  Plug 'vim-scripts/indentpython.vim'

  " Colors
  Plug 'tomasr/molokai'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'morhetz/gruvbox'
  Plug 'AlessandroYorba/Despacio'
  Plug 'cocopon/iceberg.vim'
  Plug 'w0ng/vim-hybrid'
  Plug 'nightsense/snow'
  Plug 'nightsense/stellarized'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jnurmine/Zenburn'

call plug#end()

" ================ Plugs: NERDTREE ===========================

"" close vim if only NERDtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0

nnoremap <leader>n :NERDTreeToggle<CR>

" ================ Plugs: FZF ===========================

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
nnoremap <silent> <Leader>m        :Marks<CR>

" ================ Misc ==============

syntax on                       " Turn on syntax highlighting
set number relativenumber       " Both numbered lines and relative numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set scrolloff=5                 " Bring search result to the middle of the screen
set mouse=a                     " Enable mouse support in console
"set visualbell                 " No sounds
set encoding=utf-8
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

set hidden  " Allow a buffer to stay unsaved in the background

" ================ Maps ===========================

"add new line below/above cursor and stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" remove highlighting after you are done with the search
nnoremap <Leader><space> :noh<cr>

" fuzzy find
nnoremap <C-p> :Files<Cr>

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

"  split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert a charecter while staying in normal mode
nnoremap <C-i> <Esc>r

" ================ Colors ===========================

colorscheme gruvbox


" <F8> | Rotate Color schemes
    function! s:colors(...)
      return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
            \                  'v:val !~ "^/usr/"'),
            \           'fnamemodify(v:val, ":t:r")'),
            \       '!a:0 || stridx(v:val, a:1) >= 0')
    endfunction
    
    function! s:rotate_colors()
      if !exists('s:colors')
        let s:colors = s:colors()
      endif
      let name = remove(s:colors, 0)
      call add(s:colors, name)
      execute 'colorscheme' name
      redraw
      echo name
    endfunction
    nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>
