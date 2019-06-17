"PLUGIN INSTALLS
"use :PlugInstall! and PlugUpdate to install or update

"must set python3 host manually in centos7 as it doesn't natively support python3
let g:python3_host_prog="/usr/bin/python3.6"

"begin plugin call
call plug#begin()
"COC install. Requires nodejs to be installed first. use release branch for
"easier install.Use command below to use source code install
"$curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

"Use release branch
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Or build from source code
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"snippet plugin python based
Plug 'SirVer/ultisnips'

"Python,Elixir,Falcon,HTML,Django,Javascript,Markdown,PHP,Ruby,
"Scala,Supercolider Snippets for ultisnips to use
Plug 'honza/vim-snippets'
"browse tags in file use :TagbarToggle<CR> to see. Mapped to F8 above
"needs universal ctags to work/
Plug 'majutsushi/tagbar'
"tag management
Plug 'ludovicchabant/vim-gutentags'
"adds better status bar powerline is an alternative but heavier
Plug 'vim-airline/vim-airline'
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

"git plugins not being used yet
"shows lines that differ or to be updated, git only
"Plug 'airblade/vim-gitgutter'
"shows lines that differ or to be updated, for multiple VCS
"Plug 'mhinz/vim-signify'
"git wrapper for vim
"Plug 'tpope/vim-fugitive'

"Deoplete-Switched to COC for its LSP functions

"clang based auto complete, YouCompleteMe more full featured, but
"not async and complicated. Requires neovim/vim8 if vim8 other 
"plugins required and python3.
"$pip3 install --user --upgrade pynvim //use to update neovim python module
"if has('nvim')
"	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
"else
"	Plug 'Shouga/deoplete.nvim'
"	Plug 'roxma/nvim-yarp'
"	Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

call plug#end()

"example Plug
"Plug 'junegunn/vim-easy-align'

"example unmanaged plugin (manually installed and updated
"Plug '~/my-prototype-plugin'

"see https://github.com/junegunn/vim-plug for other options

