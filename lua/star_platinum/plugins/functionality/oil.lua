return {
	"stevearc/oil.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("oil").setup({
			columns = { "icon", "size", "time" },
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
				["~"] = {
					callback = function()
						require("oil.actions").cd.callback()
						vim.g.tree_initial_cwd = vim.fn.getcwd()
						require("nvim-tree.api").tree.change_root(vim.g.tree_initial_cwd)
					end,
				},
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "-", "<cmd>Oil<CR>")
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	end,
}
