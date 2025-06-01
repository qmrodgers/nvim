return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap
		map.set("n", "<leader>gg", vim.cmd.G, { desc = "Open Fugitive" })
		map.set("n", "<leader>gl", ":Git log<CR>", { desc = "Open Git Log" })
		map.set("n", "<leader>gpp", ":Git push ", { desc = "Git Push" })
		map.set("n", "<leader>gpm", ":Git pm ", { desc = "Git Push with Merge Target" })
		map.set("n", "<leader>gpP", ":Git aap ", { desc = "Git aap" })
		map.set("n", "<leader>gpM", ":Git aam ", { desc = "Git aam" })
		map.set("n", "<leader>gc", ":Git commit ", { desc = "Git Commit" })
		map.set("n", "<leader>gC", ":Git checkout ", { desc = "Git Checkout" })
		map.set("n", "<leader>g-", ":Git checkout -<CR>", { desc = "Git Checkout Last" })
		map.set("n", "<leader>gm", ":Git merge ", { desc = "Git Merge" })
		map.set("n", "<leader>gA", ":Git add -A<CR>", { desc = "Git Add All" })
		map.set("n", "<leader>ga", ":Git add ", { desc = "Git Add" })
	end,
}
