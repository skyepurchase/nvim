-- lua/plugins/lua-line.lua

-- Origin: lokesh-krishna https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua

local colors = {
    green  = '#50fa7b',
    cyan   = '#8be9fd',
    black  = '#282a36',
    white  = '#f8f8f2',
    red    = '#ff5555',
    violet = '#bd93f9',
    grey   = '#6272a4',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.green } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.grey },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
    },
}

return {
    'nvim-lualine/lualine.nvim',
    tags = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = bubbles_theme,
            component_separators = '',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            lualine_b = { 'filename', 'branch' },
            lualine_c = { 'diagnostics' },
            lualine_x = {},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
                { 'location', separator = { right = '' }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    }
}
