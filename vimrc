" Make sure VIM using a POSIX-Compliant shell
set shell=/bin/sh

"------- vim-plug START
call plug#begin('~/.tmp/vim/plugged')
" Make sure you use single quotes

" -----------------------------------------------------------------------------
" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " show color in vim

" Theme
" Plug 'larssmit/vim-getafe'
" Plug 'arcticicestudio/nord-vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'folke/tokyonight.nvim'
" Plug 'dracula/vim'
Plug 'sainnhe/sonokai'

" Utils
" Plug 'mhinz/vim-startify' " Landing page
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
Plug 'easymotion/vim-easymotion'
Plug 'jremmen/vim-ripgrep'
Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/harpoon'
Plug 'junegunn/goyo.vim'

"" Snippets
Plug 'SirVer/ultisnips'   " Snippet Engine
Plug 'honza/vim-snippets' " Snippet Files

" Lang
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'vim-scripts/groovyindent-unix'
Plug 'tomlion/vim-solidity'

if has('nvim')
  Plug 'neovim/nvim-lspconfig' " Language Server Support
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'  " better lsp UI based on neovim/nvim-lspconfig
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' " require plenary.nvim plugin
    Plug 'kyazdani42/nvim-web-devicons'

  " Utils
  Plug 'ggandor/lightspeed.nvim'
endif

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

" Don't ring the fucking bell!
set noerrorbells

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
set mouse+=a
" set mouse=c
" set ttymouse=xterm


" Colors
" -----------------------------------------------------------------------------
" Enable syntax hl
" if &term =~ '256color'
"   " Idea From: https://sunaku.github.io/vim-256color-bce.html
"   " For fixing vim under tmux/screen color problem:
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"   set t_ut=
" 
"   set t_Co=256
" endif

syntax on
set termguicolors
set synmaxcol=1024
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" DARK
set background=dark
" let g:tokyonight_style = "night" | colorscheme tokyonight
colorscheme sonokai
" colorscheme PaperColor
" colorscheme nord

set cursorline
" hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

set colorcolumn=80
" hi ColorColumn ctermbg=0 guibg=lightgrey
" hi LineNr ctermfg=white ctermbg=black


" Search
" -----------------------------------------------------------------------------
set incsearch " Enable incremental search
set hlsearch " Highlight the search terms
set ignorecase " Ignore case when searching
set smartcase " Enable smart match
set wrapscan " Wrap search when EOF is reached


" Indenting and Tabbing
" -----------------------------------------------------------------------------
set autoindent
set shiftwidth=2 " Number of spaces used for (auto)indenting
set tabstop=2 softtabstop=2 " Number of spaces to insert for a <tab>
set expandtab " Insert spaces when the <tab> key is pressed
set cindent " Enable specific indenting for c-code and others and some nice options for cindenting

" Status
" -----------------------------------------------------------------------------
" Always display the status line
set laststatus=2

" Show the current editing status
set showmode

" Show special characters
set listchars=tab:▸\ ,trail:˽,eol:¶

" set backup stuff
set noswapfile
set nobackup
set undodir=~/.tmp/vim/undodir
set undofile

autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Leader
let mapleader = ' '

" Fix html indent
let g:html_indent_inctags = "html,body,head,tbody"
