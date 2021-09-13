" Cursor
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Map the arrow keys to be based on display lines, not physical lines
nmap <up> gk
nmap <down> gj

" Tab mappings
nmap <silent> <C-C> :tabnew<CR>
nmap <silent> <C-N> :tabnext<CR>
nmap <silent> <C-P> :tabprevious<CR>

" Save readonly file
cmap w!! %!sudo tee > /dev/null %
