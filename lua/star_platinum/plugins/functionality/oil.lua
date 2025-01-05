return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons", version = false },
	config = function()
		require("oil").setup({
			columns = { "size", "birthtime", "mtime", "icon" },
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
				["<C-S-r>"] = "actions.refresh",
				["<C-l>"] = false,
				["~"] = {
					callback = function()
						require("oil.actions").cd.callback()
						vim.g.tree_initial_cwd = vim.fn.getcwd()
						require("nvim-tree.api").tree.change_root(vim.g.tree_initial_cwd)
					end,
				},
			},
			buf_options = {
				buflisted = false,
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = true,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},
			view_options = {
				show_hidden = true,
			},
			watch_for_changes = true,
		})
		vim.keymap.set("n", "-", "<cmd>Oil<CR>")
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	end,
}
