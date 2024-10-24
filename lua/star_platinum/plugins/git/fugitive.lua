return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap
		map.set("n", "<leader><leader>g", vim.cmd.G, { desc = "Open Fugitive" })
		map.set("n", "<leader>gD", vim.cmd.Gvdiffsplit, { desc = "Open Diff with Vertical Split" })
		map.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Open Git Log" })
		map.set("n", "<leader>gP", ":Git aap ", { desc = "Commit and Push" })
		map.set("n", "<leader>gM", vim.cmd.G, { desc = "Commit and Push with MR Flag" })
	end,
}
