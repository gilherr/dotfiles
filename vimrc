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

  Plug 'scrooloose/nerdtree'                        " File Browser
  Plug 'junegunn/fzf', { 'do': './install --bin' }  " FuzzyFinder
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'                         " surroind stuff; cs'[<cr> / yss'
  Plug 'tpope/vim-commentary'                       " comment out; gc[motion]
  Plug 'tpope/vim-markdown'                         " markdown support
  Plug 'tpope/vim-repeat'                           " enable plug repeat
  Plug 'godlygeek/tabular'                          " align text
  Plug 'easymotion/vim-easymotion'                  " easymotion...
  Plug 'vim-scripts/ReplaceWithRegister'            " replace with register
  Plug 'vim-scripts/ReplaceWithSameIndentRegister'  " replace with register
  Plug 'w0rp/ale'                                   " Asyc lint engine
  Plug 'vim-scripts/indentpython.vim', {'for': 'python'} " Python indent
  Plug 'davidhalter/jedi-vim', {'for': 'python'}    " Python autocompletion
  Plug 'ambv/black'                                 " python formatter
  Plug 'pangloss/vim-javascript'                    " javsctip syntax
  Plug 'airblade/vim-gitgutter'		                " Git diff in the 'gutter'
  Plug 'tpope/vim-fugitive'		                    " Git wrapper.
  Plug 'christoomey/vim-tmux-navigator'             " tmux pane switch
  Plug 'morhetz/gruvbox'                            " ColorScheme
  Plug 'chriskempson/vim-tomorrow-theme'            " ColorScheme
  Plug 'tomasiser/vim-code-dark'                    " ColorScheme
  Plug 'terryma/vim-multiple-cursors'               " Sublime-text multicursor
  Plug 'townk/vim-autoclose'                        " autoclose ()[]{}''...
  Plug 'vimwiki/vimwiki'                            " wiki tool
  Plug 'suan/vim-instant-markdown'                  " live markdown rendering

call plug#end()


" ================ Plug: vimwiki ===========================

let g:vimwiki_ext2syntax = {
            \'.md': 'markdown',
            \'.markdown': 'markdown',
            \'.mdown': 'markdown'
            \}

" =========== Plug: Instant-Markdown =======================

au FileType markdown setl shell=bash\ -i            " bugfix if using zsh
let g:instant_markdown_autostart = 0                " disable autostart
" let g:instant_markdown_slow = 1
map <leader>md :InstantMarkdownPreview<CR>

" ================ Plug: Ale ===========================

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_linters = {
\   'python': ['flake8'],
\}
" nmap <silent> <C-n> <Plug>(ale_next_wrap)

" ================ Plug: NERDTREE ===========================

nnoremap <F1> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ================ Plug: FZF ===========================

" fzf hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

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
nnoremap <silent> <c-f>            :Ag<CR>
nnoremap <silent> <Leader>f        :BLines<CR>
nnoremap <silent> <Leader><C-f>    :Lines<CR>
" nnoremap <silent> <Leader>m        :Marks<CR> " conflicts with markdown

" ================ Plug: replace-with-register ==============

nmap <leader>gr "*gr
nmap <leader>gR "*gR

" ================ Plug: Tabular ==============

if exists(":Tabularize")
  nmap <Leader>t :Tabularize /\|<CR>
endif

" ================ Plug: easymotion ===========

" map <Leader> <Plug>(easymotion-prefix)

" ================ Misc ==============

syntax on                       " Turn on syntax highlighting
set nowrap                      " No wrap
set number relativenumber       " Both numbered lines and relative numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show keys pressed for command
set showmode                    " Show current mode
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set scrolloff=5                 " Margin from top/bottom when scrolling
set mouse=a                     " Enable mouse support in console
set colorcolumn=80              " Mark where you should end a line
set textwidth=0                 " dont enforce text width
set clipboard=unnamedplus       " System Clipboard as default register
set encoding=utf-8
set signcolumn=yes              " keep gutter visibile - good for jedi
set wildmenu                    " show possible command-line completions
set cursorline                  " highlight current line
set foldmethod=indent           " fold according to indentation 'za' 'zR' 'zM'
set foldnestmax=2
set nofoldenable                " disable folding
set splitbelow splitright       " Splits open at the bottom and right


" Auto-source vimrc on save
autocmd! bufwritepost .vimrc source %

" ============== Trailing Whitespace ==============

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

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

" ================ Maps ===========================
" to find conflicting maps enter - :verbose map XXXX XXXX

"add new line below/above cursor and stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" change work directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" remove highlighting after you are done with the search
nnoremap \ :noh<cr>

" Save
nnoremap <leader>s :update<cr>

" Close window
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-r> <C-o>$
inoremap <C-e> <C-o>0
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
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" =========== Custom Status Line ==============

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}  # have issues when not in git dir
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%3l:%3c]
set statusline+=\ 

" =========== Python Specific Bindings ==============

augroup pythonbindings
  autocmd! pythonbindings
  autocmd Filetype python nnoremap <buffer> <silent> <F5> :w<CR>:!clear && python %<CR>
  autocmd Filetype python nnoremap <buffer> <silent> <F2> :Black<CR>
augroup end

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

" ================ Commands ===========================

comm! Br ! ./%
