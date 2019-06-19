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
