"STYLE

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
hi LineTooLong cterm=italic ctermbg=grey ctermfg=black
:match LineTooLong /\%>120v.\+/

"vim spell check 
set spelllang=en
set spellfile=$HOME/.config/nvim/config/en.utf-8.add
"sets on as default
"set spell
"Enable spell only for certain files
"Use :set filetype?  to find what filetype is detected to add to this list
autocmd FileType vimwiki setlocal spell
