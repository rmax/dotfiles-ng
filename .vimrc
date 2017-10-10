"
" global vim settings
"
set nocompatible

let g:plug_shallow = 1

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}


Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'rking/ag.vim'

Plug 'pangloss/vim-javascript', {'for': 'javascript'}

Plug 'wincent/command-t', {'do': 'rake make'}

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'

Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'cjrh/vim-conda', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug '5long/pytest-vim-compiler', {'for': 'python'}

Plug 'yssl/QFEnter'

" lusty
" sparkup
" supertab
"Plu
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
" supertab
" vim-fugitive
" vim-ipython
" vim-latex-suite
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
" vim-virtualenv

Plug 'jiangmiao/auto-pairs'

call plug#end()

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo+='10,\"100,:20,%,n~/.viminfo

" local dirs
set directory=~/.local/share/vim/swap//
set backupdir=~/.local/share/vim/backup//
set undodir=~/.local/share/vim/undo//

" tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" keep indents chars
set copyindent

" file settings
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8,latin1
set noeol

" wildmenu settings
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.class,*~,*.lo,*.bak,*.pyc

" hidden buffers
set hidden

" avoid intro prompt and abbreviate modified message
set shortmess+=Im

" enable backups
set backup

" search settings
set hlsearch
set ignorecase
set smartcase

" line settings
set number
set nowrap
set linebreak
set breakat=\ \ !@*-+;:,.?

" enable mouse
set mouse=a

" print
set printoptions+=syntax:y,number:y

" don't fsync on save
set nofsync

" visual bell
set vb t_vb=

"
" Customizations
"

" change leader
let mapleader = ","
let g:mapleader = ","

" fast saving
map <leader>w :w!<CR>
" fast vimrc reload
map <leader>r :source ~/.vimrc<CR>
" fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<CR>
" when vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" sudo save
cmap w!! w !sudo tee % > /dev/null

" remember last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" cursor column (highlight CursorColumn)
autocmd insertLeave * set nocursorcolumn
autocmd insertEnter * set cursorcolumn

" tab navigation
noremap <leader>n <esc>:tabnext<cr>
noremap <leader>m <esc>:tabprevious<cr>

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" nohl shortcut
nmap <silent> ,/ :nohl<CR>

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                              " file name
    set titlestring+=%h%m%r%w                                         " flags
    set titlestring+=\ -\ %{v:progname}                               " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
endif

" 8 colors: torte desert delek koehler peachpuff zellner
" 256 colors: darkburn desert256 inkpot zenburn graywh
if &t_Co >= 256
  colorscheme wombat256mod
else
  colorscheme graywh
endif

" column dark grey
highlight ColorColumn ctermbg=8

" highlight trailing whitespaces


" gui-only stuff
if has('gui_running')
  " remove menu & toolbar from gui
  set guioptions+=mT guioptions-=mT
  " better font
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  " this colorscheme looks good on gui
  colorscheme inkpot
  " better color column
  highlight ColorColumn guibg=grey20
endif


" enable dictionary and completion on func call
function! EnableWordsCompletion()
  set dictionary+=/usr/share/dict/american-english
  set dictionary+=/usr/share/dict/spanish
  set complete+=k
endfunction

" strip tailing whitespaces in all lines
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

noremap <silent> <f2> :call StripTrailingWhitespace()<cr>

" notification on DOS-style line endings
autocmd BufReadPost * nested
  \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc', 0, 100)) |
  \   let b:reload_dos = 1 |
  \   redir => s:num_dos_ends |
  \   silent %s#\r$##n |
  \   redir END |
  \   e ++ff=dos |
  \   echomsg "File has ".
  \     substitute(s:num_dos_ends, '^\_.\{-}\(\d\+\).*', '\1', '').
  \     " DOS-style line endings out of ".line('$')." lines." |
  \ endif
autocmd BufReadPost * if exists('b:reload_dos') | unlet b:reload_dos | endif

" highlight >80 chars columns, error msg on >100 chars.
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>100v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

" complete default opts
set complete=.,w,b,u,i
set completeopt=longest,menuone,preview

" folding shortcuts
nnoremap  <space> za
vnoremap  <space> zf

" autoclose quickfix window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" pate toggle
set pastetoggle=<f12>


"
" Plugins settings
"

" Taglist
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Auto_Highlight_Tag = 1

noremap <f4> :TlistToggle<cr><c-w>h
noremap <silent><a-right> <c-]>
noremap <silent><a-left> <c-T>

" tex-setup
let g:tex_flavor='latex'

" vim-powerline
let g:Powerline_symbols='compatible'

" syntastic
let g:syntastic_disabled_filetypes=['python']

" jedi-vim
let g:jedi#popup_on_dot = 1
let g:jedi#autocompletions_command = '<c-space>'
let g:jedi#use_tabs_not_buffers = 1

" supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'
let g:SuperTabMappingTabLiteral = '<c-tab>'

" python-mode
let g:pymode_rope = 0
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_complete_on_dot = 0
" avoid to modify exiting files
let g:pymode_utils_whitespaces = 0
" ignore common spaces-related warnings when working with legacy code:
"   E128 continuation line under-indented for visual indent
"   E225 missing whitespace around operator
"   E231 missing whitespace after ',;:'
"   E251 no spaces around keyword / parameter equals
"   E261 at least two spaces before inline comment
"   E262 inline comment should start with '# '
"   E301 expected one blank line
"   E303 too many blank lines
"   E401 multiple imports on one line
"   E501 line too long
"   W391 blank line at end of file
let g:pymode_lint_ignore='E128,E225,E231,E251,E261,E262,E301,E303,E401,E501,W391'
let g:pymode_options_max_line_length = 99

set tags=./.tags,.tags;

ca tn tabnew
ca th tabprev
ca tl tabnext

let g:netrw_gx="<cWORD>"

nmap <F1> <nop>
map <F1> <Esc>
imap <F1> <Esc>

set clipboard=unnamed
