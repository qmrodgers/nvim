return {
	-- {
	--   "catppuccin/nvim",
	--   name = "catppuccin",
	--   priority = 1000,
	--   opts = {
	--     auto_integrations = true
	--   }
	-- },
	--
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
	  priority = 1000,
		opts = {
			auto_integrations = true,
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
				term_colors = true,
				transparent_background = true,
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
			},
			--  set by auto_integrations
			-- 	integrations = {
			-- 		aerial = true,
			-- 		alpha = true,
			-- 		cmp = true,
			-- 		dashboard = true,
			-- 		flash = true,
			-- 		fzf = true,
			-- 		grug_far = true,
			-- 		gitsigns = true,
			-- 		headlines = true,
			-- 		illuminate = true,
			-- 		indent_blankline = { enabled = true },
			-- 		leap = true,
			-- 		lsp_trouble = true,
			-- 		mason = true,
			-- 		mini = true,
			-- 		navic = { enabled = true, custom_bg = "lualine" },
			-- 		neotest = true,
			-- 		neotree = true,
			-- 		noice = true,
			-- 		notify = true,
			-- 		snacks = true,
			-- 		telescope = true,
			-- 		treesitter_context = true,
			-- 		which_key = true,
			-- 	},
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.special.bufferline").get_theme()
					end
				end,
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				groups = {
					nightfox = {
						DiffAdd = { bg = "#264c3c" },
						DiffChange = { bg = "#3b4c3c" },
						DiffText = { bg = "#655e3c" },
						DiffDelete = { bg = "#4b2837" },
						DiffviewDiffAddAsDelete = { bg = "#4b2837" },
					},
				},
			})
		end,
	}, -- lazy
}
