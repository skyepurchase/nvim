---@diagnostic disable: unused-local
-- treesitter.lua

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down
            },
            n = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
            }
        }
    },
}
