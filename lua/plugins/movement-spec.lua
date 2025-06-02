-- telescope.lua

return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        version = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
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
        end
    }
}
