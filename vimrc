" Make sure VIM using a POSIX-Compliant shell
set shell=/bin/sh

" For Neovim
let g:python_host_prog = expand('$HOME') . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = expand('$HOME') . '/.pyenv/versions/neovim3/bin/python'

"------- vim-plug START
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" -----------------------------------------------------------------------------

" Style
" CSApprox:
"   => Make gvim-only colorschemes work transparently in terminal vim 
Plug 'godlygeek/csapprox'
Plug 'bling/vim-airline'
Plug 'kien/rainbow_parentheses.vim'

" ColorScheme
Plug 'larssmit/vim-getafe'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'tomasr/molokai'

" Langs
Plug 'tpope/vim-haml' " including sass / scss
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'
Plug 'skwp/vim-rspec'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
" Plug 'dag/vim-fish'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'

" Lang Tools
Plug 'ngmy/vim-rubocop' " RuboCop is a Ruby static code analyzer, beautiful / clean ruby code!

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Tools
Plug 'tpope/vim-fugitive'
Plug 'vinnie-pepi/gh-comment.vim' "Vinnie's gh tool
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
" Plug 'Align'
Plug 'junegunn/vim-easy-align'
Plug 'jlanzarotta/bufexplorer'
" Plug 'godlygeek/tabular'
" Plug 'terryma/vim-multiple-cursors'
Plug 'ianva/vim-youdao-translater'
Plug 'vim-scripts/VisIncr'

" Tools not very useful for me
Plug 'scrooloose/syntastic' " Syntax checking hacks for vim
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'ZoomWin'
Plug 'rizzatti/dash.vim'

" Add plugins to &runtimepath
call plug#end()
"------- vim-plug END

" -----------------------------------------------------------------------------
" My Settings Begin
" -----------------------------------------------------------------------------

" General Setup
" -----------------------------------------------------------------------------
" Disable any beep
set noeb vb t_vb=

" Display commands in the bottom right corner as they are typed
set showcmd

" AugroupGet out of VI's compatible mode..
set nocompatible

" Disable backup
set nobackup
set nowritebackup

" Enable filetype plugin and indent
filetype plugin indent on

" Auto read when a file is changed from the outside
set autoread

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese

set nobomb

" Foldmethod
set nofoldenable

" Backspace to delete
"set backspace=2
set backspace=indent,eol,start

" Use mouse
"set mouse=c
"set ttymouse=xterm


" Colors
" -----------------------------------------------------------------------------
" Enable syntax hl
if &term =~ '256color'
  " Idea From: https://sunaku.github.io/vim-256color-bce.html
  " For fixing vim under tmux/screen color problem:
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=

  set t_Co=256
endif

syntax on
set synmaxcol=300
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=dark
colorscheme getafe
" colorscheme PaperColor
" colorscheme lucius

set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

" set colorcolumn=80
hi ColorColumn ctermfg=white ctermbg=160 guifg=white guibg=#df0000
call matchadd('ColorColumn', '\%81v', 100)

hi LineNr ctermfg=white ctermbg=black


" Search
" -----------------------------------------------------------------------------
" Enable incremental search
set incsearch

" Highlight the search terms
set hlsearch

" Ignore case when searching
set ignorecase

" Enable smart match
set smartcase

" Wrap search when EOF is reached
set wrapscan


" Indenting and Tabbing
" -----------------------------------------------------------------------------
set autoindent
" Number of spaces used for (auto)indenting
set shiftwidth=2

" Number of spaces to insert for a <tab>
set tabstop=2
set softtabstop=2

" Insert spaces when the <tab> key is pressed
set expandtab

" Enable specific indenting for c-code and others and some nice options for cindenting
set cindent

" Status
" -----------------------------------------------------------------------------
" Always display the status line
set laststatus=2

" Show the current editing status
set showmode

" Show special characters
set listchars=tab:▸\ ,trail:˽,eol:¶

" Cursor Style
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" set backup stuff
set noswapfile
"set nobackup
"set nowritebackup

" Large file fast
" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif


" Key maps
" -----------------------------------------------------------------------------
" Leader
let mapleader = ','

" Switch ; :
" nnoremap : ;
" nnoremap ; :

" Cursor
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Map the arrow keys to be based on display lines, not physical lines
nmap <up> gk
nmap <down> gj

" Tab mappings
nmap <silent> <C-C> :tabnew <CR>
nmap <silent> <C-N> :tabnext<CR>
nmap <silent> <C-P> :tabprevious<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" remove all the ending white spaces
nmap <silent> <leader><space> :%s/\s\+$//<CR>

" show invisible chars
nmap <silent> <leader>l :set list!<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Toggle line number
nmap <silent> <leader>n :set invnumber<CR>:set number?<CR>

" Toggle line wrap
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" Some helpers to edit mode
nmap <leader>ew :e    %:p:h/<CR>
nmap <leader>es :sp   %:p:h/<CR>
nmap <leader>ev :vs   %:p:h/<CR>
nmap <leader>et :tabe %:p:h/<CR>

" HEX view
nmap <leader>16  :% !xxd<CR>
nmap <leader>16r :% !xxd -r<CR>

" Save readonly file
cmap w!! %!sudo tee > /dev/null %

" Reload VIMRC
map <silent> <leader>rv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" GUI Settings
" -----------------------------------------------------------------------------
" Font
set guifont=ProFont:h14

" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
nmap <silent> <F2> :if &guioptions =~# 'T' <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=m <bar>
\else <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=m <Bar>
\endif<CR>


" Additional filetypes
" -----------------------------------------------------------------------------
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.js2,*.ms  setlocal ft=javascript
  autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino
  autocmd! BufNewFile,BufRead *.gr        setlocal ft=ebnf
  autocmd! BufNewFile,BufRead *.map       set      noexpandtab
augroup END

" Fix html indent
let g:html_indent_inctags = "html,body,head,tbody"

" Plugin Settings
" -----------------------------------------------------------------------------
" map <F3> for grep|ack|ag current word
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column --ignore "*.sql" --ignore "*.log" --ignore "*.csv" --ignore "*.pem" --ignore "*.svg"'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --column\ --ignore\ "*.sql"\ --ignore\ "*.log"\ --ignore\ "*.csv"\ --ignore\ "*.pem"\ --ignore\ "*.svg"
endif
"let Grep_Default_Options = '-i -r --exclude=all-wcprops --exclude=entries --exclude=\*.swp --exclude=\*.tmp --exclude=\*.log'
"nmap <F3> :Grep<SPACE>
nmap <leader>q :Ack

" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>al <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>al <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" CtrlP
" let g:ctrlp_map = '<leader>f'
" if executable('ag')
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

" Tags
nnoremap <leader>ctf :CtrlPTag<CR>
nnoremap <leader>ctt :TagbarToggle<CR>

" FuGitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" GitGutter
let g:gitgutter_enabled = 0
nmap <leader>gg :GitGutterToggle<CR>

" GunDo
nmap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

" ZoomWin
map <leader>zw :ZoomWin<CR>
map <leader>zz :ZoomWin<CR>

" Config the NERDTree
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
nmap <silent>tt :NERDTreeToggle<CR>
nmap <silent>tf :NERDTreeFind<CR>

" Config the bufexplorer
nmap <silent><leader>bb :ToggleBufExplorer<CR>

" Config Airline / Powerline
let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['haml_lint', 'rubocop', 'mri', 'rubylint', '']

" Config the indent-guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Activate skim
nmap <leader>lv :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
nmap <leader>lp :w<CR>:silent !xelatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
nmap <leader>lm :w<CR>:silent !make <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
" Reactivate VIM
nmap <leader>lr :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
nmap <leader>lt :w<CR>:silent !xelatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>


" Clipboard
" Copy to clipboard
nmap <leader>y "+y
nmap <leader>Y "+yg_
vmap <leader>y "+y
" Paste from clipboard
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P


" Youdao
nnoremap <leader>yd :<C-u>Ydc<CR>
vnoremap <leader>yd :<C-u>Ydv<CR>


" NEOVIM Special
:map <A-t><A-t> :vs term://fish<CR>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
