return {
  "zk-org/zk-nvim",
  branch = "main",
  config = function()
    require("zk").setup({
      picker = "snacks_picker"
    })
    vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<cr>", { desc = "Zk Tags" })
    vim.keymap.set("n", "<leader>zN", "<cmd>ZkNew ", { desc = "Zk New" })
    vim.keymap.set("n", "<leader>zn", "<cmd>ZkNotes<cr>", { desc = "Zk Notes" })
  end
}
