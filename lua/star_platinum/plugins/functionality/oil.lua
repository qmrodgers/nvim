return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons", version = false },
	config = function()
		require("oil").setup({
			-- columns = { "size", "birthtime", "mtime", "icon" },
      default_file_explorer = true,
      delete_to_trash = true,
			columns = {"icon"},
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
				["<C-S-r>"] = "actions.refresh",
				["<C-l>"] = false,
			},
			buf_options = {
				buflisted = true
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
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
