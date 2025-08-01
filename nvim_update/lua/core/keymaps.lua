local opts = { noremap = true, silent = true }

local keymap = vim.keymap


-- General Keymaps
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="move lines down in visual selection"})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="move lines up in visual selection"})

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("n", "<leader>wq", ":wq<CR>")       -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>")       -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>")        -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- the how it be paste
keymap.set("x", "<leader>p", [["_dP]])

-- remember yanked
keymap.set("v", "p", '"_dp', opts)

-- Copies or Yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]], opts)

-- leader d delete wont remember as yanked/clipboard when delete pasting
keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- ctrl c as escape cuz Im lazy to reach up to the esc key
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
-- format without prettier using the built in
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Unmaps Q in normal mode
keymap.set("n", "Q", "<nop>")

--Stars new tmux session from in here
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- prevent x delete from registering when next paste
keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

-- Executes shell command from in here making file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })


-- Telescope
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})                                                    -- fuzzy find files in project
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})                                                     -- grep file contents in project
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})                                                       -- fuzzy find open buffers
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})                                                     -- fuzzy find help tags
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})                                     -- fuzzy find in current file buffer
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})                                          -- fuzzy find LSP/class symbols
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})                                            -- fuzzy find LSP/incoming calls
-- keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end) -- fuzzy find methods in current class
keymap.set('n', '<leader>fm',
  function() require('telescope.builtin').treesitter({ symbols = { 'function', 'method' } }) end)                             -- fuzzy find methods in current class
keymap.set('n', '<leader>ft',
  function()                                                                                                                  -- grep file contents in current nvim-tree node
    local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
    if not success or not node then return end;
    require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
  end)


-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer
