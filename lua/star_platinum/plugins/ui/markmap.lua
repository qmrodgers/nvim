local opts = {
	html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
	hide_toolbar = false, -- (default)
	grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
}

if vim.fn.has("win32") == 1 then
	opts.html_output = "$HOME/temp/markmap.html"
end

return {
	"Zeioth/markmap.nvim",
	build = "yarn global add markmap-cli",
	cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
	opts = opts,
	config = function(_, opts)
		require("markmap").setup(opts)
	end,
}
