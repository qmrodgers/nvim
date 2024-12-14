return {
	"NStefan002/screenkey.nvim",
	lazy = false,
	version = "*", -- or branch = "dev", to use the latest commit
	config = function()
		vim.keymap.set("n", "<leader>sk", "<cmd>lua require('screenkey').toggle()<CR>")
	end,
}
