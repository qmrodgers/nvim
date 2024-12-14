return {
	"gennaro-tedesco/nvim-jqx",
	event = { "BufReadPost" },
	ft = { "json", "yaml" },
	config = function()
		vim.keymap.set(
			"n",
			"<leader>jq",
			"<cmd>JqxList<cr>",
			{ noremap = true, silent = true, desc = "Add JSON to Quickfix" }
		)
		vim.keymap.set("n", "<leader>jQ", ":JqxQuery ", { noremap = true, silent = true, desc = "Query Json Data" })
	end,
}
