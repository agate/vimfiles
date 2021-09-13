" WhichKey
set timeoutlen=100

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
let g:which_key_use_floating_win = 0
" " Define a separator let g:which_key_sep = '→'

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> ; :WhichKey ';'<CR>

let g:which_key_map = {
      \ 'y' : ['"+y', 'Copy to system clipboard'],
      \ 'p' : ['"+p', 'Paste from system clipboard'],
      \ 't' : [':vsplit term://zsh', 'Open Terminal'],
      \ }
let g:which_key_map['l'] = {
      \ 'name' : '+LSP',
      \ }

let g:which_key_map['v'] = {
      \ 'name' : '+Vim',
      \ 'c' : [':e ~/.vimrc',      'Edit $HOME/.vimrc'],
      \ 'l' : [':set list!',       'Toggle invisible chars'],
      \ 'n' : [':set invnumber',   'Toggle line number'],
      \ 'r' : [':source ~/.vimrc', 'Reload $HOME/.vimrc'],
      \ 's' : [':source %',        'Source current file'],
      \ 'p' : {
        \ 'name' : '+Plug',
        \ 'i' : [':PlugInstall', 'PlugInstall'],
        \ 'g' : [':PlugUpgrade', 'PlugUpgrade'],
        \ 'u' : [':PlugUpdate',  'PlugUpdate'],
        \ },
      \ 'w' : [':set invwrap', 'Toggle line wrap'],
      \ }


" WhichKey is not able to handle multiple command in to one mapping
" So... we have to write vim mapping manually
nmap <leader>bb :ls<CR>:b<Space>
nmap <leader>b2 :bfirst<CR>:bnext<CR>
nmap <leader>b3 :bfirst<CR>:2bnext<CR>
nmap <leader>b4 :bfirst<CR>:3bnext<CR>
nmap <leader>b5 :bfirst<CR>:4bnext<CR>
nmap <leader>b6 :bfirst<CR>:5bnext<CR>
nmap <leader>b7 :bfirst<CR>:6bnext<CR>
nmap <leader>b8 :bfirst<CR>:7bnext<CR>
nmap <leader>b9 :bfirst<CR>:8bnext<CR>
let g:which_key_map['b'] = {
      \ 'name' : '+Buffers',
      \ 'n' : [':bnext',            'Switch to next buffer'],
      \ 'p' : [':bprevious',        'Switch to previous buffer'],
      \ 'f' : [':bfirst',           'Switch to the first buffer'],
      \ 'l' : [':blast',            'Switch to the last buffer'],
      \ 'b' : 'Select a specific buffer',
      \ '1' : [':bfirst',           'Switch to the #1 buffer'],
      \ '2' : 'Switch to the #2 buffer',
      \ '3' : 'Switch to the #3 buffer',
      \ '4' : 'Switch to the #4 buffer',
      \ '5' : 'Switch to the #5 buffer',
      \ '6' : 'Switch to the #6 buffer',
      \ '7' : 'Switch to the #7 buffer',
      \ '8' : 'Switch to the #8 buffer',
      \ '9' : 'Switch to the #9 buffer',
      \ }


let g:which_key_map['c'] = {
      \ 'name' : '+Content',
      \ 'c' : ['<plug>NERDCommenterToggle',     'Toggle comment'],
      \ 'd' : [':cd %:p:h',                     'cd into current file dir'],
      \ 'f' : [':lua vim.lsp.buf.formatting()', 'LSP code format'],
      \ 's' : [':%s/\s\+$//',                   'Remove all the ending white spaces'],
      \ }
let g:which_key_map['g'] = {
      \ 'name' : '+Git',
      \ 'b' : [':Git blame', 'Git blame'],
      \ 'd' : [':Git diff', 'Git diff'],
      \ 'l' : [':Git log', 'Git log'],
      \ 's' : [':Git status', 'Git status'],
      \ }
let g:which_key_map['u'] = {
      \ 'name' : '+Utils',
      \ 'p' : {
        \ 'name' : '+PDF' ,
        \ },
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+Windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

call which_key#register('<Space>', 'g:which_key_map')
