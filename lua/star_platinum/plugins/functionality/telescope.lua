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
		local action_state = require("telescope.actions.state")
		local mappings = require("telescope.mappings")
		local lga_acs = require("telescope-live-grep-args.actions")
		local lga_scs = require("telescope-live-grep-args.shortcuts")

		local customDeletableBuffer = function()
			builtin.buffers({
				attach_mappings = function(prompt_bufnr, map)
					local delete_buf = function()
						local selection = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.api.nvim_buf_delete(selection.bufnr, { force = true })
					end
					vim.keymap.set({ "i", "n" }, "<c-d>", delete_buf)
					vim.keymap.set({ "i" }, "<c-d>", delete_buf)
					return true
				end,
			})
		end
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"node%_modules/.*",
					"pycache",
					"%.lock",
				},
				vimgrep_arguments = {
					"rg",
					"--hidden",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_to_qflist,
						["<C-s>"] = actions.file_split,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
					n = {
						["<C-d>"] = actions.delete_buffer,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
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
		local keymap = vim.keymap
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recently Opened Files" })
		keymap.set("n", "<leader>fb", customDeletableBuffer, { desc = "Find Open Buffers" })
		keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search Git Files" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search Files" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
		keymap.set("n", "<leader>pp", builtin.resume, { desc = "Previous Picker" })
		keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "View Quick Fix" })
		keymap.set("n", "<leader>fQ", "<cmd>Telescope quickfixhistory<CR>", { desc = "View Quick Fix History" })
		keymap.set(
			"n",
			"<leader>gs",
			require("telescope").extensions.live_grep_args.live_grep_args,
			{ desc = "Grep Search" }
		)
		keymap.set("n", "<leader>gw", lga_scs.grep_word_under_cursor, { desc = "Grep Search Current Word" })
		keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics Across Buffers" })
		keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope keymaps" })
		keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzy Search in Buffer" })
	end,
}
