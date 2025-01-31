return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-symbols.nvim",
	},
	config = function()
    local truncate_path = function(opts, path)
        local parts = vim.split(path, '/')
        local len = #parts
        if len > 2 then
          return table.concat(parts, '/', len - 2, len)
        else
          return path
        end
    end
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
						"--no-ignore",
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
          "--no-ignore",
					"--hidden",
					"--glob",
				},
			})
		end

		local ivy_theme = function(func, opts)
			return function()
				func(require("telescope.themes").get_ivy(opts))
			end
		end

		local dropdown_theme = function(func, opts)
			return function()
				func(require("telescope.themes").get_dropdown(opts))
			end
		end
		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("quicknote")
		local keymap = vim.keymap

    keymap.set("n", "<leader>gtb", function() builtin.git_branches{
    } end, { desc = "View Git Branches" })

    keymap.set("n", "<leader>gtf", function() builtin.git_bcommits{
    } end, { desc = "View Git Commits for File" })

    -- - `<cr>`: checks out the currently selected commit
    -- - `<c-v>`: opens a diff in a vertical split
    -- - `<c-x>`: opens a diff in a horizontal split
    -- - `<c-t>`: opens a diff in a new tab

    keymap.set("n", "<leader>gtc", function() builtin.git_commits{
    } end, { desc = "View Git Commits for Branch" })

    keymap.set("n", "<leader>glt",function() builtin.lsp_type_definitions{
      winblend = 10,
      path_display = truncate_path,
      fname_width = 0.3,
      layout_strategy = 'vertical'
    } end, { desc = "Go to Type Definitions" })

		keymap.set("n", "<leader>glr", function() builtin.lsp_references{
      winblend = 10,
      path_display = truncate_path,
      fname_width = 0.3,
      layout_strategy = 'vertical'
    } end, { desc = "View LSP References" })

			keymap.set("n", "<leader>gld", function() builtin.lsp_definitions{
      winblend = 10,
      path_display = truncate_path,
      fname_width = 0.3,
      layout_strategy = 'vertical'
    } end, { desc = "Go to Definitions" })

			keymap.set("n", "<leader>glt",function() builtin.lsp_type_definitions{
      winblend = 10,
      path_display = truncate_path,
      fname_width = 0.3,
      layout_strategy = 'vertical'
    } end, { desc = "Go to Type Definitions" })

		keymap.set("n", "<leader>glr", function() builtin.lsp_references{
      winblend = 10,
      path_display = truncate_path,
      fname_width = 0.3,
      layout_strategy = 'vertical'
    } end, { desc = "View LSP References" })

		keymap.set("n", "<leader>fr", ivy_theme(builtin.oldfiles), { desc = "Find Recently Opened Files" })
		keymap.set("n", "<leader>fb", ivy_theme(builtin.buffers), { desc = "Find Open Buffers" })
		keymap.set("n", "<leader>gf", ivy_theme(builtin.git_files), { desc = "Search Git Files" })
		keymap.set("n", "<leader>ff", ivy_theme(builtin.find_files), { desc = "Search Files" })
		keymap.set("n", "<leader>fc", ivy_theme(builtin.highlights), { desc = "Search Files" })
		keymap.set("n", "<leader>fh", ivy_theme(builtin.help_tags), { desc = "Search Help" })
		keymap.set("n", "<leader>pp", ivy_theme(builtin.resume), { desc = "Previous Picker" })
		keymap.set("n", "<leader>fq", ivy_theme(builtin.quickfix), { desc = "Telescope Quick Fix" })
		keymap.set("n", "<leader>fw", ivy_theme(builtin.quickfixhistory), { desc = "Telescope Quick Fix History" })
		keymap.set("n", "<leader>fg", ivy_theme(builtin.highlights), { desc = "Telescope Highlight Groups" })
		keymap.set("n", "<leader>fc", ivy_theme(builtin.highlights), { desc = "Telescope Find Commands" })
		keymap.set("n", "<leader>fx", ivy_theme(builtin.command_history), { desc = "Telescope Find Previous Commands" })
		keymap.set("n", "<leader>fs", ivy_theme(builtin.symbols), { desc = "Telescope Find Symbols" })
		keymap.set(
			"n",
			"<leader>gs",
			ivy_theme(require("telescope").extensions.live_grep_args.live_grep_args),
			{ desc = "Grep Search" }
		)
		keymap.set("n", "<leader>gw", ivy_theme(lga_scs.grep_word_under_cursor), { desc = "Grep Search Current Word" })
		keymap.set("n", "<leader>fd", ivy_theme(builtin.diagnostics), { desc = "Search Diagnostics Across Buffers" })
		keymap.set("n", "<leader>fk", ivy_theme(builtin.keymaps), { desc = "Telescope keymaps" })
		keymap.set(
			"n",
			"<leader>/",
			dropdown_theme(builtin.current_buffer_fuzzy_find, {
				winblend = 10,
				previewer = false,
        layout_config = {
          width = 0.5,
          height = 0.5,
        },
			}),
			{ desc = "Fuzzy Search in Buffer" }
		)
	end,
}
