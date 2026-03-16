-- lua/plugins/codecompanion.lua

return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
        strategies = {
            chat = {
                adapter = "mistral_vibe",
            },
            inline = {
                adapter = "mistral_vibe",
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
