vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 50
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.backspace = "indent,eol,start"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true
vim.opt.showmode = false
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25,v:blinkwait700-blinkoff400-blinkon250"
vim.o.statuscolumn = '%s %#LineNr#%{&nu?v:lnum:""}' .. '%=%#RainbowDelimiterCyan#%{&rnu?" ".v:relnum:""} '
vim.opt.termguicolors = true
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = ""
vim.opt.isfname:append("@-@")
-- if vim.fn.has("win32") == 1 then
-- 	vim.go.shell = "bash"
-- 	vim.go.shellcmdflag = "-c"
-- 	vim.go.shellxquote = ""
-- else
-- 	vim.g.shell = "zsh"
-- end
vim.api.nvim_create_user_command("FormatPythonJson", function()
	vim.cmd("%s/'/\"/g")
	vim.cmd("%s/True/true/gi")
	vim.cmd("%s/False/false/gi")
	vim.cmd("%s/None/null/gi")
end, {})

vim.g.markdown_recommended_style = 0

vim.opt.shortmess:append("Ws")
