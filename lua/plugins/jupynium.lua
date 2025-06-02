-- jupynium.lua

return {
    "kiyoon/jupynium.nvim",
    opts = {
        python_host = vim.g.python3_host_prog or "python3",
        default_notebook_URL = "localhost:8888/nbclassic",
        jupyter_command = "jupyter nbclassic",
        notebook_dir = nil,
        firefox_profiles_ini_path = nil,
        firefox_profile_name = nil,
        auto_start_server = {
            enable = false,
            file_pattern = { "*.ju.*" },
        },
        auto_attach_to_server = {
            enable = true,
            file_pattern = { "*.ju.*", "*.md" },
        },
        auto_start_sync = {
            enable = true,
            file_pattern = { "*.ju.*", "*.md" },
        },
        auto_download_ipynb = false,
        auto_close_tab = true,
        autoscroll = {
            enable = true,
            mode = "always",
            cell = {
                top_margin_percent = 20,
            },
        },
        scroll = {
            page = { step = 0.5 },
            cell = {
                top_margin_percent = 20,
            },
        },
        jupynium_file_pattern = { "*.ju.*" },
        use_default_keybindings = false,
        textobjects = {
            use_default_keybindings = false,
        },
        syntax_highlight = {
            enable = true,
        },
        shortsighted = false,
        kernel_hover = {
            floating_win_opts = {
                  max_width = 84,
                  border = "none",
            },
        },
    }
}

