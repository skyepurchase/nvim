-- aesthetics-spec.lua

-- Lazy.nvim aesthetics plugins

return {
    {
        'dracula/vim', tags='*'
    },
    {
        'nvim-lualine/lualine.nvim', tags='*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { options = { theme = 'dracula' } }
    },
    {
        'romainl/vim-cool', version=false
    }
}
