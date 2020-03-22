
" fzf hidden files  -   note: default command setup is in ~/.dotfiles/env
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }


nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Files<CR>
nnoremap <silent> <Leader>b        :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>A        :Ag<CR>
nnoremap <silent> <c-f>            :Ag<CR>
nnoremap <silent> <Leader>f        :BLines<CR>
nnoremap <silent> <Leader><Leader>f        :Ag<CR>
map <C-p> :call fzf#run({'source': 'git ls-files', 'sink': 'e'})<CR>