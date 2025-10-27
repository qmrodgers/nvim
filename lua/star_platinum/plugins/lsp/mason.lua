local mason_config = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

local custom_github_url = os.getenv("NVIM_MASON_GITHUB_URL")

if custom_github_url then
  mason_config.github = {
    download_url_template = custom_github_url
  }
  print(vim.inspect(mason_config))
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup(mason_config)

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"svelte",
				"lua_ls",
				"graphql",
        "basedpyright",
				"jsonls",
				"ts_ls",
        "terraformls"
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"isort",
				"eslint_d",
        "black"
			},
		})
	end,
}
