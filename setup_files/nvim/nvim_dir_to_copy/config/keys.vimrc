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
nnoremap <F9> :ALEDetail<CR>
nnoremap <leader>lD :ALEGoToDefinition<CR>
nnoremap <leader>lX :ALEFindReferences<CR>
nnoremap <leader>lH :ALEHover<CR>
nnoremap <leader>lS :ALESymbolSearch<CR>

"ale error skip to
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"VISTA Keys
"
"to toggle Vista window on/off.
nnoremap <F8> :Vista lcn<CR>

"LANGUAGECLIENT-NEOVIM Keys
nnoremap <F3> :call LanguageClient_contextMenu()<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  "Allows LSP shortcuts for cpp or c. Add more file types for different
  "languages"
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END

"Use C-p and C-n instead tab is used for too many other things
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>" Use if only one
" available
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"nerdtreetoggle on/off
noremap <F7> :NERDTreeToggle<CR>
"noremap <C-d> :NERDTreeToggle<CR>

"FORMAT SETTINGS

set shiftwidth=4
"smartindent context based indenting can be problematic
set nosmartindent
"cindent=strict c version of smartindent
set cindent
set tabstop=4
"expandtab=all tab characters converted to spaces tabstop indicates
set expandtab
"basic indenting. keeps whatever indent the line above has
set autoindent

"if # key is used for commmenting uncomment below to stop indenting
"set cinkeys -=0#
"set indentkeys -=0#
"
"-= is subtract match, 0 is only if first char switch

"sets tabs to display as > (or ^| if not nvim) and - for spaces. Ends of lines
"should be & but not seen in nvim
:set list

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
