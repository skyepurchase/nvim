-- init.lua

-- source current vimscript config
vim.cmd('source ~/.config/nvim/old.vim')

-- source config files
require "plug-conf"
require "completion"
require "telescope-conf"
require "lsp-conf"
require "aglea"
-- require "image-conf"
-- require "molten-conf"
-- require "jupytext-conf"
-- require "quarto-conf"
-- require "ts-conf"
require "jupynium-conf"
