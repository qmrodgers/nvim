local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "<leader>ct", "<cmd>Colortils<cr>",vim.tbl_extend('force', opts, { desc = 'Open Colortils' }))

return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
    require("colortils").setup()
  end,
}
