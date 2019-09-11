"PLUGIN INSTALLS
"use :PlugInstall! and PlugUpdate to install or update

"begin plugin call
call plug#begin()
"LSP enabled tagbar. fork of original tagbar
Plug 'liuchengxu/vista.vim'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

"snippet plugin python based
Plug 'SirVer/ultisnips'

"Python,Elixir,Falcon,HTML,Django,Javascript,Markdown,PHP,Ruby,
"Scala,Supercolider Snippets for ultisnips to use
Plug 'honza/vim-snippets'

"adds better status bar powerline is an alternative but heavier
Plug 'vim-airline/vim-airline'
"adds buffer number to window tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"multiple cursor plugin. haven't been using
"Plug 'terryma/vim-multiple-cursors'
"filetree browser for quick edits/visual inspection
Plug 'scrooloose/nerdtree'

"allows addition of characters to both sides of selected text. switched to
"using mapings to generate. other functions not used
"Plug 'tpope/vim-surround'
"makes repeat '.' work after a plugin map for entire mapping rather than only
"the native command in the map.
Plug 'tpope/vim-repeat'

"adds emacs style kill ring to vim
Plug 'vim-scripts/YankRing.vim'

"Async Linter Engine
Plug 'w0rp/ale'

"clang-format plugins. vimproc is a an async library, operator is a setup
"plugin for operator keys
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/vimproc.vim'
Plug 'kana/vim-operator-user'

"LanguageClient-neovim. LSP integration with neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


"git plugins not being used yet

"moved to LSP no longer use for tag manager
"browse tags in file use :TagbarToggle<CR> to see. Mapped to F8 above
"needs universal ctags(recommended) or other ctag manager to work
"Plug 'majutsushi/tagbar'
"tag management
""Plug 'ludovicchabant/vim-gutentags'
"shows lines that differ or to be updated, git only
"Plug 'airblade/vim-gitgutter'
"shows lines that differ or to be updated, for multiple VCS
"Plug 'mhinz/vim-signify'
"git wrapper for vim
"Plug 'tpope/vim-fugitive'

"COC uninstalled due to inabilty to autocomplete from LSP. May change w/o
"Centos

"COC install. Requires nodejs to be installed first. use release branch for
"easier install.Use command below to use source code install (must have yarn
"nodejs and npm installed)
"$curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

"Use release branch
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Or build from source code
""Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"use CocConfig to open user config file for COC"

"vim-lsp removed for Language Client. Never worked with clangd, cquery
"language servers"

"vim-lsp for language server protocol client. async is a seperate, but
"required plugin for neovim vim8 async normalization. Also requires plugin for
"deoplete to use it as a source.
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"ALE is used for diagnostics. Gives warnings/errors w/o flags ALE has setup
"for clang
""Plug 'lighttiger2505/deoplete-vim-lsp'
call plug#end()

"example Plug
"Plug 'junegunn/vim-easy-align'

"example unmanaged plugin (manually installed and updated
"Plug '~/my-prototype-plugin'

"see https://github.com/junegunn/vim-plug for other options

