return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
		})

		-- Register with which-key
		local wk = require("which-key")
		wk.add({
			{ "gc", group = "Comment toggle" },
			{ "gcc", desc = "Toggle line comment" },
			{ "gbc", desc = "Toggle block comment" },
			{ "gc", desc = "Toggle comment (selection)", mode = "v" },
			{ "gb", desc = "Toggle block comment (selection)", mode = "v" },
		})
	end,
}
