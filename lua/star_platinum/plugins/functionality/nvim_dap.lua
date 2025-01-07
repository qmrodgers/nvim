return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>bt", function()
				require("dap").toggle_breakpoint()
			end, { desc = "DAP: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>bc", function()
				require("dap").continue()
			end, { desc = "DAP: Continue" })
			vim.keymap.set("n", "<leader>bi", function()
				require("dap").step_into()
			end, { desc = "DAP: Step Into" })
			vim.keymap.set("n", "<leader>bo", function()
				require("dap").step_over()
			end, { desc = "DAP: Step Over" })
			vim.keymap.set("n", "<leader>br", function()
				require("dap").repl.open()
			end, { desc = "DAP: REPL" })
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-dap-python",
	-- 	https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file
	-- },
	{
		--typescript
		-- 	https://alpha2phi.medium.com/neovim-dap-enhanced-ebc730ff498b
	},
}
