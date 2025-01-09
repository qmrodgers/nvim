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
			},
      can_shade_callback = function(opts)
         if vim.api.nvim_get_option_value('diff', { win = opts.window }) then
           return false
         end
      end,
		})
	end,
}
