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
			can_shade_callback = function(opts)
				local conditions = {
					function()
						return vim.api.nvim_get_option_value("diff", { win = opts.window })
					end,
					-- Add more conditions here as needed
				}

				for _, condition in ipairs(conditions) do
					if condition() then
						return false
					end
				end

				return true
			end,
		})
	end,
}
