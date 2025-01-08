return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					runner = "unittest",
					python = "python",
					dap = { justmycode = false },
				}),
			},
		})

		vim.keymap.set("n", "<leader>tr", function()
			require("neotest").run.run()
		end, { desc = "Run Nearest Test" })
		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Run Tests for Current File" })
		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end, { desc = "Debug Tests for Current File" })
		vim.keymap.set("n", "<leader>tz", function()
			require("neotest").run.stop()
		end, { desc = "Stop Running Test(s)" })
		vim.keymap.set("n", "<leader>ta", function()
			require("neotest").run.attach()
		end, { desc = "Attach to Nearest Test" })
		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open({ enter = true })
		end, { desc = "Open Test Result" })
		vim.keymap.set("n", "<leader>tp", function()
			require("neotest").output_panel.open()
		end, { desc = "Open Test Output Panel" })
		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.open()
		end, { desc = "Open Test Summary Pane" })
	end,
}
