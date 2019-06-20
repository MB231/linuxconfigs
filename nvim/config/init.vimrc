"MULTIPLE VIM INSTANCES ON SAME FILE CONFIG

"**must enable focus events in tmux with 
"(set -g focus-events on) in .tmux.conf
"check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
"disable swapfile to avoid errors on load set noswapfile
"enable refresh (using checktime) everytime cursorhold (4s stationary cursor).
"This time length is configurable with updatetime. au=autocmd
au CursorHold,CursorHoldI * checktime

"ALE LINTER CONFIG

let g:ale_linters = {'cpp':['cppcheck', 'gcc', 'clangtidy']}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"LANGUAGE SERVERS VIM-LSP
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

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
