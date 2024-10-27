return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({

			textobjects = {
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next Function Call (Start)" },
						["]i"] = { query = "@conditional.outer", desc = "Next Conditional (Start)" },
						["]l"] = { query = "@loop.outer", desc = "Next Loop (Start)" },
						["]s"] = { query = "@scope", desc = "Next Scope (Start)" },
						["]z"] = { query = "@fold", desc = "Next Fold (Start)" },
						["]m"] = { query = "@function.outer", desc = "Next Function (Start)" },
						["]b"] = { query = "@block.outer", desc = "Next Block (Start)" },
						["]a"] = { query = "@parameter.inner", desc = "Next Parameter (Start)" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Next Function Call (End)" },
						["]I"] = { query = "@conditional.outer", desc = "Next Conditional (End)" },
						["]L"] = { query = "@loop.outer", desc = "Next Loop (End)" },
						["]S"] = { query = "@scope", desc = "Next Scope (End)" },
						["]Z"] = { query = "@fold", desc = "Next Fold (End)" },
						["]M"] = { query = "@function.outer", desc = "Next Function (End)" },
						["]["] = { query = "@class.outer", desc = "Next Class (End)" },
						["]B"] = { query = "@block.outer", desc = "Next Block (End)" },
						["]A"] = { query = "@parameter.inner", desc = "Next Parameter (End)" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Previous Function Call (Start)" },
						["[i"] = { query = "@conditional.outer", desc = "Previous Conditional (Start)" },
						["[l"] = { query = "@loop.outer", desc = "Previous Loop (Start)" },
						["[s"] = { query = "@scope", desc = "Previous Scope (Start)" },
						["[z"] = { query = "@fold", desc = "Previous Fold (Start)" },
						["[m"] = { query = "@function.outer", desc = "Previous Function (Start)" },
						["[["] = { query = "@class.outer", desc = "Previous Class (Start)" },
						["[b"] = { query = "@block.outer", desc = "Previous Block (Start)" },
						["[a"] = { query = "@parameter.inner", desc = "Previous Parameter (Start)" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Previous Function Call (End)" },
						["[I"] = { query = "@conditional.outer", desc = "Previous Conditional (End)" },
						["[L"] = { query = "@loop.outer", desc = "Previous Loop (End)" },
						["[S"] = { query = "@scope", desc = "Previous Scope (End)" },
						["[Z"] = { query = "@fold", desc = "Previous Fold (End)" },
						["[M"] = { query = "@function.outer", desc = "Previous Function (End)" },
						["[]"] = { query = "@class.outer", desc = "Previous Class (End)" },
						["[B"] = { query = "@block.outer", desc = "Previous Block (End)" },
						["[A"] = { query = "@parameter.inner", desc = "Previous Parameter (End)" },
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["a="] = { query = "@assignment.outer", desc = "" },
						["i="] = { query = "@assignment.inner", desc = "" },
						["l="] = { query = "@assignment.lhs", desc = "" },
						["r="] = { query = "@assignment.rhs", desc = "" },
						["a;"] = { query = "@property.outer", desc = "" },
						["i;"] = { query = "@property.inner", desc = "" },
						["l;"] = { query = "@property.lhs", desc = "" },
						["r;"] = { query = "@property.rhs", desc = "" },
						["af"] = { query = "@function.outer", desc = "" },
						["if"] = { query = "@function.inner", desc = "" },
						["ac"] = { query = "@class.outer", desc = "" },
						["ic"] = { query = "@class.inner", desc = "" },
						["ab"] = { query = "@block.outer", desc = "" },
						["ib"] = { query = "@block.inner", desc = "" },
						["ai"] = { query = "@conditional.outer", desc = "" },
						["ii"] = { query = "@conditional.inner", desc = "" },
						["al"] = { query = "@loop.outer", desc = "" },
						["il"] = { query = "@loop.inner", desc = "" },
						["a/"] = { query = "@comment.outer", desc = "" },
						["i/"] = { query = "@comment.outer", desc = "" }, -- no inner for comment
						["aa"] = { query = "@parameter.outer", desc = "" }, -- parameter -> argument
						["ia"] = { query = "@parameter.inner", desc = "" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = { query = "@parameter.inner", desc = "Swap Current Parameters with Next" },
						["<leader>n:"] = { query = "@property.outer", desc = "Swap Item Property with Next" },
						["<leader>nf"] = { query = "@function.outer", desc = "Swap Function with Next" },
					},
					swap_previous = {
						["<leader>pa"] = { query = "@parameter.inner", desc = "Swap Current Parameters with Previous" },
						["<leader>p:"] = { query = "@property.outer", desc = "Swap Item Property with Previous" },
						["<leader>pf"] = { query = "@function.outer", desc = "Swap Function with Previous" },
					},
				},
			},
		})

		local repeat_movements = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", repeat_movements.repeat_last_move, { noremap = true })
		vim.keymap.set({ "n", "x", "o" }, ",", repeat_movements.repeat_last_move_opposite, { noremap = true })
	end,
}
