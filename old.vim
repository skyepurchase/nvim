" General {{{
set exrc
set secure

" Colors
syntax enable
highlight Normal ctermbg=NONE
highlight Normal guibg=NONE
set termguicolors
colorscheme dracula

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
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

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
let g:UltiSnipsSnippetDirectories=["mySnippets",$HOME."/.config/nvim/mySnippets"]
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:UltiSnipsEditSplit = 'vertical'
" }}}

" Jupyter {{{
hi! link JupyniumCodeCellSeparator CursorLine
hi! link JupyniumMarkdownCellSeparator CursorLine
hi! link JupyniumMarkdownCellContent CursorLine
hi! link JupyniumMagicCommand Keyword
" }}}

" Aglaea (vim markdown and note taking) {{{
au FileType markdown set conceallevel=2
let g:vim_markdown_conceal = 1
let g:vim_markdown_math = 1

let g:vim_markdown_autowrite = 1

let g:vim_markdown_strikethrough = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_borderless_table = 1
" }}}

" Copilot {{{
let g:copilot_no_tab_map = v:true
" }}}
