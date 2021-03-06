"Place for plugin configs that are too long for plugins.vimrc

"VIM WIKI - options from Markdown (markdown) or MediaWiki(media) can be used
"rather than VimWiki(default) **NOTE TRAILING SLASH
"Note wiki.syntax can't be set for some reason and markdown incompatible with html
"conversion at this time 4-30-2020
let wiki_default = {}
let wiki_default.auto_export = 0
let wiki_default.auto_toc = 0
let wiki_default.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}

let default_wiki = copy(wiki_default)
let default_wiki.path = '~/vimwiki/'
let default_wiki.diary_rel_path = 'logbook/'
let default_wiki.path_html = '~/vimwiki/vimwiki_html/'

let fuse_wiki = copy(wiki_default)
let fuse_wiki.path = '~/fuseWiki/'
let fuse_wiki.diary_rel_path = 'logbook/'
let fuse_wiki.path_html = '~/fuseWiki/fuseWiki_html/'

let g:vimwiki_list = [default_wiki, fuse_wiki]

"Alternative multiwiki syntax2
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki/vimwiki_html/', 'syntax': 'markdown', 'ext': '.md'},
"                     \ {'path': '~/fuseWiki/', 'path_html': '~/fuseWiki/fuseWiki_html/', 'syntax': 'markdown', 'ext': '.md'}]

"Alternative multiwiki syntax1
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]


"MINIYANK CONFIG
"persistant clipboard even for reboots
let g:miniyank_filename = $HOME."/.miniyank.mpack"
"number of items held default 10
let g:miniyank_maxitems = 20
"max lines yankable. default 1000
let g:miniyank_delete_maxlines = 1000

"ALE LINTER CONFIG
"LSP to be handled by LanguageClient
let g:ale_disable_lsp = 1

"cppcheck excluded due to excessive cpu usage
let g:ale_linters = {
                \ 'cpp':['gcc', 'clangtidy'],
                \ 'c':['gcc', 'clangtidy'],
                \ 'python':['pyls', 'flake8'],
                \ 'javascript':['flow'],
                \ }
"express ignore though explicit should prevent this
let g:ale_linters_ignore = {
                \ 'javascript':['tsserver'],
                \ }
" ignore line too long. alternatively change ~.config/flake8 for flake8 global config
let g:ale_python_flake8_options = '--ignore=e501'

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
"lets deoplete do all completion
let g:ale_completion_enabled = 0
"lint on insert
let g:ale_lint_on_insert_leave = 1
"* When you modify a buffer.                - |g:ale_lint_on_text_changed|
"* On leaving insert mode.                  - |g:ale_lint_on_insert_leave|
"* When you open a new or modified buffer.  - |g:ale_lint_on_enter|
"* When you save a buffer.                  - |g:ale_lint_on_save|
"* When the filetype changes for a buffer.  - |g:ale_lint_on_filetype_changed|
"* If ALE is used to check code manually.   - |:ALELint|

"ale notify settings
let g:ale_set_highlights = 1
let g:ale_echo_cursor = 1
let g:ale_set_signs = 1
let g:ale_set_virtualtext_cursor = 1
"* By updating loclist. (On by default)                                  - |g:ale_set_loclist|
"* By updating quickfix. (Off by default)                                - |g:ale_set_quickfix|
"* By setting error highlights.                                          - |g:ale_set_highlights|
"* By creating signs in the sign column.                                 - |g:ale_set_signs|
"* By echoing messages based on your cursor.                             - |g:ale_echo_cursor|
"* By inline text based on your cursor.                                  - |g:ale_virtualtext_cursor|
"* By displaying the preview based on your cursor.                       - |g:ale_cursor_detail|
"* By showing balloons for your mouse cursor. Doesn't work w/o gui       - |g:ale_set_balloons|

"cpp linter options NO LONGER USED FOR REF ONLY
"can also set with list if a list of strings expected let g:ale-gcc-options: {"option": "optionchoice", "otheroption" : "optionchoice"}
"let g:ale_cpp_gcc_options = '-std=c++11 -Wall -pedantic -Wextra -Wunused-variable Wunused-parameter fstack-protector -Wold-style-cast -Wunreachable-code -Wuninitialized -Werror'
"let g:ale_cpp_clang_options = '-std=c++11 -stdlib=libc++ -Wall -pedantic -Wextra -Wunused-variable Wunused-parameter fstack-protector -Wold-style-cast -Wunreachable-code -Wuninitialized -Werror'
"let g:ale_cpp_cppcheck_options = '--enable=all --inconclusive --inline-suppr'

"NOTE Use of auto commands loaded as need :call filename#funcname() for function in <runtime path>/autoload/filename.vim
"   can be used with subdirectories as in :call foo#bar#func() and vim will look for the file "autoload/foo/bar.vim" in
"   'runtimepath' path is generally ~/.config/nvim/autoload/ see :help
"   autoload for further detail


"ALE LINTER DEFINES
"TODO ADD C defines similiar to cpp versions
"CLANGTIDY
" Author: vdeurzen <tim@kompiler.org>, w0rp <devw0rp@gmail.com>,
" gagbo <gagbobada@gmail.com>
" Description: clang-tidy linter for cpp files

call ale#Set('cpp_clangtidy_executable', 'clang-tidy')
" Set this option to check the checks clang-tidy will apply.
call ale#Set('cpp_clangtidy_checks', [])
" Set this option to manually set some options for clang-tidy to use as compile
" flags.
" This will disable compile_commands.json detection.
call ale#Set('cpp_clangtidy_options', '')
" Set this option to manually set options for clang-tidy directly.
call ale#Set('cpp_clangtidy_extra_options', '')
call ale#Set('c_build_dir', '')

function! ClangTidyGetCommand(buffer) abort
    let l:checks = join(ale#Var(a:buffer, 'cpp_clangtidy_checks'), ',')
    let l:build_dir = ale#c#GetBuildDirectory(a:buffer)

    " Get the extra options if we couldn't find a build directory.
    let l:options = empty(l:build_dir)
    \   ? ale#Var(a:buffer, 'cpp_clangtidy_options')
    \   : ''

    " Get the options to pass directly to clang-tidy
    let l:extra_options = ale#Var(a:buffer, 'cpp_clangtidy_extra_options')

    return '%e'
    \   . (!empty(l:checks) ? ' -checks=' . ale#Escape(l:checks) : '')
    \   . (!empty(l:extra_options) ? ' ' . ale#Escape(l:extra_options) : '')
    \   . ' %s'
    \   . (!empty(l:build_dir) ? ' -p ' . ale#Escape(l:build_dir) : '')
    \   . (!empty(l:options) ? ' -- ' . l:options : '')
endfunction

call ale#linter#Define('cpp', {
\   'name': 'clangtidy',
\   'output_stream': 'stdout',
\   'executable': {b -> ale#Var(b, 'cpp_clangtidy_executable')},
\   'command': function('ClangTidyGetCommand'),
\   'callback': 'ale#handlers#gcc#HandleGCCFormat',
\   'lint_file': 1,
\})


"CPPCHECK
" Author: Bart Libert <bart.libert@gmail.com>
" Description: cppcheck linter for cpp files

call ale#Set('cpp_cppcheck_executable', 'cppcheck')
call ale#Set('cpp_cppcheck_options', '--enable=style --inconclusive --inline-suppr')

function! CPPCHeckGetCommand(buffer) abort
    let l:cd_command = ale#handlers#cppcheck#GetCdCommand(a:buffer)
    let l:compile_commands_option = ale#handlers#cppcheck#GetCompileCommandsOptions(a:buffer)
    let l:buffer_path_include = empty(l:compile_commands_option)
    \   ? ale#handlers#cppcheck#GetBufferPathIncludeOptions(a:buffer)
    \   : ''

    return l:cd_command
    \   . '%e -q --language=c++'
    \   . ale#Pad(l:compile_commands_option)
    \   . ale#Pad(ale#Var(a:buffer, 'cpp_cppcheck_options'))
    \   . l:buffer_path_include
    \   . ' %t'
endfunction

call ale#linter#Define('cpp', {
\   'name': 'cppcheck',
\   'output_stream': 'both',
\   'executable': {b -> ale#Var(b, 'cpp_cppcheck_executable')},
\   'command': function('CPPCHeckGetCommand'),
\   'callback': 'ale#handlers#cppcheck#HandleCppCheckFormat',
\})

"GCC
" Author: geam <mdelage@student.42.fr>
" Description: gcc linter for cpp files
"
call ale#Set('cpp_gcc_executable', 'gcc')
call ale#Set('cpp_gcc_options', '--std=c++11 -Wall -pedantic -Wextra -Wunused-variable Wunused-parameter fstack-protector -Wold-style-cast -Wunreachable-code -Wuninitialized -Werror')

function! GCCGetCommand(buffer, output) abort
    let l:cflags = ale#c#GetCFlags(a:buffer, a:output)

    " -iquote with the directory the file is in makes #include work for
    "  headers in the same directory.
    "
    " `-o /dev/null` or `-o null` is needed to catch all errors,
    " -fsyntax-only doesn't catch everything.
    return '%e -S -x c++'
    \   . ' -o ' . g:ale#util#nul_file
    \   . ' -iquote ' . ale#Escape(fnamemodify(bufname(a:buffer), ':p:h'))
    \   . ale#Pad(l:cflags)
    \   . ale#Pad(ale#Var(a:buffer, 'cpp_gcc_options')) . ' -'
endfunction

call ale#linter#Define('cpp', {
\   'name': 'gcc',
\   'aliases': ['g++'],
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'cpp_gcc_executable')},
\   'command': {b -> ale#c#RunMakeCommand(b, function('GCCGetCommand'))},
\   'callback': 'ale#handlers#gcc#HandleGCCFormatWithIncludes',
\})


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


"NVIM LSP Options
"Use :LspInfo to get status of active language servers
lua << EOF
    require'lspconfig'.clangd.setup{
        cmd = { "clangd", "-j=2", "-log=verbose" }
    }
    --require'lspconfig'.pyls.setup{} pyls no longer used since it doesn't work with nvim-lsp
    require'lspconfig'.rust_analyzer.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.tsserver.setup{
        cmd = { "typescript-language-server", "--stdio" };
        -- javascript removed from filetypes, but are there as default
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" };
        --call to root_pattern doesn't seem to work but is described as default in configs
        --root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
    }
    -- 
    require'lspconfig'.flow.setup{
        cmd = { "npx", "--no-install", "flow", "lsp" };
        filetypes = { "javascript", "javascriptreact", "javascript.jsx" };
        --call to root_pattern doesn't seem to work but is described as default in configs
        --root_dir = root_pattern(".flowconfig");
    }
EOF
"AIRLINE
"extensions enabled by default, but here explicit opt in of extensions for
"faster runtime/startup reduce errors
"tabline adds buffer number to window tabline
"branch adds fugitive extension
"fugitiveline makes //**// part of buffer names disappear
let g:airline_extensions = ['tabline', 'branch', 'fugitiveline', 'fzf', 'nvimlsp', 'ale', 'keymap']
let airline#extensions#nvimlsp#error_symbol = 'LSP_E:'
let airline#extensions#nvimlsp#warning_symbol = 'LSP_W:'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#enabled = 1

"SymbolsOutline Config
lua << EOF
local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides 
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
EOF

"LSP-TROUBLE Config - NVIM LSP Diagnostic tool
"CAN'T FIND MODULE FOR SOME REASON. Works w/o
"lua << EOF
"  require("lua/trouble/trouble").setup {
    "--config goes here or is empty for defualt
  "}
"EOF


"NVIM TELESCOPE CONFIG
"
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

"----------------OLD Configs-------------------
"VISTA TAGBAR
"Indent Icon
"let g:vista_icon_indent = ["╰─> ", "├─> "]
"detailed info of current cursor symbol will be in cmd line and scroll
"let g:vista_echo_cursor_strategy = "both"
"change sidebar width from default 30
"let g:vista_sidebar_width = 50
"Toggles close window on jump
"let g:vista_close_on_jump = 1

"function! NearestMethodOrFunction() abort
  "return get(b:, 'vista_nearest_method_or_function', '')
"endfunction

"set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

