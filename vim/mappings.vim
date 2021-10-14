" ========
" Mappings
" ========

" Select entire line excluding new lines
nnoremap <leader>v 0vg_

" Select entire file
nnoremap <leader>a ggVG

" When autocomplete popup is open, enter just inserts selected item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" navigate quickfix locations
nmap ]q :lnext<cr>
nmap [q :lprevious<cr>

" navigate location list
nmap ]w :cnext<cr>
nmap [w :cprevious<cr>

" Vimrc editing mappings
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Navigate splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle spell checker with <LEADER>sp
function! g:ToggleSpell()
  if &spell == 0
    " turn spell on
    set spell spelllang=en_us
  else
    " turn spell off
    set nospell
  endif
endfunction
nnoremap <silent><LEADER>sp :call g:ToggleSpell()<cr>

" use Shift+L to toggle relative/normal line numbering
function! g:ToggleNuMode()
  if &nu == 1
    " relative line numbers on
    set rnu
    set nonu
  else
    set nu
    " relative line numbers off
    set nornu
  endif
endfunction
nnoremap <silent><S-L> :call g:ToggleNuMode()<cr>

" Show cursor location (guidelines)
nnoremap <Leader>g :set cursorline! cursorcolumn!<CR>

" Jump list mappings
" go back in jump list
map ,o <C-o>
" go forwards in jump list
map ,i <C-i>

" Sync syntax highlighting
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

" Close current buffer
nnoremap <leader>d :bd<cr>

"add new line below/above cursor and stay in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" remove highlighting after you are done with the search
nnoremap \ :noh<cr>

" Save All
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

" tabs nvigation
nnoremap <leader>l <esc>:tabnext<CR>
nnoremap <leader>h <esc>:tabprevious<CR>

" switch to last used buffer
nnoremap <Leader>j :b#<cr>

" insert a charecter while staying in normal mode
nnoremap <Leader>i i <Esc>r

" search and replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" resize buffers quickly
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" NERDtree
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

