-- Session Manager

return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	config = function()
		require("persisted").setup({
			autoload = true,
		})
		require("telescope").load_extension("persisted")
		vim.keymap.set("n", "gpl", "<cmd>SessionToggle<CR>", { desc = "Load Persisted Session" })
		vim.keymap.set("n", "gps", "<cmd>SessionSave<CR>", { desc = "Save Persisted Session" })
		vim.keymap.set("n", "gl", "<cmd>Telescope persisted<CR>", { desc = "Load Persisted with Picker" })
	end,
}
