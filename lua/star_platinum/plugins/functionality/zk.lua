return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker"
    })
    vim.keymap.set("n", "zkt", "<cmd>ZkTags<CR>", { desc = "Zk Tags" })
    vim.keymap.set("n", "zkn", "<cmd>ZkNotes<CR>", { desc = "Zk Notes" })
    vim.keymap.set("n", "zkl", "<cmd>ZkInsertLink<CR>", { desc = "Zk Insert Link" })
    vim.keymap.set("n", "zkN", ":ZkNewNote ", { desc = "Zk New" })

    -- vim.api.nvim_create_user_command(
    --   "ZkNewNote",
    --   function(opts)
    --     local args = { dir = opts.fargs[1] }
    --     if opts.fargs[2] then
    --       args.title = opts.fargs[2]
    --     end
    --     require("zk.commands").get("ZkNew")(args)
    --   end,
    --   {
    --     nargs = "*", -- Accept any args
    --     desc = "Create a new Zk note with directory and optional title"
    --   }
    -- )

		vim.api.nvim_create_user_command("ZkNewNote", function(opts)
			local dir = opts.fargs[1]
			local title = table.concat(vim.list_slice(opts.fargs, 2), " ")
			require("zk.commands").get("ZkNew")({ dir = dir, title = title })
		end, {
			nargs = "*", -- accept any number of args (including spaces)
			desc = "Create a new Zk note with directory and optional title",
		})
  end
}
