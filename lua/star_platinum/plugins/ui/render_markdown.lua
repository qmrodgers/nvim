return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = "BufEnter *.md",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>md",
			"<cmd>RenderMarkdown toggle<cr>",
			{ noremap = true, silent = true, desc = "Render Markdown (Toggle)" }
		)
	end,
}
