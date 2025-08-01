return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },

                -- ensure these languages parsers are installed
                ensure_installed = {
                    "angular",
                    "bash",
                    "c",
                    "c_sharp",
                    "css",
                    "diff",
                    "dockerfile",
                    "dot",
                    "elixir",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "go",
                    "heex",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "python",
                    "query",
                    "regex",
                    "scss",
                    "sql",
                    "svelte",
                    "tmux",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                    "typescript",
                    "tsx",
                    "http",
                    "prisma",
                    "markdown",
                    "markdown_inline",
                    "graphql",
                    "java",
                    "rust",
                    "ron",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    },
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
    -- NOTE: js,ts,jsx,tsx Auto Close Tags
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
        config = function()
            -- Independent nvim-ts-autotag setup
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,           -- Auto-close tags
                    enable_rename = true,          -- Auto-rename pairs
                    enable_close_on_slash = false, -- Disable auto-close on trailing `</`
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true, -- Enable auto-closing for HTML
                    },
                    ["typescriptreact"] = {
                        enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
                    },
                },
            })
        end,
    },
}
