vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true

vim.opt.showmode = false
vim.opt.relativenumber = true
vim.o.confirm = true
vim.o.scrollback = 100000

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float({ border = "rounded", source = true })
end, { desc = "Show full diagnostic" })

vim.keymap.set("n", "gL", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
	if #diagnostics == 0 then
		print("No diagnostics on this line")
		return
	end
	local messages = {}
	for _, d in ipairs(diagnostics) do
		table.insert(messages, d.message)
	end
	local text = table.concat(messages, "\n\n")
	vim.fn.setreg("+", text)
	print("Diagnostic copied to clipboard")
end, { desc = "Copy diagnostic to clipboard" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Hide line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.wo.signcolumn = "no"
	end,
})
