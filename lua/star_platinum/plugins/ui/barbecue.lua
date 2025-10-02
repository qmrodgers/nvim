-- Breakcrumbs at top of file (ex: lua > star_platinum > plugins > mappings.lua > return )

return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
  config = function()
    require("barbecue").setup({})
      vim.api.nvim_create_autocmd("User", {
        desc = "Hide barbecue when entering DiffView",
        pattern = "DiffviewViewEnter",
        callback = function()
          require("barbecue.ui").toggle(false)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        desc = "Show barbecue when leaving DiffView",
        pattern = "DiffviewViewLeave",
        callback = function()
          require("barbecue.ui").toggle(true)
        end,
      })
  end,
}
