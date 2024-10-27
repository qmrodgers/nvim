return {
	"RutaTang/quicknote.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("quicknote").setup({
			mode = "resident",
			sign = "󱘒",
			filetype = "md",
			git_branch_recognizable = true,
		})

		-- NEW NOTE
		vim.keymap.set("n", "gng", ":lua require('quicknote').NewNoteAtGlobal()<cr>", { desc = "New Note (Global)" })
		vim.keymap.set(
			"n",
			"gnl",
			":lua require('quicknote').NewNoteAtCurrentLine()<cr>",
			{ desc = "New Note (Current Line)" }
		)
		vim.keymap.set("n", "gnc", ":lua require('quicknote').NewNoteAtCWD()<cr>", { desc = "New Note (CWD)" })

		-- DELETE NOTE
		vim.keymap.set(
			"n",
			"gndg",
			":lua require('quicknote').DeleteNoteAtGlobal()<cr>",
			{ desc = "Delete Note (Global)" }
		)
		vim.keymap.set(
			"n",
			"gndl",
			":lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
			{ desc = "Delete Note (Current Line)" }
		)
		vim.keymap.set("n", "gndc", ":lua require('quicknote').DeleteNoteAtCWD()<cr>", { desc = "Delete Note (CWD)" })

		-- SEARCH NOTES
		vim.keymap.set("n", "tng", ":Telescope quicknote scope=Global<cr>", { desc = "Telescope Notes (Global)" })
		vim.keymap.set(
			"n",
			"tnb",
			":Telescope quicknote scope=CurrentBuffer<cr>",
			{ desc = "Telescope Notes (CurrentBuffer)" }
		)
		vim.keymap.set("n", "tnc", ":Telescope quicknote scope=CWD<cr>", { desc = "Telescope Notes (CWD)" })
	end,
}
