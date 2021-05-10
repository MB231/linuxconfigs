"REMAPS


"<mode>map - standard map recusive
"<mode>noremap - map not recursive
"<mode>unmap - unmap a key so it is not used
"n (normal), i (insert/replace), v (visual/select), x (visual), s (select)
"c (command line mode), o (operator pending)

"let is for setting variables and set is for setting options

"leader key for use in functions as a corded key to activated
let mapleader="\<Space>"
"esc key remaps
inoremap jk <Esc>
inoremap kj <Esc>

"TERMINAL BUFFER remaps for it's esc
tnoremap jk <C-\><C-n> 
tnoremap kj <C-\><C-n>

"resize windows width
nnoremap <silent> <F5> :vertical resize +5<CR>
nnoremap <silent> <F4> :vertical resize -5<CR>

"autoclose
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap " ""<left>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Disable paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

"SPELLCHECK
:map zs :setlocal spell! spelllang=en_us<CR>

"VIMWIKI KEYS
"Remap from default tab and shift tab. Interferes with autocomplete keys
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink

"MINIYANK KEYS
"Currently neovim doesn't have support for register types in the clipboard. This makes blockwise
"yanking and putting broken when clipboard=unnamed or unnamedplus is used. When this option is
"set, and "p" is mapped to "autoput" mappings as suggested, this plugin will try to correct
"the register type when an unnamed paste is done. It uses heuristics that at least will work
"if you yank blockwise and then immediately paste unnamed in the same or another nvim instance.
"Of course, regardless if clipboard=unnamed is set or not, you can always do the correct paste
"using a "startPut" mapping, or cycling one step back in history when needed.
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
"startput takes most recent item in shared history
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
"cycle through history
map <leader>n <Plug>(miniyank-cycle)
"cycleback doesn't work
map <leader>N <Plug>(miniyank-cycleback
"change register type. done AFTER putting(first paste)
"map <Leader>c <Plug>(miniyank-tochar)
"map <Leader>l <Plug>(miniyank-toline)
"map <Leader>b <Plug>(miniyank-toblock)
"If Denite is installed, the yank history can be displayed using :Denite miniyank

"ALE Keys"
"to toggle ALE Detail
nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>aD :ALEGoToDefinition<CR>
nnoremap <leader>aX :ALEFindReferences<CR>
nnoremap <leader>aH :ALEHover<CR>
nnoremap <leader>aS :ALESymbolSearch<CR>

"ale error skip to
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"SymbolsOutline (symbol tagbar) Keys
"Escape --> Close Outline
"Enter --> GoTo Symbol location in code
"o --> GoTo Symbol location in code but stay in outline window
"Ctrl + Space --> Hover current symbol
"r --> Rename symbol
"start symbols outline with and use above standard keys
nnoremap <F8> :SymbolsOutline <CR>

"NVIM-LSP/Trouble
"Diagnostics
nnoremap <silent> <leader>di    <cmd>LspInfo<CR>
nnoremap <silent> <leader>dw    <cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>
nnoremap <silent> <leader>dd    <cmd>LspTroubleToggle lsp_document_diagnostics<CR>
nnoremap <silent> <leader>dD    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>dq    <cmd>LspTroubleToggle quickfix<CR>
nnoremap <silent> <leader>dl    <cmd>LspTroubleToggle loclist<CR>
nnoremap <silent> <leader>dR    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>dr    <cmd>LspTroubleToggle lsp_references<CR>
nnoremap <silent> <leader>dn    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>dp    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

"LSP Commands
nnoremap <silent> <leader>lD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>ltd   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lH    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ls    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>lws   <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>lwa   <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <leader>lwd   <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <leader>lwl   <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>


"Use C-p and C-n instead tab is used for too many other things
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>" Use if only one
" available
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"nerdtreetoggle on/off
noremap <F7> :NERDTreeToggle<CR>
"noremap <C-d> :NERDTreeToggle<CR>

"CLANG FORMAT KEYS
" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>f :ClangFormatAutoToggle<CR>
"nmap <Leader>F :ClangFormat<CR> format whole file
nmap <Leader>F :ClangFormatAutoDisable<CR>

"FUNCTIONS

"move lines up and down without delete and paste
"**up requies 2 spaces down 1 for some reason
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+1<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>-1<cr>gv=gv

"SnipRun
nnoremap <leader>ff <Plug>SnipRun
nnoremap <leader>f <Plug>SnipRunOperator
vmap f <Plug>SnipRun

"COC tab completion. Uses <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()
