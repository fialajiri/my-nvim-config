vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true

vim.opt.showmode = false
vim.opt.relativenumber = true
vim.o.confirm = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
  source = "if_many",  },  signs = true,  underline = true,  update_in_insert = false,  severity_sort = true,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {  callback = function()
  vim.highlight.on_yank()  end,
})
