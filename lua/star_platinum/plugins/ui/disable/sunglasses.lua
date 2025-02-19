return {
	"qmrodgers/sunglasses.nvim",
	config = function()
		require("sunglasses").setup({
			excluded_filetypes = {
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_watches",
				"dapui_console",
				"dap-repl",
				"DiffviewFiles",
			},
		})
	end,
}
