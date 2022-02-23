set termguicolors

call plug#begin()

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/vim-vsnip'

Plug 'Shougo/echodoc.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'justinmk/molokai'

Plug 'machakann/vim-highlightedyank'

Plug 'mhinz/vim-startify'

Plug 'ntpeters/vim-better-whitespace'

Plug 'liuchengxu/vim-which-key'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'romgrk/barbar.nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'

call plug#end()

" DAP settings
lua require('dap-python').setup('/usr/bin/python3')
lua require('cpp_dap').setup()
lua require("nvim-dap-virtual-text").setup()

" Colors
colorscheme molokai

lua require'colorizer'.setup()

hi NeomakeErrorSign guifg=#F92672
"hi NeomakeWarningSign

"BarBar colors
highlight BufferCurrent             guifg=#9CFFD3 guibg=#202020
highlight link BufferCurrentMod     BufferCurrent
highlight link BufferCurrentSign    BufferCurrent
highlight BufferCurrentTarget       guifg=#202020 guibg=#FFBA68
highlight BufferInactive            guifg=#F8F8F2 guibg=#444444
highlight link BufferInactiveMod    BufferInactive
highlight link BufferInactiveSign   BufferInactive
highlight link BufferInactiveTarget BufferCurrentTarget
highlight link BufferVisible        BufferInactive
highlight link BufferVisibleMod     BufferVisible
highlight link BufferVisibleSign    BufferVisible
highlight link BufferVisibleTarget  BufferInactiveTarget
highlight BufferTabpages            guibg=#ff0000 guifg=#ff0000

"Built-in terminal colors
let g:terminal_color_0  = '#1B1D1E'
let g:terminal_color_1  = '#B60050'
let g:terminal_color_2  = '#88BB22'
let g:terminal_color_3  = '#C47F2C'
let g:terminal_color_4  = '#30309B'
let g:terminal_color_5  = '#7E40A5'
let g:terminal_color_6  = '#4699AF'
let g:terminal_color_7  = '#9999AA'
let g:terminal_color_8  = '#7E8E91'
let g:terminal_color_9  = '#F92672'
let g:terminal_color_10 = '#80FF00'
let g:terminal_color_11 = '#FFBA68'
let g:terminal_color_12 = '#7070F0'
let g:terminal_color_13 = '#BB88DD'
let g:terminal_color_14 = '#66D9EF'
let g:terminal_color_15 = '#F8F8F2'

"Unset cursor line bg color (only highlight the line number)
hi CursorLine guifg=NONE guibg=NONE
set cursorline

set mouse=a

" Don't check if python 3 is installed when starting
let g:python3_host_skip_check = 1

" Set terminal window title
set title

"Share clipboard with Xorg
set clipboard=unnamedplus

" Keep cursor column when moving
set virtualedit=all
" Even when linewrapping
nnoremap j gj
nnoremap k gk

" Don't redraw while executing macros (good performance config)
set lazyredraw

" use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/zed/.vimundo/

"set relativenumber
set number

set ignorecase
set smartcase

set icm=nosplit
"set guicursor=

set listchars+=eol:⮠

" set vert split char
set fillchars=vert:┃

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" size of a hard tabstop
set tabstop=2

" size of an 'indent'
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

set expandtab
set smarttab

" Allow switching buffers when stuff is not saved
set hidden

" Completion options

set complete+=k
set completeopt=menu,menuone,noselect
"disable 'matched 1 of 3' messages
set shortmess+=c

"--- Airline

" Do not show current vim mode in cmd line anymore
set noshowmode

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Remove bold from linenr
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('colnr', 'none')
"call airline#parts#define_accent('maxlinenr', 'none')

"--- BarBar

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" No nerdfont icons
let bufferline.icons = v:false
let bufferline.icon_close_tab = '✕'
let bufferline.icon_close_tab_modified = ''
let bufferline.icon_pinned = '↨'

"--- Cmp
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

"--- Echo doc

let g:echodoc_enable_at_startup = 1

"--- LSP

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
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
  }
require'lspconfig'.pylsp.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
}
EOF

"Record wardnings and errors to the quickfix list
lua << EOF
do
  local method = "textDocument/publishDiagnostics"
  local default_callback = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, method, result, client_id)
    default_callback(err, method, result, client_id)
    if result and result.diagnostics then
      local uri = result.uri
      local bufnr = vim.uri_to_bufnr(uri)
      for _, v in ipairs(result.diagnostics) do
        v.bufnr = bufnr
        v.lnum = v.range.start.line + 1
        v.col = v.range.start.character + 1
        v.text = v.message
      end
      table.sort(result.diagnostics, function (d1, d2) return d1.lnum < d2.lnum end)

      --- Restore current index when we generate a new one
      local prev_idx = vim.fn.getqflist({idx = 0}).idx

      vim.lsp.util.set_qflist(result.diagnostics)
      vim.fn.setqflist({}, 'a', {idx = prev_idx})
    end
  end
end
EOF

"Use loclist instead of quickfix for `find references`
lua << EOF
vim.lsp.handlers['textDocument/references'] =  function(_, _, result)
  if not result then return end
  vim.lsp.util.set_loclist(vim.lsp.util.locations_to_items(result))
  vim.api.nvim_command("lopen")
  vim.api.nvim_command("wincmd p")
end
EOF

"--- Treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

"--- Restore cursor on exit
au VimLeave * set guicursor=a:block-blinkon1

"-----------------------------------------------------------------------------
" Keybindings
"-----------------------------------------------------------------------------

" Define prefix dictionary (whichkey plugin)
let g:which_key_map =  {}

" Remap macro repeat
nnoremap <silent> § @@<CR>

let mapleader = " "

" Make it so Space creates folds in virtual mode. And open and closes them in
" normal mode if it's in a fold otherwise it uses it's default behavior
nnoremap <silent> <leader>f @=(foldlevel('.')?'za':'l')<CR>
vnoremap <leader>f zf
let g:which_key_map.f = 'fold/unfold'

" Make navigating wraped lines easier
"nnoremap <expr> j v:count ? 'j' : 'gj'
"nnoremap <expr> k v:count ? 'k' : 'gk'

" Quickly open/reload vim
nnoremap <leader>uo :split $MYVIMRC<CR>
nnoremap <leader>us :source $MYVIMRC<CR>
let g:which_key_map.u = { 'name' : '+file' }
let g:which_key_map.u.o = 'open vimrc'
let g:which_key_map.u.s = 'source vimrc'

" Maximize split
nnoremap <leader>m :only<CR>
let g:which_key_map.m = 'maximize split'

nnoremap <leader>xx :lopen<CR>
nnoremap <leader>xc :cw<CR>
let g:which_key_map.x = { 'name' : '+lists' }
let g:which_key_map.x.x = 'open location list'
let g:which_key_map.x.c = 'open quickfix list'

" BarBar keybinds

nnoremap <leader>w :BufferPick<CR>
nnoremap <leader>p :BufferPin<CR>
let g:which_key_map.w = 'BarBar pick buffer'
let g:which_key_map.p = 'BarBar pin buffer'

" Telescope keybinds

nnoremap <leader>c :Telescope live_grep<CR>
nnoremap <leader>s :Telescope lsp_references<CR>
nnoremap <leader>x :Telescope diagnostics bufnr=0<CR>
"nnoremap <leader>b :Clap buffers<CR>
nnoremap <leader>e :Telescope git_files<CR>
let g:which_key_map.c = 'Telescope live grep'
let g:which_key_map.s = 'Telescope lsp references'
let g:which_key_map.x = 'Telescope lsp diag'
"let g:which_key_map.b = 'Clap buffers'
let g:which_key_map.e = 'Telescope git files'

" DAP keybinds
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> ö :lua require'dap'.step_over()<CR>
nnoremap <silent> ä :lua require'dap'.step_into()<CR>
nnoremap <silent> å :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dh :lua require'dap.ui.widgets'.hover()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.repl.toggle()<CR>
nnoremap <silent> <leader>dr :lua require'dap'.run_last()<CR>

let g:which_key_map.b = 'Set breakpoint'
let g:which_key_map.B = 'Set breakpoint (condition)'
let g:which_key_map.lp = 'Set logpoint'
let g:which_key_map.dh = 'DAP var hover'
let g:which_key_map.dl = 'DAP repl open'
let g:which_key_map.dr = 'DAP run last'

" LSP keybinds
nnoremap <leader>gc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gf <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader><leader> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ls  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>r  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>q <cmd>lua vim.lsp.buf.code_action_first()<CR>

let g:which_key_map.g = { 'name' : '+LSP_goto' }
let g:which_key_map.g.c = 'LSP goto declaration'
let g:which_key_map.g.f = 'LSP goto definition'
let g:which_key_map.g.i = 'LSP goto implementation'
let g:which_key_map.g.t = 'LSP goto typedef'
let g:which_key_map.g.r = 'LSP find references'

let g:which_key_map[" "] = 'LSP hover'
let g:which_key_map.ls = 'LSP signature help'
let g:which_key_map.r = 'LSP rename'
let g:which_key_map.h = 'LSP show line diag'
let g:which_key_map.a = 'LSP code action'
let g:which_key_map.q = 'LSP code action first'

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey " "<CR>

" Misc keys

" F1: Toggle the visable tabspaces
map <F1> :set list!<CR>

" F2: Comment selected Block with #'s
map <F2> :s/^\(.*\)$/#\1/g<CR>

" F3: Uncomment selected Block thats commented with #'s
map <F3> :s/^#//g<CR>

" F11: Toggle cursorcolumn
imap <silent> <F11> <ESC>:set cursorcolumn!<CR>a
map <silent> <F11> :set cursorcolumn!<CR>

"--- Clang Format

function! Formatonsave()
  let l:lines = "all"
  let g:clang_format_style = "file"
  py3f /home/zed/clang_format.py
endfunction

"Disable with :noa w
autocmd BufWritePre *.h,*.hh,*.hpp,*.c,*.cc,*.cpp,*.m,*.mm,*.glsl,*.osl call Formatonsave()
