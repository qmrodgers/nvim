return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>bpt", function()
				require("dap").toggle_breakpoint()
			end)
			vim.keymap.set("n", "<leader>bpc", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<leader>bpi", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<leader>bpo", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<leader>bpr", function()
				require("dap").repl.open()
			end)
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
