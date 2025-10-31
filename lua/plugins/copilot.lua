return {
	"zbirenbaum/copilot.lua",
	lazy = false, -- Load immediately
	priority = 1000, -- Load before other plugins
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				keymap = {
					accept = "<Tab>",
					accept_word = false,
					accept_line = false,
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-d>",
				},
			},
			panel = {
				enabled = true,
			},
		})
	end,
}
