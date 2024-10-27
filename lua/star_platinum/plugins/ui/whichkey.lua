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
			{ "t", mode = { "n", "v" } },
			{ "g", mode = { "n", "v" } },
		},
	},
}
