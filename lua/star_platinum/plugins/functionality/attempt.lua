return { 
	"m-demare/attempt.nvim", -- No need to specify plenary as dependency
	config = function()
    local attempt = require("attempt")
		attempt.setup({
      list_buffers = true,
      ext_options = { 'lua', 'js', 'json', 'py', 'cpp', 'c', 'md' },  -- Options to choose from
      initial_content = {
        py = function()
          return [[
#!/usr/bin/env python
def main():
    pass

if __name__ == "__main__":
    main()
          ]]
        end
      }
    })

		local wk = require("which-key")
		wk.add({
    {
        '<leader>A',
        group = "Attempt",
        icon = "󰿗"
    },
    {
      '<leader>An',
      attempt.new_select,
      desc = "Select New Attempt Buffer",
      icon = "",
      mode = "n",
    },
    {
      '<leader>Ai',
      attempt.new_input_ext,
      desc = "Create New Attempt Buffer",
      icon = "",
      mode = "n",
    },
    {
      '<leader>Ar',
      attempt.run,
      desc = "Run Attempt Buffer",
      icon = "",
      mode = "n",
    },
    {
      '<leader>Ad',
      attempt.delete_buf,
      desc = "Delete Attempt Buffer",
      icon = "󰆴",
      mode = "n",
    },
    {
      '<leader>Ac',
      attempt.rename_buf,
      desc = "Rename Attempt Buffer",
      icon = "󰑕",
      mode = "n",
    },
		{
      "<leader>fa",
      require('attempt.snacks').picker,
      desc = "Attempt Buffers",
      icon = "󱥰",
      mode = "n",
    },
    {
      "<leader>.",
      attempt.new_select,
      desc = "Select New Attempt Buffer",
      icon = "󰒉",
      mode = "n",
    },
  })
	end,
}
