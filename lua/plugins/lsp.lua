-- lua/plugins/lsp.lua

-- Lazy.nvim lsp plugins

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                "mason-org/mason-lspconfig.nvim",
                dependencies = { "mason-org/mason.nvim" }
            }
        },
        config = function()
            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd(
                        "BufWritePre",
                        {
                            group = vim.api.nvim_create_augroup(
                                "Format", { clear = true }
                            ),
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        }
                    )
                end
            end

            local capabilities = require(
                'cmp_nvim_lsp'
            ).default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            vim.lsp.config("ts_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("ts_ls")

            vim.lsp.config("cssls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("cssls")

            vim.lsp.config("html", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("html")

            vim.lsp.config("jsonls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("jsonls")

            vim.lsp.config("eslint", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("eslint")

            vim.lsp.config("bashls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("bashls")

            vim.lsp.config("pyright", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable("pyright")

            vim.lsp.config("marksman", {
                on_attach = on_attach,
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    }
                },
            })
            vim.lsp.enable("marksman")

            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            PATH = 'append',
        }
    }
}
