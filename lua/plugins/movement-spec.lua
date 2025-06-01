-- movement-spec.lua

-- Lazy.nvim movement plugins

return {
    { 'nvim-lua/plenary.nvim', version = false, priority = 1000 },
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        version = false,
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}
