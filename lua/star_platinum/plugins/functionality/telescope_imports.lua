return {
	"piersolenski/telescope-import.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		require("telescope").load_extension("import")
		vim.keymap.set("n", "<leader>fi", "<cmd>Telescope import<CR>", { desc = "Telescope Locate Imports" })
	end,
}
