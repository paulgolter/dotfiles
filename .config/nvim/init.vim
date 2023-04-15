" This enables terminal to use more then 16 colors.
set termguicolors
set encoding=UTF-8
" Makes mouse available in temrinal.
set mouse=a

" Make sure to install: 
" nerd-fonts: https://github.com/ryanoasis/nerd-fonts#font-installation
" clangd for lsp 
" pylsp for lsp 

" Plugins. 
call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Plug 'dracula/vim', { 'as': 'dracula' }

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

" Load .vimrc file.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

"Highlights yank.
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

" Colorscheme.
colorscheme catppuccin-macchiato

" CMP.
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },
      { name = 'path' },

      { name = 'buffer' },
    }
  })
EOF


"--- LSP
" Controls what is shown in the auto complete tab.
lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

--- lua require'lspconfig'.clangd.setup{cmd = { "clangd", "--background-index", "--cross-file-rename", "--limit-results=0" }}
require'lspconfig'.clangd.setup{
  cmd = { "clangd", "--background-index", "--cross-file-rename" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
  }
require'lspconfig'.pylsp.setup{
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
}
EOF
