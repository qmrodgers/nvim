return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap
		map.set("n", "<leader>gg", vim.cmd.G, { desc = "Open Fugitive" })
		map.set("n", "<leader>gD", vim.cmd.Gvdiffsplit, { desc = "Open Standard NVIM File Diff" })
		map.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Open Git Log" })
		map.set("n", "<leader>gp", ":Git aap ", { desc = "Commit and Push" })
		map.set("n", "<leader>gm", vim.cmd.G, { desc = "Commit and Push with MR Flag" })
	end,
}
