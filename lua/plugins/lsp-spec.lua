-- lsp-spec.lua

-- Lazy.nvim lsp plugins

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            -- TODO: lazydev if I do this more frequently
        },
        config = function()
            local nvim_lsp = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local protocol = require("vim.lsp.protocol")

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

            mason_lspconfig.setup({
                function(server)
                    nvim_lsp[server].setup({
                        capabilities = capabilities,
                    })
                end,
                ["ts_ls"] = function()
                    nvim_lsp["ts_ls"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["cssls"] = function()
                    nvim_lsp["cssls"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["html"] = function()
                    nvim_lsp["html"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["jsonls"] = function()
                    nvim_lsp["jsonls"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["eslint"] = function()
                    nvim_lsp["eslint"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["pyright"] = function()
                    nvim_lsp["pyright"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["marksman"] = function()
                    nvim_lsp["marksman"].setup({
                        on_attach = on_attach,
                        capabilities = {
                            workspace = {
                                didChangeWatchedFiles = {
                                    dynamicRegistration = true,
                                },
                            }
                        },
                    })
                end,
            })
        end
    },
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            -- TODO: look into mason-tool-installer
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "pyright",
                    "eslint",
                    "html",
                    "cssls",
                    "jsonls",
                    "ts_ls",
                    "marksman"
                },
            })
        end,
    }
}
