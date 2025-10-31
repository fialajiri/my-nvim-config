local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- local Util = require("lazyvim.util")

-- Bordered terminal
-- vim.keymap.set("n", "<C-/>", function()
-- Util.terminal(nil, { border = "none" })
-- end, { desc = "Term with border" })

-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Split windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>")
vim.keymap.set("n", "<C-u>", "<C-u>")
vim.keymap.set("n", "<C-f>", "<C-f>")
vim.keymap.set("n", "<C-b>", "<C-b>")
