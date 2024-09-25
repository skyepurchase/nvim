-- init.lua

-- source current vimscript config
vim.cmd('source ~/.config/nvim/old.vim')

-- source config files
require "completion"
require "lsp"
