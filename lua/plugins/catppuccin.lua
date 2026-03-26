return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				treesitter = true,
				gitsigns = true,
				telescope = { enabled = true },
				which_key = true,
				flash = true,
				cmp = true,
				neotree = true,
				dap = true,
				dap_ui = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
