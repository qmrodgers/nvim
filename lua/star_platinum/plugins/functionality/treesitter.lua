return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-textsubjects",
	},
	build = ":TSUpdate",
	config = function()
		-- NOTE: See after/treesitter.lua
	end,
}
