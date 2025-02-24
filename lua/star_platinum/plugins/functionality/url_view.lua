vim.keymap.set({ "n", "v" }, "<leader>uv", "<cmd>UrlView<CR>", { noremap = true, silent = true })
local config = {}
if vim.fn.has("win32") == 1 then
	config = {
		default_picker = "native",
		default_action = "explorer",
	}
else
	config = {
		default_picker = "native",
    default_action = "system",
	}
end
return {
	"axieax/urlview.nvim",
	config = function()
		require("urlview").setup(config)
	end,
}
