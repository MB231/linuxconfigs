"MULTIPLE VIM INSTANCES ON SAME FILE CONFIG

"**must enable focus events in tmux with 
"(set -g focus-events on) in .tmux.conf
"check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
"disable swapfile to avoid errors on load set noswapfile
"enable refresh (using checktime) everytime cursorhold (4s stationary cursor).
"This time length is configurable with updatetime. au=autocmd
au CursorHold,CursorHoldI * checktime


"STYLE AND REMAPS

"set line numbers as default
set number

"HIGHLIGHT LONG LINES

"set a colored column for all lines over 80 chars long. set columns sets for
"wrap length. set wrap lbr will wrap long lines automatically. Comments may
"wrap automatically (as in this init file) but not outside of them.
"old syntax. now using LineTooLong Highlight group 
"set colorcolumn=80

"changes color cterm=colorterminal gui=gui vim fg=foreground bg=background
"i.e. ctermfg or guibg. (fg is text generally) ColorColumn is the group this 
"is changed. May be "Normal or Cursor for different highlighting groups. May 
"also use bold or italic to change text. {black,darkblue,darkgreen,darkcyan,
"darkred,darkmagenta,brown,grey,darkgrey,blue,green,cyan,red,magenta,yellow
",white}
"old syntax. Now using LineTooLong
"highlight ColorColumn ctermbg=gray ctermfg=red cterm=italic

"new syntax only highlights chars past 120 (FUSE) not a solid single column
hi LineTooLong cterm=italic ctermbg=grey ctermfg=red
:match LineTooLong /\%>120v.\+/

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

"S-Tab autocomplete with deoplete plugin. Left Tab in case of makefile use.
"**Tab example below using up through list command remap
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

"nerdtreetoggole on/off
map <C-d> :NERDTreeToggle<CR>

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

"PLUGIN INSTALLS
"use :PlugInstall! and PlugUpdate to install or update

"begin plugin call
call plug#begin()

"example Plug
"Plug 'junegunn/vim-easy-align'
"
"example unmanaged plugin (manually installed and updated
"Plug '~/my-prototype-plugin'
"
"see https://github.com/junegunn/vim-plug for other options
"

"Python,Elixir,Falcon,HTML,Django,Javascript,Markdown,PHP,Ruby,
"Scala,Supercolider Snippets 
Plug 'honza/vim-snippets'
"clang based auto complete, YouCompleteMe more full featured, but
"not async and complicated. Requires neovim/vim8 if vim8 other 
"plugins required and python3.
"$pip3 install --user --upgrade pynvim //use to update neovim python module
if has('nvim')
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
else
	Plug 'Shouga/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
"browse tags in file
Plug 'majutsushi/tagbar'
"tag management
Plug 'ludovicchabant/vim-gutentags'
"adds better status bar powerline is an alternative but heavier
Plug 'vim-airline/vim-airline'
"multiple cursor plugin
Plug 'terryma/vim-multiple-cursors'
"filetree browser for quick edits/visual inspection
Plug 'scrooloose/nerdtree'
"allows addition of characters to both sides of selected text
Plug 'tpope/vim-surround'
"adds repeat . support for surround.vim speeddating.vim unimpaired.vim
"and vim-easyclip.vim
Plug 'tpope/vim-repeat'
"adds emacs style kill ring to vim
Plug 'vim-scripts/YankRing.vim'

"removed to see if I can replicate format natively
"format/style configuration editor can trim whitespace, tab width, indent
"max line and others.
"Plug 'editorconfig/editorconfig-vim'


"git plugins not being used yet
"shows lines that differ or to be updated, git only
"Plug 'airblade/vim-gitgutter'
"shows lines that differ or to be updated, for multiple VCS
"Plug 'mhinz/vim-signify'
"git wrapper for vim
"Plug 'tpope/vim-fugitive'

call plug#end()
