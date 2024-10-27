return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local config = require("telescope.config")
		local actions_set = require("telescope.actions.set")
		local action_state = require("telescope.actions.state")
		local mappings = require("telescope.mappings")
		local lga_acs = require("telescope-live-grep-args.actions")
		local lga_scs = require("telescope-live-grep-args.shortcuts")
		local vimgrep_args = { unpack(config.values.vimgrep_arguments) }
		table.insert(vimgrep_args, "--hidden")
		table.insert(vimgrep_args, "--glob")
		table.insert(vimgrep_args, "!**/.git/*")

		local deleteQuicknote = function(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			print(entry)
			-- actions.close(prompt_bufnr)
			-- print("Deleted: " .. entry.value)
		end

		telescope.setup({
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},
				},
			},
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"node%_modules/.*",
					"pycache",
					"%.lock",
				},
				vimgrep_arguments = vimgrep_args,
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_to_qflist,
						["<C-s>"] = actions.file_split,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
						["<C-h>"] = "which_key",
					},
					n = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				quicknote = {
					defaultScope = "Global", -- "CWD", "Global", or "CurrentBuffer"
					mappings = {
						i = {
							["<C-d>"] = print("hello"),
						},
					},
				},
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-u>"] = lga_acs.quote_prompt(),
							["<C-i>"] = lga_acs.quote_prompt({ postfix = " --iglob " }),
							["<C-o>"] = actions.to_fuzzy_refine,
						},
					},
				},
			},
		})
		local custom_maps = {}
		custom_maps.find_files = function()
			builtin.find_files({
				find_command = {
					"rg",
					"--files",
					"--glob",
					"!.git",
					"--hidden",
					"--glob",
				},
			})
		end
		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("quicknote")
		local keymap = vim.keymap
		keymap.set("n", "tfr", builtin.oldfiles, { desc = "Find Recently Opened Files" })
		keymap.set("n", "tfb", builtin.buffers, { desc = "Find Open Buffers" })
		keymap.set("n", "tgf", builtin.git_files, { desc = "Search Git Files" })
		keymap.set("n", "tff", builtin.find_files, { desc = "Search Files" })
		keymap.set("n", "tfc", builtin.highlights, { desc = "Search Files" })
		keymap.set("n", "tfh", builtin.help_tags, { desc = "Search Help" })
		keymap.set("n", "tpp", builtin.resume, { desc = "Previous Picker" })
		keymap.set("n", "tfq", "<cmd>Telescope quickfix<CR>", { desc = "View Quick Fix" })
		keymap.set("n", "tfQ", "<cmd>Telescope quickfixhistory<CR>", { desc = "View Quick Fix History" })
		keymap.set("n", "tgs", require("telescope").extensions.live_grep_args.live_grep_args, { desc = "Grep Search" })
		keymap.set("n", "tgw", lga_scs.grep_word_under_cursor, { desc = "Grep Search Current Word" })
		keymap.set("n", "tfd", builtin.diagnostics, { desc = "Search Diagnostics Across Buffers" })
		keymap.set("n", "tfk", ":Telescope keymaps<CR>", { desc = "Telescope keymaps" })
		keymap.set("n", "t/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzy Search in Buffer" })
	end,
}
