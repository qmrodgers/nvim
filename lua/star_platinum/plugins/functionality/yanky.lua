return {
	"gbprod/yanky.nvim",
	config = function()
		local utils = require("yanky.utils")
		local mapping = require("yanky.telescope.mapping")
		require("yanky").setup({
			highlight = {
				timer = 200,
			},
			picker = {
				telescope = {
					use_default_mappings = false,
					mappings = {
						i = {
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-p>"] = mapping.put("p"),
							["<C-P>"] = mapping.put("P"),
							["<CR>"] = "<Plug>(YankyPutAfter)",
							["<C-CR>"] = "<Plug>(YankyPutBefore)",
							["<c-x>"] = mapping.delete(),
							["<c-r>"] = mapping.set_register(utils.get_default_register()),
						},
						n = {
							p = mapping.put("p"),
							P = mapping.put("P"),
							d = mapping.delete(),
							r = mapping.set_register(utils.get_default_register()),
						},
					},
				},
			},
			preserve_cursor_position = {
				enabled = true,
			},
		})
	end,
	keys = {
    -- stylua: ignore
    { "<leader>fp", "<cmd>YankyRingHistory<cr>", desc = "Open Yank History" },
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
		{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
		{ "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
		{ "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
		{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
		{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
		{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
		{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
		{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
		{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
		{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
		{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
		{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
		{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
	},
}
