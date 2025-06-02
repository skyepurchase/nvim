-- lua/plugins/completion.lua

-- Lazy.nvim completion plugins

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "sirver/ultisnips", -- move to luasnips vv aswell
        "quangnguyen30192/cmp-nvim-ultisnips",
        "onsails/lspkind.nvim"
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local cmp_ultisnips_mappings = require(
            'cmp_nvim_ultisnips.mappings'
        )
        local select_opts = {
            behavior = cmp.SelectBehavior.Select
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["UltiSnips#Anon"](args.body)
                end,
            },
            mapping = {
                ['<C-c>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ['<C-e>'] = cmp.mapping.confirm({ select = true }),
                ['<C-j>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp_ultisnips_mappings.jump_forwards(fallback)
                    end
                end, { 'i', 's' }),
                ['<C-k>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        cmp_ultisnips_mappings.jump_backwards(fallback)
                    end
                end, { 'i', 's' }),
            },
            formatting = {
                format = lspkind.cmp_format {
                    mode = 'symbol',
                    with_text = true,
                    menu = {
                        buffer = "[Buf]",
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        ultisnips = "[Snip]",
                        vimtex = "[Tex]"
                    },
                },
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'ultisnips' },
                { name = 'jupynium' },
                { name = 'vimtex' },
            }, {
                { name = 'buffer' },
            }),
            experimental = {
                ghost_text = true
            }
        })

        cmp.setup.cmdline('/', {
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end,
}
