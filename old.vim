" Plugins {{{
"Required
call plug#begin('~/.config/nvim/plugged')
" Aesthetics
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'romainl/vim-cool'
Plug 'tjvr/vim-nearley' " Highlighting Nearley.js .ne files

" Using Tim
Plug 'https://git.sr.ht/~ecc/vim-venus'

" Latex
Plug 'lervag/vimtex'

" Snippets
" Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Java
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'

" C 
Plug 'jakemason/ouroboros'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Markdown
Plug 'preservim/vim-markdown'

" Movement
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

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
set foldenable
set foldmethod=marker
set linebreak

" Visual
set incsearch
set foldmethod=marker
set noshowmode
set number
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
set list
set scrolloff=8
set signcolumn=yes

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
nnoremap n nzz
nnoremap N Nzz

nnoremap <CR> <cmd>noh<CR><CR>
map <leader>wv <cmd>vsplit<CR><C-W><C-W>
map <leader>wh <cmd>split<CR><C-W><C-W>
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

" Git Gutter
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hp <Plug>(GitGutterPrevHunk)
nmap <leader>hh <Plug>(GitGutterPreviewHunk)

" LSP things
map <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
map <leader>gu <cmd>lua vim.lsp.buf.references()<CR>
map <leader>gr <cmd>lua vim.lsp.buf.rename()<CR>

map <leader>gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
map <leader>gj <cmd>lua vim.lsp.buf.implementation()<CR>
map <leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>

map <leader>ls <cmd>lua vim.diagnostic.open_float()<CR>
" Can be made more specific or repeat this command for different plugins
map <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>

"au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
"au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
" }}}

" Git Gutter {{{
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_modified_removed = '|'
au VimEnter * GitGutterLineNrHighlightsEnable
au VimEnter * highlight link GitGutterAddLineNr DiffAdd
au VimEnter * highlight link GitGutterChangeLineNr DiffChange
au VimEnter * highlight link GitGutterDeleteLineNr DiffDelete
set foldtext=gitgutter#fold#foldtext()
" }}}

" Snippets {{{
let g:UltiSnipsSnippetDirectories=["mySnippets","UltiSnips"]
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:UltiSnipsEditSplit = 'vertical'
" }}}

" Venus {{{
nnoremap <leader>vd :let g:pandoc_defaults_file = '~/.config/pandoc/pandoc.yaml'<CR>
nnoremap <leader>vl :let g:pandoc_defaults_file = '~/.config/pandoc/pandoc_light.yaml'<CR>
let g:pandoc_defaults_file = '~/.config/pandoc/pandoc.yaml'
let g:pandoc_header_dir = '~/.config/pandoc/headers'
let g:pandoc_options = ''
" }}}

" Aglaea {{{
au FileType markdown set conceallevel=2
let g:vim_markdown_conceal = 1
let g:vim_markdown_math = 1

let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
let g:vim_markdown_autowrite = 1

let g:vim_markdown_strikethrough = 1

" This is crude, what about .mark, or .markdown?
" TODO: Capitalise headers
au BufNewFile *.md :call Create()

function! Create()
    let filename = substitute(expand("%:t"), ".md", "", "")
    if (getline("1") !~ "# ".filename)
        exe "normal!ggO# ".filename
        exe "normal!ggw~"
    endif
endfunction
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
  \     'gitbranch': 'FugitiveHead',                                                              
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
