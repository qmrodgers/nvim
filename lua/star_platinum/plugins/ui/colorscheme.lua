return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Enable transparent background
				transparent = false,

				-- Enable italics comments
				italic_comments = false,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,

				-- Modern borderless telescope theme - also applies to fzf-lua
				borderless_telescope = true,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,

				-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
				cache = false,

				theme = {
					variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
					saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
					highlights = {
						-- Highlight groups to override, adding new groups is also possible
						-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

						-- Example:
						Comment = { fg = "#696969", bg = "NONE", italic = true },

						-- Complete list can be found in `lua/cyberdream/theme.lua`
					},

					-- Override a highlight group entirely using the color palette
					overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
						-- Example:
						return {
							Comment = { fg = colors.green, bg = "NONE", italic = true },
							["@property"] = { fg = colors.magenta, bold = true },
						}
					end,

					-- Override a color entirely
					colors = {
						-- For a list of colors see `lua/cyberdream/colours.lua`
						-- Example:
						bg = "#000000",
						green = "#00ff00",
						magenta = "#ff00ff",
					},
				},

				-- Disable or enable colorscheme extensions
				extensions = {
					telescope = true,
					notify = true,
					mini = true,
					leap = true,
					gitsigns = true,
					noice = true,
					treesitter = true,
					treesittercontext = true,
					whichkey = true,
					trouble = true,
					cmp = true,
					lazy = true,
				},
			})
			-- vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"kepano/flexoki-neovim",
		name = "flexoki",
		config = function()
			-- vim.cmd("colorscheme flexoki-dark")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					SignColumn = { bg = "", fg = "#8ec07c" },
					QuickNote = { bg = "", fg = "#d3869b" },
					DiagnosticSignError = { bg = "", fg = "#fb4934" },
					DiagnosticSignWarn = { bg = "", fg = "#fabd2f" },
					DiagnosticSignInfo = { bg = "", fg = "#83a598" },
					DiagnosticSignOk = { bg = "", fg = "#b8bb26" },
					DiagnosticSignHint = { bg = "", fg = "#8ec07c" },
				},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.g.background = "dark"
			-- vim.cmd("colorscheme gruvbox")
		end,
		opts = ...,
	},
	{
		"rebelot/kanagawa.nvim",
	},
}
