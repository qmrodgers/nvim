-- Highlight color codes inserted into text with their respective colors

return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
      '*' -- sets as enabled for all filetypes, can customize more below
    }, {
    mode = "background" -- `foreground` | `background`
  })
	end,
}
