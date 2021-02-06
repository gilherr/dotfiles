
" Behavior
" =======
set nocompatible		                " disable vi backwards compatibilty
set backspace=indent,eol,start 	  	" fixes backspace & del behavior
set timeoutlen=1000 ttimeoutlen=0 	" No delay for ESC
let mapleader = " "
nmap Q <Nop> " disable ex mode prompt
nmap K <Nop> " disable lookup man page for word under cursor

if has("mouse_sgr")
    set ttymouse=sgr " fixes mouse selection beyond column 222 in xterm
else
    set ttymouse=xterm2
end

set autoread 	" Automatically reload files that have been changed outside of Vim
set confirm 	" confirm before exiting if files have not been saved
set hidden 	  " Hide buffers when they are abandoned

" UI
" ===
set number	    			" show line numbers (disable with nonumber)
set mouse=a	    			" enable mouse (disble with mouse= )
set laststatus=2
set encoding=utf-8    " Necessary to show Unicode glyphs
set statusline=%f     " show relative path in status line
set completeopt=longest,menuone " doesn't select first item; insert longest common text; always show menu
set sidescroll=1
set t_Co=256          " 256 colors
set t_ut=             " disable Background Color Erase

" first tab completed to the longest common match, or full match,
" second tab completed to show list of all matches,
" third tab starts to cycle through matches
set wildmode=longest,list,full
set wildmenu

" The following command scrolls the text so that (when possible) there are always at least
" five lines visible above the cursor, and five lines visible below the cursor.
" This option is available to all commands
set scrolloff=5

" Editing
" =======
set tabstop=2         " how many columns is a tab space
set shiftwidth=2      " indentation with the << and >> mappings
set softtabstop=2     " columns to insert when pressing tab in insert mode
set expandtab         " converts tabs to spaces
set nowrap            " don't use word wrap
set textwidth=0       " if word wrap is enabled, this is the max character length
set indentkeys-=<:>   " Don't indent after typing a colon (annoying!!!)
set nospell           " Spell checker defaults to off
set spellfile=~/.vim/myspell.utf-8.add
set cursorline        " highlight current line

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() " Remove any and all trailing whitespace
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun


" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Set undo backup swp files path
" ==============================

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

" Clipboard
" =========

" test if clopboard is available with :echo has('clipboard')
" if you get 0 - install vim-gtk (ubuntu) or gvim (arch)
set clipboard=unnamedplus       " Linux clipboard as default register

" WSL yank support (windows 10 with windows-terminal)
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Folding
" ======
set foldmethod=indent
set foldnestmax=1
set foldlevel=1

" Search
" ======
set ignorecase	" case insensitive search
set smartcase		" case sensitive if uppercase
set incsearch		" move the cursor to first result
set showmatch 	" Show matching brackets.
set hlsearch    " highlight all search matches

" Backups
" =======
set nobackup
set noswapfile

" Custom Status Line
" ==================

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

" Ensure syntax highlighting & filetype detecton are turned on
syntax on
filetype plugin indent on

" disable auto-comment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
