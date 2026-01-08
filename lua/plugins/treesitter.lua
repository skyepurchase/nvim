-- lua/plugins/treesitter.lua

return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "typescript",
                "rust"
            },
            highlight = {
                enable = true,
                disable = {
                    "markdown",
                    "yaml"
                },
            },
            indent = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })

        local tsc = require("treesitter-context")
        tsc.setup({
            enable = true,
            max_lines = 0,
            trim_scope = "outer",
            min_window_height = 0,
            mode = "topline",
            zindex = 20,
        })
    end,
}
