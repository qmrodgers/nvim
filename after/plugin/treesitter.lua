require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
    "git_rebase",
		"query",
		"vim",
		"vimdoc",
		"javascript",
		"python",
		"rust",
		"cpp",
		"json",
    "jsonc",
		"typescript",
		"tsx",
		"yaml",
		"svelte",
		"gitignore",
		"regex",
	},
	-- Autoinstall languages that are not installed
	auto_install = true,
	highlight = {
		enable = true,
		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		--  If you are experiencing weird indenting issues, add the language to
		--  the list of additional_vim_regex_highlighting and disabled languages for indent.
		additional_vim_regex_highlighting = { "ruby" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-Space>",
			node_incremental = "v",
			scope_incremental = false,
			node_decremental = "V",
		},
	},
	indent = { enable = true, disable = { "ruby" } },
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				-- ["]f"] = { query = "@call.outer", desc = "Next Function Call (Start)" },
				-- ["]i"] = { query = "@conditional.outer", desc = "Next Conditional (Start)" },
				-- ["]l"] = { query = "@loop.outer", desc = "Next Loop (Start)" },
				-- ["]s"] = { query = "@scope", desc = "Next Scope (Start)" },
				-- ["]z"] = { query = "@fold", desc = "Next Fold (Start)" },
				-- ["]b"] = { query = "@block.outer", desc = "Next Block (Start)" },
				-- ["]a"] = { query = "@parameter.inner", desc = "Next Parameter (Start)" },
				["]m"] = { query = "@function.outer", desc = "Next Function (Start)" },
				["]]"] = { query = "@class.outer", desc = "Next Class (Start)" },
			},
			goto_next_end = {
				-- ["]F"] = { query = "@call.outer", desc = "Next Function Call (End)" },
				-- ["]I"] = { query = "@conditional.outer", desc = "Next Conditional (End)" },
				-- ["]L"] = { query = "@loop.outer", desc = "Next Loop (End)" },
				-- ["]S"] = { query = "@scope", desc = "Next Scope (End)" },
				-- ["]Z"] = { query = "@fold", desc = "Next Fold (End)" },
				-- ["]B"] = { query = "@block.outer", desc = "Next Block (End)" },
				-- ["]A"] = { query = "@parameter.inner", desc = "Next Parameter (End)" },
				["]M"] = { query = "@function.outer", desc = "Next Function (End)" },
				["]["] = { query = "@class.outer", desc = "Next Class (End)" },
			},
			goto_previous_start = {
				-- ["[f"] = { query = "@call.outer", desc = "Previous Function Call (Start)" },
				-- ["[i"] = { query = "@conditional.outer", desc = "Previous Conditional (Start)" },
				-- ["[l"] = { query = "@loop.outer", desc = "Previous Loop (Start)" },
				-- ["[s"] = { query = "@scope", desc = "Previous Scope (Start)" },
				-- ["[z"] = { query = "@fold", desc = "Previous Fold (Start)" },
				-- ["[b"] = { query = "@block.outer", desc = "Previous Block (Start)" },
				-- ["[a"] = { query = "@parameter.inner", desc = "Previous Parameter (Start)" },
				["[m"] = { query = "@function.outer", desc = "Previous Function (Start)" },
				["[["] = { query = "@class.outer", desc = "Previous Class (Start)" },
			},
			goto_previous_end = {
				-- ["[F"] = { query = "@call.outer", desc = "Previous Function Call (End)" },
				-- ["[I"] = { query = "@conditional.outer", desc = "Previous Conditional (End)" },
				-- ["[L"] = { query = "@loop.outer", desc = "Previous Loop (End)" },
				-- ["[S"] = { query = "@scope", desc = "Previous Scope (End)" },
				-- ["[Z"] = { query = "@fold", desc = "Previous Fold (End)" },
				-- ["[B"] = { query = "@block.outer", desc = "Previous Block (End)" },
				-- ["[A"] = { query = "@parameter.inner", desc = "Previous Parameter (End)" },
				["[M"] = { query = "@function.outer", desc = "Previous Function (End)" },
				["[]"] = { query = "@plass.outer", desc = "Previous Class (End)" },
			},
		},
		-- select = {
		-- 	enable = true,
		-- 	lookahead = true,
		-- 	keymaps = {
		-- 		["a="] = { query = "@assignment.outer", desc = "Select Assignment (Outer)" },
		-- 		["i="] = { query = "@assignment.inner", desc = "Select Assignment (Inner)" },
		-- 		["l="] = { query = "@assignment.lhs", desc = "Select Assignment (LHS)" },
		-- 		["r="] = { query = "@assignment.rhs", desc = "Select Assignment (RHS)" },
		-- 		["a;"] = { query = "@property.outer", desc = "Select Property (Outer)" },
		-- 		["i;"] = { query = "@property.inner", desc = "Select Property (Inner)" },
		-- 		["l;"] = { query = "@property.lhs", desc = "Select Property (LHS)" },
		-- 		["r;"] = { query = "@property.rhs", desc = "Select Property (RHS)" },
		-- 		["af"] = { query = "@function.outer", desc = "Select Function (Outer)" },
		-- 		["if"] = { query = "@function.inner", desc = "Select Function (Inner)" },
		-- 		["ac"] = { query = "@class.outer", desc = "Select Class (Outer)" },
		-- 		["ic"] = { query = "@class.inner", desc = "Select Class (Innter)" },
		-- 		["ab"] = { query = "@block.outer", desc = "Select Block (Outer)" },
		-- 		["ib"] = { query = "@block.inner", desc = "Select Block (Inner)" },
		-- 		["ai"] = { query = "@conditional.outer", desc = "Select Conditional (Outer)" },
		-- 		["ii"] = { query = "@conditional.inner", desc = "Select Conditional (Inner)" },
		-- 		["al"] = { query = "@loop.outer", desc = "Select Loop (Outer)" },
		-- 		["il"] = { query = "@loop.inner", desc = "Select Loop (Inner)" },
		-- 		["a/"] = { query = "@comment.outer", desc = "Select Comment (Outer)" },
		-- 		["i/"] = { query = "@comment.inner", desc = "Select Comment (Inner)" }, -- no inner for comment
		-- 		["aa"] = { query = "@parameter.outer", desc = "Select Parameter (Outer)" }, -- parameter -> argument
		-- 		["ia"] = { query = "@parameter.pnner", desc = "Select Parameter (Inner)" },
		-- 	},
		-- },
		swap = {
			enable = true,
			swap_next = {
				["<leader>rp"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>rP"] = "@parameter.inner",
			},
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ",",
		keymaps = {
			["<cr>"] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
})
vim.keymap.set({ "n", "x", "o" }, "<leader>it", function()
	vim.treesitter.inspect_tree()
end, { noremap = true, desc = "Inspect Tree" })
