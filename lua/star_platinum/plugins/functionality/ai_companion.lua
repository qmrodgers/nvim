if vim.fn.has("win32") == 1 then
	return {}
else
	return {
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
					agent = {
						adapter = "copilot",
					},
				},
			})
			vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

			vim.api.nvim_set_keymap(
				"n",
				"<leader>cct",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>cct",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>cca",
				"<cmd>CodeCompanionChat Add<cr>",
				{ noremap = true, silent = true }
			)

			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])

			-- Keybindings for the chat buffer
			-- <CR>|<C-s> to send a message to the LLM
			-- <C-c> to close the chat buffer
			-- q to stop the current request
			-- ga to change the adapter for the currentchat
			-- gc to insert a codeblock in the chat buffer
			-- gd to view/debug the chat buffer's contents
			-- gf to fold any codeblocks in the chat buffer
			-- gr to regenerate the last response
			-- gs to toggle the system prompt on/off
			-- gx to clear the chat buffer's contents
			-- gy to yank the last codeblock in the chat buffer
			-- [[ to move to the previous header
			-- ]] to move to the next header
			-- { to move to the previous chat
			-- } to move to the next chat
			--
			-- Keybindings for the inline buffer
			--ga - Accept an inline edit
			-- gr - Reject an inline edit
		end,
	}
end
