" Make sure VIM using a POSIX-Compliant shell
set shell=/bin/sh

" Load Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" NOTE README ->
" brew install macvim --with-cscope --with-lua --env-std --override-system-vim

" Core
Plugin 'gmarik/Vundle.vim'

" -----------------------------------------------------------------------------

" Colors / Style
Plugin 'godlygeek/csapprox' " CSApprox : Make gvim-only colorschemes work transparently in terminal vim 
Plugin 'larssmit/vim-getafe'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'

" Langs
Plugin 'tpope/vim-haml' " including sass / scss
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'skwp/vim-rspec'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

" Tools
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'Align'
" Plugin 'godlygeek/tabular'

" Tools not very useful for me
" Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'ZoomWin'

call vundle#end()            " required

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
"set ttymouse=xterm
"set mouse=nv


" Colors
" -----------------------------------------------------------------------------
" Enable syntax hl
syntax on
set t_Co=256
" colorscheme getafe
colorscheme lucius
set background=dark

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


" Key maps
" -----------------------------------------------------------------------------
" Leader
let mapleader = ','

" Switch ; :
" nnoremap : ;
" nnoremap ; :

" Cursor
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
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
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


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
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"let Grep_Default_Options = '-i -r --exclude=all-wcprops --exclude=entries --exclude=\*.swp --exclude=\*.tmp --exclude=\*.log'
"nmap <F3> :Grep<SPACE>
nmap <leader>q :Ack

" Align
map <leader>al :Align

" CtrlP
let g:ctrlp_map = '<leader>f'

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

" Config the NERDTree
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
nmap <silent>tt :NERDTreeToggle<CR>
nmap <silent>tf :NERDTreeFind<CR>

" Config Airline / Powerline
let g:airline_powerline_fonts = 1

" Syntastic
"let g:syntastic_enable_signs   = 1
"let g:syntastic_quiet_warnings = 0
"let g:syntastic_auto_loc_list  = 2

" Config the indent-guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Activate skim
nmap <leader>lv :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
nmap <leader>lp :w<CR>:silent !xelatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
nmap <leader>lm :w<CR>:silent !make <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
" Reactivate VIM
nmap <leader>lr :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
nmap <leader>lt :w<CR>:silent !xelatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
