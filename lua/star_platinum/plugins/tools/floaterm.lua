return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set({ "n", "t", "i" }, "<F1>", "<Cmd>FloatermToggle<CR>")
		vim.keymap.set({ "n", "t", "i"}, "<F2>", "<Cmd>FloatermKill<CR>")

    -- ensure mappings are enabled within certain plugins/filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fugitive",
      callback = function()
        for _, mode in ipairs({ "n", "t" }) do
          vim.api.nvim_buf_set_keymap(0, mode, "<F1>", "<Cmd>FloatermToggle<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(0, mode, "<F2>", "<Cmd>FloatermKill<CR>", { noremap = true, silent = true })
        end
      end,
    })
	end,
}
