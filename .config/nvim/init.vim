" This enables terminal to use more then 16 colors. 
set termguicolors
set encoding=UTF-8

" Plugins. 
call plug#begin()
" Make sure to install nerd-fonts on the system: https://github.com/ryanoasis/nerd-fonts#font-installation
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'ryanoasis/vim-devicons'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/vim-vsnip'

Plug 'vim-airline/vim-airline'

Plug 'mhinz/vim-startify'

Plug 'ntpeters/vim-better-whitespace'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'romgrk/barbar.nvim'

Plug 'nvim-telescope/telescope.nvim'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'

call plug#end()


"Highlights yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

" Load .vimrc file
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Colorscheme
colorscheme dracula
