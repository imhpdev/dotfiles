-- Code Tree Support / Syntax Highlighting
return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
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
  },
  config = function (_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end
}

