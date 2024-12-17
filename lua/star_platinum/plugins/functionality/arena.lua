return {
	"qmrodgers/arena.nvim",
	branch = "quaid-dev",
	-- dir = "~/Projects/nvim_forks/arena.nvim/",
	event = "BufWinEnter",
	-- Calls `.setup()` automatically
	config = function()
		require("arena").setup({
			devicons = true,
			max_items = 8,
		})
		vim.keymap.set("n", "<leader>ao", function()
			require("arena").open()
		end, { noremap = true, desc = "Open Arena" })
	end,
}
