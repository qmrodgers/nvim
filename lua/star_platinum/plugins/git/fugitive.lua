return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap
		map.set("n", "gg", vim.cmd.G, { desc = "Open Fugitive" })
		map.set("n", "GD", vim.cmd.Gvdiffsplit, { desc = "Open Standard NVIM File Diff" })
		map.set("n", "Gl", "<cmd>Git log<CR>", { desc = "Open Git Log" })
		map.set("n", "Gp", ":Git aap ", { desc = "Commit and Push" })
		map.set("n", "Gm", vim.cmd.G, { desc = "Commit and Push with MR Flag" })
	end,
}
