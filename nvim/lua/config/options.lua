
----- Basic Keymaps -----

vim.o.number = true
vim.o.relativenumber = true

-- sync keyboard betweek OS and Neovim
vim.schedule(function() 
	vim.o.clipboard = 'unnamedplus'
end)

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- tabs configs
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- amount to indent with << and >>

vim.o.tabstop = 4 -- howmany spaces are shown per tab
vim.o.softtabstop = 4 -- howmany spaces applied when pressing tab

vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true --keep indentaion from previous line

-- show line under cursor
vim.o.cursorline = true

-- mousemode enable, can be helpful for resizing splits
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true


vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = '*',
    callback = function() 
        vim.highlight.on_yank()
    end,
    desc = "Highlight Yank"
})
