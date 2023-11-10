" Plugins {{{
"Required
call plug#begin('~/.config/nvim/plugged')
" Aesthetics
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'romainl/vim-cool'

" Using Tim
Plug 'https://git.sr.ht/~tim-clifford/vim-venus'

" Latex
Plug 'lervag/vimtex'

" Snippets
Plug 'SirVer/ultisnips'

" Git
Plug 'airblade/vim-gitgutter'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'williamboman/nvim-lsp-installer'

" Java
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'

" Movement
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" C 
Plug 'jakemason/ouroboros'

" Fun
Plug 'ThePrimeagen/vim-be-good'

" Required
call plug#end()
" }}}

" General {{{
set exrc
set secure

" Colors
syntax enable
highlight Normal ctermbg=NONE
highlight Normal guibg=NONE
set termguicolors

" Formatting
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0
set textwidth=120
set foldenable
set foldmethod=marker
set linebreak

" Visual
set incsearch nohlsearch
set foldmethod=marker
set noshowmode
set number
set guicursor=
set list
set scrolloff=8
set signcolumn=yes
set colorcolumn=120


fun! SetRelativenumber()
    if &filetype != "help"
        set relativenumber
    endif
endfun
autocmd BufEnter,FocusGained * call SetRelativenumber()
autocmd BufLeave,FocusLost   * set norelativenumber

" Misc
set undodir=~/.local/share/nvim/undo
set undofile
set hidden
set shortmess+=F
set nrformats+=alpha
set shortmess+=c
syntax enable
filetype indent on
set autoindent
set clipboard+=unnamedplus

let mapleader=' '
" }}}

" Mappings {{{
" General
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz
map <leader>v <cmd>vsplit<CR><C-W><C-W>
map <leader>h <cmd>split<CR><C-W><C-W>
map <leader>fe <cmd>Ex<CR>

" Buffers
map <leader>bn <cmd>bnext<CR>
map <leader>bp <cmd>bprev<CR>
map <leader>bd <cmd>bdelete<CR>
map <leader>bb <cmd>buffers<CR>:buffer<Space>

" Terminal
map <leader>t <cmd>terminal<CR>

" Ouroboros
autocmd! Filetype c,cpp map <leader>s :Ouroboros<CR>

" Terminal
map <leader>t <cmd>terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Telescope find files command-line sugar.
map <leader>ff <cmd>Telescope find_files<CR>
map <leader>fg <cmd>Telescope live_grep<CR>
map <leader>fb <cmd>Telescope buffers<CR>
map <leader>fh <cmd>Telescope help_tags<CR>

" LSP things
map <leader>gd :lua vim.lsp.buf.definition()<CR>
map <leader>gu :lua vim.lsp.buf.references()<CR>
map <leader>gr :lua vim.lsp.buf.rename()<CR>

map <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
map <leader>gj :lua vim.lsp.buf.implementation()<CR>
map <leader>gt :lua vim.lsp.buf.type_definition()<CR>
" }}}

" Snippets {{{
let g:UltiSnipsSnippetDirectories=["mySnippets","UltiSnips"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }}}

" Venus {{{
nnoremap <leader>vd :let g:pandoc_defaults_file = '~/.config/pandoc/pandoc.yaml'
nnoremap <leader>vl :let g:pandoc_defaults_file = '~/.config/pandoc/pandoc_light.yaml'
let g:pandoc_defaults_file = '~/.config/pandoc/pandoc.yaml'
let g:pandoc_header_dir = '~/.config/pandoc/headers'
let g:pandoc_options = ''
" }}}

" Completion {{{
set completeopt=menu,menuone,noselect

lua <<EOF
    -- Setup nvim-cmp.
    local cmp = require'cmp'
    local select_opts = {behavior = cmp.SelectBehavior.Select}
    local lspkind = require('lspkind')

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["UltiSnip#Anon"](args.body) -- `ultisnips`
            end,
        },
        mapping = {
            ['<C-n>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            
            ['<CR>'] = cmp.mapping.confirm({select = true }),

            ['<Tab>'] = cmp.mapping(function(fallback)
                local col = vim.fn.col('.') - 1

                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                else
                    cmp.complete()
                end
            end, {'i', 's'}),
            
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                local col = vim.fn.col('.') - 1

                if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                else
                    fallback()
                end
            end, {'i', 's'}),
        },
        formatting = {
            format = lspkind.cmp_format {
                mode = 'symbol',
                with_text = true,
                menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    path = "[path]",
                },
            },
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' },
        }, {
            { name = 'buffer' },
        }),
        experimental = {
            ghost_text = true
        }
    })

    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
EOF

" }}}

" Lspconfig {{{
lua require('nvim-lsp-installer').setup({automatic_installation = true})
lua require('lspconfig').jdtls.setup{}
lua require('lspconfig').html.setup{}
lua require('lspconfig').cssls.setup{}
lua require('lspconfig').vimls.setup{}
lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').eslint.setup{}
lua require('lspconfig').bashls.setup{}
lua require('lspconfig').clangd.setup{}
" }}}

" Lightline config {{{
set laststatus=2
set noshowmode
let g:lightline = {                                                                                
  \   'colorscheme': 'default',                                                                    
  \   'active': {                                                                                  
  \     'left':[ [ 'mode', 'paste' ],                                                              
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]                               
  \     ]                                                                                          
  \   },                                                                                           
    \   'component': {                                                                             
    \     'lineinfo': '%3l:%-2v',                                                                  
    \   },                                                                                         
  \   'component_function': {                                                                      
  \     'gitbranch': 'fugitive#head',                                                              
  \   }                                                                                            
  \ }                                                                                              
let g:lightline.separator = {                                                                      
    \   'left': "\ue0b0", 'right': "\ue0b2"                                                        
  \}                                                                                               
let g:lightline.subseparator = {                                                                   
    \   'left': "\ue0b1", 'right': "\ue0b3"                                                        
  \}
" }}}

" Dracula {{{
colorscheme dracula
" }}}

" Rainbow Parentheses {{{
let g:rainbow_active = 1
" }}}
