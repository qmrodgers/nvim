return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind-nvim",
		{
			"kawre/neotab.nvim",
			event = "InsertEnter",
			opts = {
				tabkey = "",
			},
		},
		"hrsh7th/cmp-vsnip",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		local cmp_luasnip = require("cmp_luasnip")
		local cmp_buffer = require("cmp_buffer")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local cmp_path = require("cmp_path")
		local cmp_nvim_lua = require("cmp_nvim_lua")
		local cmp_vsnip = require("cmp_vsnip")
		local neotab = require("neotab")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["jk"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<C-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-S-j>"] = cmp.mapping.scroll_docs(4),
				["<C-S-k>"] = cmp.mapping.scroll_docs(-4),
				["<Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.jumpable(1) then
						luasnip.expand_or_jump(1)
					else
						neotab.tabout()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			sources = cmp.config.sources({
				{ name = "calc" },
				{ name = "buffer" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "vsnip" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						calc = "[Calc]",
						path = "[Path]",
						nvim_lua = "[Lua]",
						luasnip = "[LuaSnip]",
						vsnip = "[VSnip]",
					},
				}),
			},
		})
	end,
}
