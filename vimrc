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

" Colors
Plugin 'larssmit/vim-getafe'
Plugin 'godlygeek/csapprox'

" -----------------------------------------------------------------------------

" Langs
" Langs -  Core
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim' "Vim Plugin for Jasmine javascript testing
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-jade'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mmalecki/vim-node.js'
Plugin 'slim-template/vim-slim'
Plugin 'groenewege/vim-less'
Plugin 'wlangstroth/vim-haskell'
Plugin 'jnwhiteh/vim-golang'
Plugin 'jimenezrick/vimerl'
" Plugin 'chrisbra/csv.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'killphi/vim-ebnf'

Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-classpath'
" Plugin 'dgrnbrg/vim-redl'

" Plugin 'vim-scripts/VimClojure'
Plugin 'rosstimson/scala-vim-support'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'luochen1990/rainbow'


Plugin 'tclem/vim-arduino'
Plugin 'aliva/vim-fish'
" Langs -  Framework
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-git'
Plugin 'skwp/vim-rspec'
" Langs -  Sysops
Plugin 'ajf/puppet-vim'

" -----------------------------------------------------------------------------
" Enhans

" Plugin 'vim-scripts/AutoClose'
" Plugin 'vim-scripts/matchit.zip'
" Plugin 'Shougo/neocomplete.vim'

" -----------------------------------------------------------------------------

" Tools
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Tools - replacement of snipmate
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/Align'
Plugin 'mileszs/ack.vim'
" Tools - replacement of Command-T
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/ZoomWin'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-endwise'
"Plugin 'vim-scripts/grep.vim'
" Indent Guide Line
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'edsono/vim-matchit'
"Plugin 'tomtom/tlib_vim'
"Plugin 'FredKSchott/CoVim'
"Plugin 'rizzatti/funcoo.vim'
"Plugin 'rizzatti/dash.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'guns/xterm-color-table.vim'

call vundle#end()            " required

" Powerline setting
set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/

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
colorscheme getafe
set t_Co=256

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

" format string -> POWERLINE PLUGIN ALREADY SUPPORTED
" set statusline=%1*\File:\ %*%f%1*%5m%*%=\L%-5l\ \C%-4c%5p%%\ [%L\ \lines]

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

" Config Powerline
let g:Powerline_symbols = 'fancy'

" Syntastic
"let g:syntastic_enable_signs   = 1
"let g:syntastic_quiet_warnings = 0
"let g:syntastic_auto_loc_list  = 2

" Clojure
let g:rainbow_active = 1

" Config the indent-guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
