"MULTIPLE VIM INSTANCES ON SAME FILE CONFIG

"**must enable focus events in tmux with 
"(set -g focus-events on) in .tmux.conf
"check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
"disable swapfile to avoid errors on load set noswapfile
"enable refresh (using checktime) everytime cursorhold (4s stationary cursor).
"This time length is configurable with updatetime. au=autocmd
au CursorHold,CursorHoldI * checktime


"must set python3 host manually in centos7 as it doesn't natively support python3
let g:python3_host_prog="/usr/bin/python3.6"


"ALE LINTER CONFIG

"cpp linter options
"can also set with list if a list of strings expected let g:ale-gcc-options: {"option": "optionchoice", "otheroption" : "optionchoice"}
let g:ale_cpp_gcc_options = '-std=c++11 -Wall -pedantic -Wextra -Wunused-variable Wunused-parameter fstack-protector -Wold-style-cast -Wunreachable-code -Wuninitialized -Werror'
let g:ale_cpp_clang_options = '-std=c++11 -stdlib=libc++ -Wall -pedantic -Wextra -Wunused-variable Wunused-parameter fstack-protector -Wold-style-cast -Wunreachable-code -Wuninitialized -Werror'
let g:ale_cpp_cppcheck_options = '--enable=all --inconclusive --inline-suppr'

let g:ale_linters = {'cpp':['cppcheck', 'gcc', 'clangtidy']}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
"lets deoplete do all completion
let g:ale_completion_enabled = 0

"LANGUAGECLIENT LSP OPTIONS
"lets ALE do diagnostics
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

"VIM-CLANG-FORMAT OPTIONS
"example below
"let g:clang_format#style_options = {
"            \ "AccessModifierOffset" : -4,
"            \ "AllowShortIfStatementsOnASingleLine" : "true",
"            \ "AlwaysBreakTemplateDeclarations" : "true",
"            \ "Standard" : "C++11",
"            \ "BreakBeforeBraces" : "Stroustrup"}

let g:clang_format#detect_style_file = 1
"formats on save
"let g:clang_format#auto_format = 1
"formats on leaving insert mode
let g:clang_format#auto_format_on_insert_leave = 1

" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"VISTA TAGBAR
"Indent Icon
let g:vista_icon_indent = ["╰─> ", "├─> "]
"detailed info of current cursor symbol will be in cmd line and scroll
let g:vista_echo_cursor_strategy = "both"
"change sidebar width from default 30
let g:vista_sidebar_width = 50

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
