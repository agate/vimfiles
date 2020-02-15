" Make sure VIM using a POSIX-Compliant shell
set shell=/bin/sh

" For Neovim
"   LATEST_PY2_VERSION=$(pyenv install --list | sed 's| *||' | grep '^2' | grep '^[0-9.]*$' | sort -V | tail -n1)
"   LATEST_PY3_VERSION=$(pyenv install --list | sed 's| *||' | grep '^3' | grep '^[0-9.]*$' | sort -V | tail -n1)
"
"   pyenv install $LATEST_PY2_VERSION
"   pyenv install $LATEST_PY3_VERSION
"
"   pyenv virtualenv $LATEST_PY2_VERSION neovim2
"   pyenv virtualenv $LATEST_PY3_VERSION neovim3
"
"   pyenv activate neovim2
"   pip install neovim
"   pyenv which python  # Note the path and put it into g:python_host_prog
"
"   pyenv activate neovim3
"   pip install neovim
"   pyenv which python  # Note the path and put it into g:python3_host_prog
let g:python_host_prog = expand('$HOME') . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = expand('$HOME') . '/.pyenv/versions/neovim3/bin/python'
let g:ruby_host_prog = '/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/bin/ruby'

"------- vim-plug START
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" -----------------------------------------------------------------------------

" Style
" CSApprox:
"   => Make gvim-only colorschemes work transparently in terminal vim
Plug 'godlygeek/csapprox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'

" ColorScheme
Plug 'larssmit/vim-getafe'
Plug 'jaredgorski/spacecamp'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'tomasr/molokai'

" Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Langs
Plug 'tpope/vim-haml' " including sass / scss
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'
Plug 'skwp/vim-rspec'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'moll/vim-node'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/groovyindent-unix'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'posva/vim-vue'
" Check syntax (linting) and fix files asynchronously, with Language Server Protocol (LSP) integration in Vim
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

" Enhancement
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Plug 'Valloric/YouCompleteMe'

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
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'sjl/gundo.vim'
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
set mouse=a
" set mouse=c
" set ttymouse=xterm


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
" DARK
set background=dark
colorscheme PaperColor
" LIGHT
" set background=light
" colorscheme solarized
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

augroup ft_rb
  " fix the SLOOOW syntax highlighting
  autocmd! FileType ruby setlocal regexpengine=1 foldmethod=manual lazyredraw
augroup END

" Fix html indent
let g:html_indent_inctags = "html,body,head,tbody"

" Plugin Settings
" -----------------------------------------------------------------------------
" map <F3> for grep|ack|ag current word
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('rg')
  let g:ackprg = 'rg --vimgrep --column -g "!*.sql" -g "!*.log" -g "!*.csv" -g "!*.pem" -g "!*.svg" -g "!node_modules"'

  " Use rg over Grep
  set grepprg=rg\ --vimgrep\ --column\ --ignore\ "*.sql"\ --ignore\ "*.log"\ --ignore\ "*.csv"\ --ignore\ "*.pem"\ --ignore\ "*.svg"\ --ignore\ "node_modules"
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
nmap <leader>uu :GundoToggle<CR>

" coc config
if exists("g:coc_global_extensions")
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)
endif

" Config the NERDTree
let g:NERDSpaceDelims=1
nmap <silent>tt :NERDTreeToggle<CR>
nmap <silent>tf :NERDTreeFind<CR>

" Allow reload webdevicons when reload vimrc
let g:WebDevIconsOS = 'Darwin'
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsDefaultFolderOpenSymbol='' " symbol for open folder (f07c)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol='' " symbol for closed folder (f07b)
highlight! link NERDTreeFlags NERDTreeDir
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Config the bufexplorer
nmap <silent><leader>bb :ToggleBufExplorer<CR>

" Config Airline / Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['haml_lint', 'rubocop', 'mri', 'rubylint', '']

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'typescript.tsx': ['eslint']
      \ }
let g:ale_linters= {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'typescript.tsx': ['eslint']
      \ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:vim_json_syntax_conceal = 0

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
" set clipboard=unnamedplus

nmap <leader>y "+y
nmap <leader>Y "+yg_
vmap <leader>y "+y
" Paste from clipboard
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
map <D-C> "+y
map <D-V> "+p


" Youdao
nnoremap <leader>yd :<C-u>Ydc<CR>
vnoremap <leader>yd :<C-u>Ydv<CR>


" pangloss/vim-javascript

" NEOVIM Special
" -----------------------------------------------------------------------------
map <A-t><A-t> :vs term://fish<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" CUSTOMIZED FUNCTIONS
function! ToggleBackground()
	if &background == 'dark'
    set background = 'light'
	else
    set background = 'dark'
	endif
endfunction
command! ToggleBackground :call ToggleBackground()

