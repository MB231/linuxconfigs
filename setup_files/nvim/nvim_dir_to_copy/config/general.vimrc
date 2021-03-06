"STYLE

"set line numbers as default
set number
"HIGHLIGHT LONG LINES

"set a colored column for all lines over 80 chars long. set columns sets for
"wrap length. set wrap lbr will wrap long lines automatically. Comments may
"wrap automatically (as in this init file) but not outside of them.
autocmd FileType cpp set colorcolumn=80
autocmd FileType c set colorcolumn=80
autocmd FileType python set colorcolumn=120

"changes color cterm=colorterminal gui=gui vim fg=foreground bg=background
"i.e. ctermfg or guibg. (fg is text generally) ColorColumn is the group this 
"is changed. May be "Normal or Cursor for different highlighting groups. May 
"also use bold or italic to change text. {black,darkblue,darkgreen,darkcyan,
"darkred,darkmagenta,brown,grey,darkgrey,blue,green,cyan,red,magenta,yellow
",white}
highlight ColorColumn ctermbg=red ctermfg=blue cterm=italic
"highlight ColorColumn guibg=blue guifg=blue gui=italic

"syntax only highlights chars past 120 (FUSE) not a solid single column
"too noisy added colorcolumn on filetype with muted color instead
"hi LineTooLong cterm=italic ctermbg=grey ctermfg=black cterm=italic
":match LineTooLong /\%>120v.\+/

"vim spell check 
set spelllang=en
set spellfile=$HOME/.config/nvim/config/en.utf-8.add

"sets on as default
"set spell

"Enable spell only for certain files
"Use :set filetype?  to find what filetype is detected to add to this list
autocmd FileType vimwiki setlocal spell
