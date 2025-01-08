-- Dim non-active windows

return {
	"miversen33/sunglasses.nvim",
	config = function()
		require("sunglasses").setup({
			excluded_filetypes = {
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_watches",
				"dapui_console",
				"dap-repl",
			},
		})
	end,
}
