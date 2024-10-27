-- Highlight color codes inserted into text with their respective colors

return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
}
