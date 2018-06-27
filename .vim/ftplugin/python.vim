" Stuff not set in python-mode plugin

" - c do insert comment leader when wrapping based on textwidth
" - o do not insert comment leader when using 'o' or 'O'
" - r do not insert comment leader when hitting <Enter>
set formatoptions+=c formatoptions-=o formatoptions-=r

highlight BadWhitespace term=standout ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

" python-mode settings
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

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
let g:pymode_options_max_line_length = 88

" ale
let g:ale_completion_enabled = 1
let b:ale_linters = ['flake8']
let b:ale_fixers = ['black']
