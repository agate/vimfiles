" Load Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Core
Bundle 'git://github.com/gmarik/vundle.git'

" Colors
Bundle 'git://github.com/larssmit/vim-getafe.git'

" Langs
Bundle 'git://github.com/tpope/vim-haml.git'
Bundle 'git://github.com/tpope/vim-cucumber.git'
Bundle 'git://github.com/tpope/vim-markdown.git'
Bundle 'git://github.com/nelstrom/vim-markdown-folding.git'
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-git.git'
Bundle 'git://github.com/mhinz/vim-signify.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'git://github.com/ajf/puppet-vim.git'
Bundle 'git://github.com/rosstimson/scala-vim-support.git'
Bundle 'git://github.com/nono/vim-handlebars.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'git://github.com/timcharper/textile.vim.git'
Bundle 'git://github.com/skwp/vim-rspec.git'
Bundle 'git://github.com/cakebaker/scss-syntax.vim.git'
Bundle 'git://github.com/vim-scripts/csv.vim.git'
Bundle 'git://github.com/mmalecki/vim-node.js.git'
Bundle 'git://github.com/vim-ruby/vim-ruby.git'
Bundle 'git://github.com/vim-scripts/Arduino-syntax-file.git'
Bundle 'git://github.com/tclem/vim-arduino.git'
Bundle 'git://github.com/vim-scripts/VimClojure.git'
Bundle 'git://github.com/groenewege/vim-less.git'
Bundle 'git://github.com/wlangstroth/vim-haskell.git'
Bundle 'git://github.com/digitaltoad/vim-jade.git'
Bundle 'git://github.com/aliva/vim-fish.git'

" Tools
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/tpope/vim-repeat.git'
Bundle 'git://github.com/tpope/vim-endwise.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
" replacement of snipmate
Bundle 'git://github.com/SirVer/ultisnips.git'
Bundle 'git://github.com/vim-scripts/Align.git'
Bundle 'git://github.com/vim-scripts/grep.vim.git'
Bundle 'git://github.com/mileszs/ack.vim.git'
Bundle 'git://github.com/rking/ag.vim.git'
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
" replacement of Command-T
Bundle 'git://github.com/kien/ctrlp.vim'
"Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/vim-scripts/ZoomWin.git'
Bundle 'git://github.com/jeetsukumaran/vim-buffergator.git'
Bundle 'git://github.com/edsono/vim-matchit.git'
Bundle 'git://github.com/sjl/gundo.vim.git'
Bundle 'git://github.com/tomtom/tlib_vim.git'
"Bundle 'git://github.com/FredKSchott/CoVim.git'
Bundle 'git://github.com/rizzatti/funcoo.vim'
Bundle 'git://github.com/rizzatti/dash.vim'

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
" map <F3> for grep current word
let Grep_Default_Options = '-i -r --exclude=all-wcprops --exclude=entries --exclude=\*.swp --exclude=\*.tmp --exclude=\*.log'
nmap <silent> <F3> :Grep<CR>

" map <F3> for ack current word
"nmap <F3> :Ack!<SPACE>

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
let g:syntastic_enable_signs   = 1
let g:syntastic_quiet_warnings = 0
let g:syntastic_auto_loc_list  = 2

" Config the Rspec
let g:RspecBin    = 'rspec'
let g:RspecRBPath = expand("~/").'.vim/bundle/vim-rspec/plugin/vim-rspec.vim'

" Config the Clojure
let vimclojure#WantNailgun   = 1
let vimclojure#NailgunClient = '/Users/honghao/local/lib/vimclojure-nailgun-client-2.3.0/ng'
