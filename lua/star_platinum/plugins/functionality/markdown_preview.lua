return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.keymap.set("n", "<leader>mP", "<cmd>MarkdownPreview<cr>", {
      desc = "Markdown Preview",
    })
  end,
  ft = { "markdown" },
}
