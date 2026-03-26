local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Split windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
