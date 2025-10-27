return {
	"tpope/vim-fugitive",
	config = function()

    local function open_fugitive_float()
      vim.cmd("Git")
      local timer = (vim.uv or vim.loop).new_timer()
      local fug_win = vim.api.nvim_get_current_win()
      local fug_buf = vim.api.nvim_win_get_buf(fug_win)
      local width = math.floor(vim.o.columns * 0.4)
      local height = math.floor(vim.o.lines * 0.3)
      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)
      local win_opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
      }
      local function mod_fugitive()
        vim.keymap.set("n", "q", function () vim.api.nvim_win_close(fug_win, true) end, 
        {
            buffer = fug_buf,
            desc = "Close fugitive window with just q"
        })
        vim.keymap.set("n", "<Esc>", function () vim.api.nvim_win_close(fug_win, true) end,
        {
            buffer = fug_buf,
            desc = "Close fugitive window with just <Esc>"
        })
        local fug_floatwin = vim.api.nvim_create_augroup("fugitiveFloatwin", {clear = true})
        vim.api.nvim_create_autocmd("BufLeave",
        {
            buffer = fug_buf,
            callback = function () 
                vim.api.nvim_win_close(fug_win, true) 
                vim.api.nvim_del_augroup_by_id(fug_floatwin)
            end,
            desc = "Close fugitive floating window after we leave it",
            group = fug_floatwin,
        })
        return vim.api.nvim_win_set_config(fug_win, win_opts)
      end
      return timer:start(1, 0, vim.schedule_wrap(mod_fugitive))
    end

		local map = vim.keymap
		map.set("n", "<leader>gg", function()
      open_fugitive_float()
    end, { desc = "Open Fugitive (Float)" })
    map.set("n", "<leader>G", ":Git<CR>", { desc = "Open Fugitive" })
		map.set("n", "<leader>gl", ":Git log<CR>", { desc = "Open Git Log" })
		map.set("n", "<leader>gpp", ":Git push ", { desc = "Git Push" })
		map.set("n", "<leader>gpm", ":Git pm ", { desc = "Git Push with Merge Target" })
		map.set("n", "<leader>gpP", ":Git aap ", { desc = "Git aap" })
		map.set("n", "<leader>gpM", ":Git aam ", { desc = "Git aam" })
		map.set("n", "<leader>gc", ":Git commit ", { desc = "Git Commit" })
		map.set("n", "<leader>gC", ":Git checkout ", { desc = "Git Checkout" })
		map.set("n", "<leader>g-", ":Git checkout -<CR>", { desc = "Git Checkout Last" })
		map.set("n", "<leader>gm", ":Git merge ", { desc = "Git Merge" })
		map.set("n", "<leader>gA", ":Git add -A<CR>", { desc = "Git Add All" })
		map.set("n", "<leader>ga", ":Git add ", { desc = "Git Add" })
	end,
}
