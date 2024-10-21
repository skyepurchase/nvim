-- lsp.lua

require('mason').setup({automatic_installation = true})
require('lspconfig').jdtls.setup{}
require('lspconfig').html.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').vimls.setup{}
require('lspconfig').ts_ls.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').eslint.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').lua_ls.setup{}
require('lspconfig').hls.setup{}
require('lspconfig').marksman.setup{
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        }
    }
}
require('lspconfig').lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
}
