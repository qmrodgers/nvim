return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "g", mode = { "n", "v" } },
			{ "G", mode = { "n", "v" } },
		},
	},
}
