-- aglea.lua

local autocmd_group = vim.api.nvim_create_augroup(
    "Custom auto-commands",
    {clear = true}
)

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    local i = 1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

local function initialise_note_if_empty()
    local path = vim.api.nvim_buf_get_name(0)
    -- TODO: make this dynamic
    if string.find(path, "university/notes") then
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        if #lines == 0 or (#lines == 1 and #lines[1] == 0) then
            local name = string.sub(path, 28, string.len(path) - 3)
            vim.cmd(":silent !notes create " .. name)
        end
    end
end

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.md"},
        desc = "When in notes format new notes",
        callback = initialise_note_if_empty,
        group = autocmd_group,
    }
)

vim.api.nvim_set_keymap('n', '<leader>nc', '', {
    desc="Create a new note in this folder",
    callback=function()
        local full_path = vim.api.nvim_buf_get_name(0)
        local split_path = split(full_path, "/")

        -- TODO: make this dynamic (as in not hard-coded)
        local trim_path = {}
        for i = 5, #split_path -1, 1 do
            trim_path[#trim_path+1] = split_path[i]
        end

        -- TODO: allow different folders
        local name = vim.fn.input("File name: ")
        local new_path = table.concat(trim_path, "/") .. "/" .. name
        vim.cmd(":!notes create " .. new_path)
    end
})

vim.api.nvim_set_keymap('n', '<leader>no', '', {
    desc="Create and open a new note in this folder",
    callback=function()
        local full_path = vim.api.nvim_buf_get_name(0)
        local split_path = split(full_path, "/")

        -- TODO: make this dynamic (as in not hard-coded)
        local trim_path = {}
        for i = 5, #split_path -1, 1 do
            trim_path[#trim_path+1] = split_path[i]
        end

        -- TODO: allow different folders
        local name = vim.fn.input("File name: ")
        local note_path = table.concat(trim_path, "/") .. "/" .. name
        vim.cmd(":!notes create " .. note_path)

        local dir = {}
        for i = 1, #split_path - 1, 1 do
            dir[#dir+1] = split_path[i]
        end

        local file_path = table.concat(dir, "/") .. "/" .. name
        vim.schedule(function()
            vim.cmd("e " .. file_path)
        end)
    end
})

-- Add abilities to
-- Get all files matching a tag in a qf-list
-- Create and open a new note (without bugs)
-- Recommend existing tags (create new tags)
