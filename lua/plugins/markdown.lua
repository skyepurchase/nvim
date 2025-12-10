-- lua/plugins/markdown

return {
    "preservim/vim-markdown",
    config = function()
        vim.g.vim_markdown_math = 1
        vim.g.vim_markdown_folding_level = 2
    end
}
