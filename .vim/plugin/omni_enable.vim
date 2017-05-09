au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

if has("python3")
  au FileType python set omnifunc=python3complete#Complete
else
  au FileType python set omnifunc=pythoncomplete#Complete
endif

inoremap <Nul> <c-x><c-o>

set completeopt=longest,menuone


