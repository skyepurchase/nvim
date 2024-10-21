-- init.lua

-- source current vimscript config
vim.cmd('source ~/.config/nvim/old.vim')

-- source config files
require "plug-conf"
require "completion"
require "telescope-conf"
require "lsp-conf"
require "aglea"
