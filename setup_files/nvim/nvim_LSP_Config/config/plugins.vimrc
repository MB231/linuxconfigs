"PLUGIN INSTALLS
"use :PlugInstall! and PlugUpdate to install or update

"begin plugin call
call plug#begin()
"JEDI python plugin for deoplete with palantir which JEDI uses for a LSP
Plug 'deoplete-plugins/deoplete-jedi'

"AWESOME_VIM-COLORSCHEMES
Plug 'rafi/awesome-vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'kyoz/purify'
Plug 'vim-airline/vim-airline-themes'

"VIM WIKI for notes
Plug 'vimwiki/vimwiki'

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

"adds better status bar powerline is an alternative but heavier. Most
Plug 'vim-airline/vim-airline'

"multiple cursor plugin. haven't been using
"Plug 'terryma/vim-multiple-cursors'
"
"filetree browser for quick edits/visual inspection
Plug 'scrooloose/nerdtree'

"allows addition of characters to both sides of selected text. switched to
"using mapings to generate. other functions not used
Plug 'tpope/vim-surround'

"makes repeat '.' work after a plugin map for entire mapping rather than only
"the native command in the map.
"Mappings annoying b/c of auto sorrounding when editing old code
Plug 'tpope/vim-repeat'

"yank ring plugin
Plug 'bfredl/nvim-miniyank'

"Async Linter Engine
Plug 'w0rp/ale'

"clang-format plugins. vimproc is a an async library, operator is a setup
"plugin for operator keys
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/vimproc.vim'
Plug 'kana/vim-operator-user'

"LanguageClient-neovim. LSP integration with neovim
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

"git wrapper for vim
Plug 'tpope/vim-fugitive'

"neovim LSP and config plugin
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

"native neovim LSP highlighter.
"Use :TSInstall <language> to install supported languages
"use :TSUpdate <language>. To update all parsers unconditionally, use :TSUpdate all or just :TSUpdate
":TSBufEnable <module> " enable module on current buffer
":TSBufDisable <module> " disable module on current buffer
":TSEnableAll <module> [{ft}] " enable module on every buffer. If filetype is specified, enable only for this filetype.
":TSDisableAll <module> [{ft}] " disable module on every buffer. If filetype is specified, disable only for this filetype.
":TSModuleInfo [module] " list information about modules state for each filetype
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"symbols tree similar to vista and tagbar but for neovim 0.5
Plug 'simrat39/symbols-outline.nvim'

"LSP diagnostics and references
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-trouble.nvim'

"LSP diagnostics and references
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


"git plugins not being used yet

"symbols tree similar to vista and tagbar but for neovim 0.5 -Not in use due
"to incompatibilities with fedora or issues with install
"Plug 'michaelb/sniprun', {'do': 'bash install.sh 1'}
    " use 'bash install.sh 1' to get latest version or without 1 for stable
    " or use 1 if there is trouble with precompiled library

"LSP enabled tagbar. fork of original tagbar. No longer in use after
"switch to builtin neovim lsp. Possibly will be updated to be compatible
"Plug 'liuchengxu/vista.vim'

"deprecated in favor of more used miniyank
"adds emacs style kill ring to vim
"Plug 'vim-scripts/YankRing.vim'

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

