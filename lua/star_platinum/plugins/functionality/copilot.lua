-- You know what this does.

return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		local keymap = vim.keymap
		keymap.set(
			"n",
			"<leader>cp",
			"<cmd>Copilot panel<CR>",
			{ noremap = true, silent = true, desc = "Open Copilot Panel" }
		)
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap(
			"i",
			"<C-c>",
			"copilot#Accept('<CR>')",
			{ silent = true, expr = true, desc = "Copilot Completion" }
		)
	end,
}
