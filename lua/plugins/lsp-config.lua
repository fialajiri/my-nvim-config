return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- New way using vim.lsp.config
			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.html = {
				capabilities = capabilities,
			}

			vim.lsp.config.pyright = {
				capabilities = capabilities,
			}

			-- Enable the LSP servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("pyright")

			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc })
			end

			-- Rename the variable under the cursor
			map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

			-- Execute the code action, usually the cursor needs to be on the top of an error
			-- or a suggestion from the LSP server for this to work
			map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]action", { "n", "x" })

			-- Find references for the word under the cursor
			map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

			-- Jump to the implementation of the word under the cursor
			-- Useful when your language has ways of declaring types without an actual implementation
			map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

			-- Jump to the definition of the word under your cursor.
			--  This is where a variable was first declared, or where a function is defined, etc.
			--  To jump back, press <C-t>.
			map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header.
			map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			-- Show the type definition of the symbol under the cursor
			map("K", vim.lsp.buf.hover, "Hover Documentation")
		end,
	},
}
