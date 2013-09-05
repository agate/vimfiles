" Load Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Core
Bundle 'gmarik/vundle'

" -----------------------------------------------------------------------------

" Colors
Bundle 'larssmit/vim-getafe'

" -----------------------------------------------------------------------------

" Langs
" Langs -  Core
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'digitaltoad/vim-jade'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mmalecki/vim-node.js'
Bundle 'slim-template/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'wlangstroth/vim-haskell'
Bundle 'jnwhiteh/vim-golang'
Bundle 'jimenezrick/vimerl'
Bundle 'chrisbra/csv.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'guns/vim-clojure-static'
Bundle 'rosstimson/scala-vim-support'
Bundle 'vim-scripts/Arduino-syntax-file'
Bundle 'tclem/vim-arduino'
Bundle 'aliva/vim-fish'
" Langs -  Framework
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'skwp/vim-rspec'
" Langs -  Sysops
Bundle 'ajf/puppet-vim'

" -----------------------------------------------------------------------------

" Tools
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
" Tools - replacement of snipmate
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/Align'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
" Tools - replacement of Command-T
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/ZoomWin'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-endwise'
"Bundle 'vim-scripts/grep.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'scrooloose/syntastic'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'jeetsukumaran/vim-buffergator'
"Bundle 'edsono/vim-matchit'
"Bundle 'tomtom/tlib_vim'
"Bundle 'FredKSchott/CoVim'
"Bundle 'rizzatti/funcoo.vim'
"Bundle 'rizzatti/dash.vim'
"Bundle 'terryma/vim-multiple-cursors'

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
set foldmethod=marker

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
colorscheme getafe
set cursorline
set colorcolumn=80
hi CursorLine guifg=NONE guibg=black gui=BOLD ctermfg=NONE ctermbg=black cterm=BOLD
hi ColorColumn ctermbg=black guibg=black


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

" format string
set statusline=%1*\File:\ %*%f%1*%5m%*%=\L%-5l\ \C%-4c%5p%%\ [%L\ \lines]

" Show the current editing status
set showmode

" Show special characters
set listchars=tab:▸\ ,trail:˽,eol:¶

" Cursor Style
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" set backup stuff
set noswapfile
"set nobackup
"set nowritebackup


" Key maps
" -----------------------------------------------------------------------------
" Leader
let mapleader = ','

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
nmap <silent> <leader>d :%s/\s\+$//<CR>

" show invisible chars
nmap <silent> <leader>l :set list!<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Toggle line number
nmap <silent> <leader>n :set invnumber<CR>:set number?<CR>

" Some helpers to edit mode
nmap <leader>ew :e    %:p:h/<CR>
nmap <leader>es :sp   %:p:h/<CR>
nmap <leader>ev :vs   %:p:h/<CR>
nmap <leader>et :tabe %:p:h/<CR>

" HEX view
nmap <leader>16  :% !xxd<CR>
nmap <leader>16r :% !xxd -r<CR>


" GUI Settings
" -----------------------------------------------------------------------------
" Font
set guifont=Monaco:h14

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
augroup END


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
nmap <leader>a :Ack

" CtrlP
let g:ctrlp_map = '<C-F>'

" FuGitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" GunDo
nmap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

" ZoomWin
map <leader>zw :ZoomWin<CR>

" Config the NERDTree
nmap <silent>tt :NERDTreeToggle<CR>

" Config Powerline
let g:Powerline_symbols = 'fancy'

" Syntastic
"let g:syntastic_enable_signs   = 1
"let g:syntastic_quiet_warnings = 0
"let g:syntastic_auto_loc_list  = 2

" Config the Rspec
let g:RspecBin    = 'rspec'
let g:RspecRBPath = expand("~/").'.vim/bundle/vim-rspec/plugin/vim-rspec.vim'

" Config the Clojure
let vimclojure#WantNailgun   = 1
let vimclojure#NailgunClient = '/Users/honghao/local/lib/vimclojure-nailgun-client-2.3.0/ng'
