"REMAPS

"<mode>map - standard map recusive
"<mode>noremap - map not recursive
"<mode>unmap - unmap a key so it is not used
"n (normal), i (insert/replace), v (visual/select), x (visual), s (select)
"c (command line mode), o (operator pending)

"let is for setting variables and set is for setting options

"leader key for use in functions as a corded key to activated
let mapleader="\<Space>"
"half page up down remap
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
"esc key remaps
inoremap jk <Esc>
inoremap kj <Esc>

"autoclose
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>

"to toggle ALE Detail
nnoremap <F9> :ALEDetail<CR>

"to toggle tagbar on/off.
nnoremap <F8> :TagbarToggle<CR>

"S-Tab autocomplete with deoplete plugin. Left Tab in case of makefile use.
"**Tab example below using up through list command remap
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

"nerdtreetoggole on/off
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


"FUNCTIONS

"move lines up and down without delete and paste
"**up requies 2 spaces down 1 for some reason
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+1<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>-1<cr>gv=gv
