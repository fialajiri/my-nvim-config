return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("typescript-tools").setup({
			capabilities = capabilities,
			settings = {
				-- Enable automatic import organization
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,

					includeCompletionsForModuleExports = true,
					includeCompletionsWithInsertText = true,
				},
				expose_as_code_action = "all",
			},
			})

		-- TypeScript-specific keymaps
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = "TS: " .. desc })
		end

		map("gro", "<cmd>TSToolsOrganizeImports<cr>", "[O]rganize Imports")
		map("grs", "<cmd>TSToolsSortImports<cr>", "[S]ort Imports")
		map("gru", "<cmd>TSToolsRemoveUnusedImports<cr>", "Remove [U]nused Imports")
		map("grf", "<cmd>TSToolsFixAll<cr>", "[F]ix All")
		map("grm", "<cmd>TSToolsAddMissingImports<cr>", "Add [M]issing Imports")
		map("grF", "<cmd>TSToolsFileReferences<cr>", "[F]ile References")
		map("grR", "<cmd>TSToolsRenameFile<cr>", "[R]ename File (updates imports)")
	end,
}
