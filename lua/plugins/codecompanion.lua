-- lua/plugins/codecompanion.lua

return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
        adapters = {
            http = {
                mistral = function()
                    return require("codecompanion.adapters").extend("mistral", {
                        env = {
                            api_key = "MISTRAL_AI_KEY",
                            url = "https://api.mistral.ai"
                        },
                    })
                end,
            },
        },
        strategies = {
            chat = {
                adapter = "mistral",
                model = "codestral-latest",
            },
            inline = {
                adapter = "mistral",
                model = "codestral-latest",
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
