-- lsp-spec.lua

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
            local lspconfig = require("lspconfig")

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

            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.marksman.setup({
                on_attach = on_attach,
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    }
                },
            })
            lspconfig.lua_ls.setup({
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
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            PATH = 'append',
        }
    }
}
