" This must be first, because it changes other options as a side effect.
set nocompatible

"change leader to space
let mapleader = " "

" ================ Vim-Plug ===========================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  Plug 'scrooloose/nerdtree'                        " File Browser
  Plug 'vim-airline/vim-airline'                    " Status Line
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': './install --bin' }  " FuzzyFinder
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'                         " surroind stuff; cs'[<cr> / yss'
  Plug 'tpope/vim-commentary'                       " comment out; gc[motion]
  Plug 'tpope/vim-markdown'                         " markdown support
  Plug 'vim-scripts/ReplaceWithRegister'            " replace with register
  Plug 'vim-scripts/ReplaceWithSameIndentRegister'  " replace with register
  Plug 'w0rp/ale'                                   " Asyc lint engine
  " Plug 'vim-scripts/indentpython.vim'             " forces textwidth=80
  Plug 'davidhalter/jedi-vim'                       " python linter
  Plug 'pangloss/vim-javascript'                    " javsctip syntax
  Plug 'airblade/vim-gitgutter'		                " Git diff in the 'gutter'
  Plug 'tpope/vim-fugitive'		                    " Git wrapper.
  Plug 'christoomey/vim-tmux-navigator'             " tmux pane switch
  Plug 'morhetz/gruvbox'                            " ColorScheme
  Plug 'chriskempson/vim-tomorrow-theme'            " ColorScheme
  Plug 'tomasiser/vim-code-dark'                    " ColorScheme

call plug#end()


" ================ Plug: Ale ===========================

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '❗'
let g:ale_linters = {
\   'python': ['flake8'],
\}
" nmap <silent> <C-n> <Plug>(ale_next_wrap)


" ================ Plug: Airline ===========================

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1

" ================ Plug: NERDTREE ===========================

nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ================ Plug: FZF ===========================

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
nnoremap <silent> <Leader><Enter>  :Files<CR>
nnoremap <silent> <Leader>b        :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag<CR>
nnoremap <silent> <Leader>f        :BLines<CR>
nnoremap <silent> <Leader><C-f>    :Lines<CR>
nnoremap <silent> <Leader>m        :Marks<CR>

" ================ Plug: replace-with-register ==============

nmap <leader>gr "*gr
nmap <leader>gR "*gR

" ================ Misc ==============

syntax on                       " Turn on syntax highlighting
set nowrap                      " No wrap
set number relativenumber       " Both numbered lines and relative numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set scrolloff=5                 " Margin from top/bottom when scrolling
set mouse=a                     " Enable mouse support in console
set colorcolumn=80              " Mark where you should end a line
set textwidth=0                 " dont enforce text width
set clipboard=unnamed           " Clipboard as default register
set encoding=utf-8

" fzf hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""' 

" Auto-source vimrc on save
autocmd! bufwritepost .vimrc source %  

" ================ Clipboard ==============

" test if clopboard is available with :echo has('clipboard')
" if you get 0 - install vim-gtk (ubuntu) or gvim (arch)

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

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Buffers ===========================

set hidden  " Allow a buffer to stay unsaved in the background

" ================ Diff ===========================

set diffopt=filler,vertical " Vertical diff

" ================ Maps ===========================
" to find conflicting maps enter - :verbose map XXXX XXXX
"add new line below/above cursor and stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" remove highlighting after you are done with the search
nnoremap \ :noh<cr>

" Save
nnoremap <leader>s :update<cr>

"Quit - see 'konsole' note above
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs nvigation
nnoremap <leader>l <esc>:tabnext<CR> 
nnoremap <leader>h <esc>:tabprevious<CR> 

" switch to last used buffer
nnoremap <Leader><Space> :b#<cr>

" insert a chdarecter while staying in normal mode
" nnoremap <Leader>i i <Esc>r

" ================ Colors ===========================

colorscheme codedark


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

" ================ Commands ===========================

comm! Pr ! python %
