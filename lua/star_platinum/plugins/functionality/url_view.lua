local config = {}
if vim.fn.has("win32") == 1 then
	config = {
		default_picker = "telescope",
		default_action = "explorer",
	}
else
	config = {
		default_picker = "telescope",
	}
end
return {
	"axieax/urlview.nvim",
	config = function()
		require("urlview").setup(config)
	end,
}
