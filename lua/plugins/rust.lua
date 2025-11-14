return {
    'mrcjkb/rustaceanvim',
    ft = { "rust" },
    opts = {
        server = {
            default_settings = {
                ["rust_analyzer"] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                        },
                    },
                    checkOnSave = diagnostics == "rust-analyzer",
                    diagnostics = {
                        enable = diagnostics == "rust-analyzer",
                    },
                    procMacro = {
                        enable = true,
                    },
                    files = {
                        exclude = {
                            ".direnv",
                            ".git",
                            ".jj",
                            ".github",
                            ".gitlab",
                            "bin",
                            "node_modules",
                            "target",
                            "venv",
                            ".venv",
                        },
                        watcher = "client",
                    },
                },
            },
        },
    },
    config = function(_, otps)
        vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
        if vim.fn.executable("rust-analyzer") == 0 then
            LazyVim.error(
                "Rust analyzer not found!",
                { title = "rustaceanvim" }
            )
        end
    end,
}
