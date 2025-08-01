return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker"
    })
    vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<CR>", { desc = "Zk Tags" })
    vim.keymap.set("n", "<leader>zN", "<cmd>ZkNew ", { desc = "Zk New" })
    vim.keymap.set("n", "<leader>zn", "<cmd>ZkNotes<CR>", { desc = "Zk Notes" })
  end
}
