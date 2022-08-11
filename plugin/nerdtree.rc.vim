 let g:NERDSpaceDelims=1
 
 function! ToggleNERDTree()
   if g:NERDTree.IsOpen()
     :NERDTreeClose
   elseif @% == ""
     :NERDTree
   else
     :NERDTreeFind
   endif
 endfunction
 command! ToggleNERDTree :call ToggleNERDTree()
 
 nnoremap <silent> <leader>e :ToggleNERDTree<CR>
 
 "autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
 
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
