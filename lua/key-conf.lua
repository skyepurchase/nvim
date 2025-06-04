local whichkey = require("which-key")

local jup_textobj = require("jupynium.textobj")
local telescope_builtin = require("telescope.builtin")

-- tnoremap <Esc> <C-\><C-n>

whichkey.add({
    -- LSP
    { "<leader>l",   group = "LSP" },
    { "<leader>ld",  vim.lsp.buf.definition(),                   desc = "Go to definition" },
    { "<leader>lu",  vim.lsp.buf.references(),                   desc = "Show uses" },
    { "<leader>lr",  vim.lsp.buf.rename(),                       desc = "Rename object" },
    { "<leader>lj",  vim.lsp.buf.implementation(),               desc = "Go to implementation" },
    { "<leader>lt",  vim.lsp.buf.type_definition(),              desc = "Go to type definition" },
    { "<leader>la",  vim.lsp.buf.code_action(),                  desc = "Show code actions" },
    { "<leader>ln",  vim.diagnostic.goto_next(),                 desc = "Go to next diagnostic",          silent = true },
    { "<leader>lp",  vim.diagnostic.goto_prev(),                 desc = "Go to previous diagnostic",      silent = true },
    { "<leader>ls",  vim.diagnostic.open_float(),                desc = "Show diagnostic",                silent = true },

    -- Buffers
    { "<leader>b",   group = "Buffers" },
    { "<leader>bn",  ":bnext<CR>",                               desc = "Go to next buffer" },
    { "<leader>bb",  ":bprev<CR>",                               desc = "Go to previous buffer" },
    { "<leader>bd",  ":bdelete<CR>",                             desc = "Delete current buffer" },

    -- Windows
    { "<leader>w",   group = "Windows" },
    { "<leader>wv",  ":vsplit<CR><C-W><C-W>",                    desc = "Open vertical split" },
    { "<leader>wh",  ":split<CR><C-W><C-W>",                     desc = "Open horizontal split" },

    -- Terminal
    { "<leader>t",   ":terminal<CR>",                            desc = "Open a terminal" },

    -- Telescope
    { "<leader>f",   group = "Files" },
    { "<leader>fe",  ":Ex<CR>",                                  desc = "File explorer" },
    { "<leader>ff",  telescope_builtin.find_files,               desc = "Find files" },
    { "<leader>fg",  telescope_builtin.live_grep,                desc = "Grep in all files" },
    { "<leader>fb",  telescope_builtin.buffers,                  desc = "Buffer files" },
    { "<leader>fm",  telescope_builtin.marks,                    desc = "Current marks" },

    { "<leader>se",  ":UltiSnipsEdit<CR>",                       desc = "Edit filetype snippets" },

    -- Git
    { "<leader>g",   group = "Git" },
    { "<leader>gb",  telescope_builtin.git_branches,             desc = "Git branches" },
    { "<leader>gc",  "<cmd>Git commit<CR>",                      desc = "Git branches" },
    { "<leader>gp",  "<cmd>Git push<CR>",                        desc = "Git push" },
    { "<leader>gs",  "<cmd>Git<CR>",                             desc = "Git status" },
    { "<leader>gz",  "<cmd>Git blame<CR>",                       desc = "Git blame" },

    { "<leader>gl",  group = "Commit (log) history" },
    { "<leader>glb", telescope_builtin.git_bcommits,             desc = "Buffer commits" },
    { "<leader>glc", telescope_builtin.git_commits,              desc = "Git commits" },
    { "<leader>gls", telescope_builtin.git_stash,                desc = "Git stash" },

    { "<leader>gh",  group = "Git signs" },
    { "<leader>ghu", "<Plug>(GitGutterUndoHunk)",                desc = "Reset hunk" },
    { "<leader>ghs", "<Plug>(GitGutterStageHunk)",               desc = "Stage hunk" },
    { "<leader>ghn", "<Plug>(GitGutterNextHunk)",                desc = "Next hunk" },
    { "<leader>ghb", "<Plug>(GitGutterPrevHunk)",                desc = "Previous hunk" },
    { "<leader>ghp", "<Plug>(GitGutterPreviewHunk)",             desc = "Preview hunk" },

    -- Jupyter Notebooks
    { "<leader>j",   group = "Jupyter" },
    { "<leader>jr",  ":JupyniumExecuteSelectedCells<CR>",        desc = "Execute current cell" },
    { "<leader>jc",  ":JupyniumClearSelectedCellsOutputs<CR>",   desc = "Clear cell output" },
    { "<leader>jh",  ":JupyniumKernelHover<CR>",                 desc = "" },
    { "<leader>jd",  ":JupyniumStopSync<CR>",                    desc = "Stop syncing" },
    { "<leader>js",  ":JupyniumStartSync<CR>",                   desc = "Start syncing" },
    { "<leader>ja",  ":JupyniumStartAndAttachToServer<CR>",      desc = "Start server and attach" },

    { "<leader>jk",  jup_textobj.goto_previous_cell_separator(), desc = "Go to previous cell",            silent = true },
    { "<leader>jj",  jup_textobj.goto_next_cell_separator(),     desc = "Go to next cell",                silent = true },
    { "<leader>jg",  jup_textobj.goto_current_cell_separator(),  desc = "Go to top of cell",              silent = true },

    { "aj",          jup_textobj.select_cell(true, false),       desc = "Select around cell",             mode = "v" },
    { "ij",          jup_textobj.select_cell(false, false),      desc = "Select inside cell",             mode = "v" },
    { "aJ",          jup_textobj.select_cell(true, true),        desc = "Select surrounding cell",        mode = "v" },
    { "iJ",          jup_textobj.select_cell(false, true),       desc = "Select inside surrounding cell", mode = "v" },
})
