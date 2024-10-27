return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set({ "n", "t" }, "<F1>", "<Cmd>FloatermToggle<CR>")
		vim.keymap.set({ "n", "t" }, "<F2>", "<Cmd>FloatermKill<CR>")
	end,
}
