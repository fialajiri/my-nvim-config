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
				ensure_installed = {
					"lua_ls",
					-- "ts_ls",
					"pyright",
					"jsonls",
					"html",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Add this dependency
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.enable({ "lua_ls", "html", "pyright", "jsonls" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]action", { "n", "x" })
					map("grr", function() require("telescope.builtin").lsp_references() end, "[G]oto [R]eferences")
					map("gri", function() require("telescope.builtin").lsp_implementations() end, "[G]oto [I]mplementation")
					map("grd", function() require("telescope.builtin").lsp_definitions() end, "[G]oto [D]efinition")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})
		end,
	},
}
