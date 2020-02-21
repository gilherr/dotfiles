" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin on

"change leader to space
let mapleader = " "

" ================ Vim-Plug ===========================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'scrooloose/nerdtree'                        " File Browser
  Plug 'junegunn/fzf', { 'do': './install --bin' }  " FuzzyFinder
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'                         " surroind stuff; cs'[<cr> / yss'
  Plug 'tpope/vim-commentary'                       " comment out; gc[motion]
  Plug 'tpope/vim-markdown'                         " markdown support
  Plug 'tpope/vim-repeat'                           " enable plug repeat
  Plug 'tpope/vim-fugitive'  		                    " Git wrapper.
  Plug 'easymotion/vim-easymotion'                  " easymotion...
  Plug 'vim-scripts/ReplaceWithRegister'            " replace with register
  Plug 'vim-scripts/ReplaceWithSameIndentRegister'  " replace with register
  Plug 'pangloss/vim-javascript'                    " javscritp syntax
  Plug 'airblade/vim-gitgutter' 		                " Git diff in the 'gutter'
  Plug 'christoomey/vim-tmux-navigator'             " tmux pane switch
  Plug 'morhetz/gruvbox'                            " ColorScheme
  Plug 'chriskempson/vim-tomorrow-theme'            " ColorScheme
  Plug 'tomasiser/vim-code-dark'                    " ColorScheme
  Plug 'altercation/vim-colors-solarized'           " ColorScheme
  Plug 'townk/vim-autoclose'                        " autoclose ()[]{}''...
  Plug 'vimwiki/vimwiki'                            " wiki tool
  Plug 'posva/vim-vue'                              " vim support for vue
  Plug 'dense-analysis/ale'                         " Linter runner
  Plug 'airblade/vim-rooter'                        " auto root folder finder
  " Plug 'dsawardekar/ember.vim'                      " ember support
  Plug 'joukevandermaas/vim-ember-hbs'              " ember hbs
  Plug 'metakirby5/codi.vim'
  Plug 'mattn/emmet-vim'                            " emmet html
call plug#end()

" ================ Plug: Color ===========================

colorscheme gruvbox
" colorscheme solarized

" ================ MacVim ===========================

" set guifont=Monaco:h13
" set background=dark
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 256
" color solarized

" ================ Plug: Gitgutter ===========================

" colors setup needs to be after colorscheme load
" highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" ================ Plug: vimwiki ===========================

let g:vimwiki_ext2syntax = {
            \'.md': 'markdown',
            \'.markdown': 'markdown',
            \'.mdown': 'markdown'
            \}

" ================ Plug: Ale ===========================

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:ale_sign_column_always = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \}
let g:ale_fix_on_save = 1
nmap <F10> :ALEFix<CR>
" nmap <silent> <C-n> <Plug>(ale_next_wrap)

" ================ Plug: NERDTREE ===========================

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <D-E> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ================ Plug: FZF ===========================

" fzf hidden files  -   note: default command setup is in ~/.dotfiles/env
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete | Buffers',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

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
nnoremap <silent> <Leader>A        :Ag<CR>
nnoremap <silent> <c-f>            :Ag<CR>
nnoremap <silent> <Leader>f        :BLines<CR>
nnoremap <silent> <Leader><Leader>f        :Ag<CR>

" ================ Plug: replace-with-register ==============

nmap <leader>gr "*gr
nmap <leader>gR "*gR

" ================ Plug: easymotion ===========

map <leader><leader> <S-H><Plug>(easymotion-prefix)f

" ================ Plug: Jedi ==============

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"   " show in cmnd line, not popup

" ================ Misc ==============

syntax enable                   " Turn on syntax highlighting
set nowrap                      " No wrap
set number                      " Both numbered lines
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show keys pressed for command
set showmode                    " Show current mode
" set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set scrolloff=5                 " Margin from top/bottom when scrolling
set mouse=a                     " Enable mouse support in console
set colorcolumn=80              " Mark where you should end a line
set textwidth=0                 " dont enforce text width
" set clipboard=unnamedplus       " Linux clipboard as default register
set clipboard=unnamed           " Mac clipboard as default register
set encoding=utf-8
set signcolumn=yes              " keep gutter visibile - good for jedi
set wildmenu                    " show possible command-line completions
set cursorline                  " highlight current line
set foldmethod=syntax           "syntax highlighting items specify folds
let javaScript_fold=1           "activate folding by JS syntax
set foldlevelstart=99           "start file with all folds opened
set splitbelow splitright       " Splits open at the bottom and right

" Cursor change in insert mode
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" "SI = INSERT mode
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\" "SR = REPLACE mode
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" "EI = NORMAL mode (ELSE)

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


" Auto-source vimrc on save
autocmd! bufwritepost .vimrc source %

" ============== Trailing Whitespace ==============

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" ============== Colorcolumn color ==============

" highlight ColorColumn ctermbg=0

" ================ Clipboard ==============

" test if clopboard is available with :echo has('clipboard')
" if you get 0 - install vim-gtk (ubuntu) or gvim (arch)

" ================ Set vim files path ==============

if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0770)
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "", 0700)
endif
if !isdirectory($HOME."/.vim/swp")
    call mkdir($HOME."/.vim/swp", "", 0700)
endif

set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Buffers ===========================

set hidden  " Allow a buffer to stay unsaved in the background

" ================ Maps ===========================
" to find conflicting maps enter - :verbose map XXXX XXXX

 " disable ex mode prompt
nmap Q <Nop>

" disable lookup man page for word under cursor
nmap K <Nop>

nnoremap <leader>d :bd<cr>

" When autocomplete popup is open, enter just inserts selected item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"add new line below/above cursor and stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" change work directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" remove highlighting after you are done with the search
nnoremap \ :noh<cr>

" Save
nnoremap <leader>s :wa<cr>

" Close window
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-e> <C-o>$
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs nvigation
nnoremap <leader>l <esc>:tabnext<CR>
nnoremap <leader>h <esc>:tabprevious<CR>

" switch to last used buffer
nnoremap <Leader>j :b#<cr>

" insert a charecter while staying in normal mode
nnoremap <Leader>i i <Esc>r

" search and replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" disable auto-comment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" resize buffers quickly
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" edit .vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" =========== Custom Status Line ==============

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✅' : printf(
        \   '%dW %dE ❌',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}  # have issues when not in git dir
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m\
set statusline+=%=
set statusline+=\ %{LinterStatus()}
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%3l:%3c]
set statusline+=\ 

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" No delay for ESC ---------------------- {{{
set timeoutlen=1000 ttimeoutlen=0
" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}
