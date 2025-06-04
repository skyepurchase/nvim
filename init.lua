-- init.lua

-- source config files
require "lazy-conf"
require "aglea"
require "key-conf"

-- source current vimscript config
vim.cmd('source ~/.config/nvim/old.vim')
