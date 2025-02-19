-- Session Manager

return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	config = function()
    require("persisted").setup({
      ---@type fun(): boolean
      should_save = function()
        local cwd = (vim.uv or vim.loop).cwd()
        local projects_dir = vim.fn.expand(os.getenv("PROJECTS") or "~/Projects")

        if cwd:sub(1, #projects_dir) == projects_dir then
          return true
        else
          return false
        end
      end,
			autoload = true,
      allowed_dirs = {
        "~/Projects"
      }
		})
		require("telescope").load_extension("persisted")
		vim.keymap.set("n", "<leader>gPl", "<cmd>SessionToggle<CR>", { desc = "Load Persisted Session" })
		vim.keymap.set("n", "<leader>gPs", "<cmd>SessionSave<CR>", { desc = "Save Persisted Session" })
		-- vim.keymap.set("n", "<leader>fS", "<cmd>Telescope persisted<CR>", { desc = "Load Session with Picker" })
	end,
}
