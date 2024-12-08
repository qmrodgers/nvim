-- jj as an alternative to escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- Remap Control+Movement to operate normally in insert mode
vim.keymap.set({ "n", "i" }, "<C-j>", "<Down>", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-k>", "<Up>", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-h>", "<Left>", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-l>", "<Right>", { noremap = true })

vim.keymap.set(
	"n",
	"<leader>db",
	"<cmd>%bd|e#|bd#<CR>",
	{ noremap = true, desc = "(D)elete (A)ll (B)uffers - Except Current" }
)

vim.keymap.set("n", "gj", "<C-w>w", { noremap = true, desc = "Jump to Next Window" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, desc = "Split Window Vertically" })

vim.keymap.set("n", "<leader>ss", "<C-w>s", { noremap = true, desc = "Split Window Horizontally" })

vim.keymap.set("n", "<leader>sr", "<C-w>=", { noremap = true, desc = "Equalize Window Sizes" })

vim.keymap.set("n", "gk", "<C-w>q", { noremap = true, desc = "Kill Window" })

vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, desc = "Move to Lower Window" })

vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, desc = "Move to Upper Window" })

vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, desc = "Move to Left Window" })

vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, desc = "Move to Right Window" })

vim.keymap.set("n", "<A-J>", "<C-w>J", { noremap = true })

vim.keymap.set("n", "<A-K>", "<C-w>K", { noremap = true })

vim.keymap.set("n", "<A-H>", "<C-w>H", { noremap = true })

vim.keymap.set("n", "<A-L>", "<C-w>L", { noremap = true })

vim.keymap.set("n", "<leader>wI", "5<C-w>+", { noremap = true, desc = "Increase Window Height" })

vim.keymap.set("n", "<leader>wD", "5<C-w>-", { noremap = true, desc = "Decrease Window Height" })

vim.keymap.set("n", "<leader>wi", "20<C-w>>", { noremap = true, desc = "Increase Window Width" })

vim.keymap.set("n", "<leader>wd", "20<C-w><", { noremap = true, desc = "Decrease Window Width" })

vim.keymap.set("n", "<leader>ww", "<cmd>w<cr>", { noremap = true, desc = "Save Buffer" })

vim.keymap.set("n", "<leader>wa", "<cmd>wa<cr>", { noremap = true, desc = "Save All Buffers" })

vim.keymap.set("n", "<leader>wz", "<cmd>qa<cr>", { noremap = true, desc = "Quit All Buffers" })

vim.keymap.set("n", "<leader>wZ", "<cmd>qa!<cr>", { noremap = true, desc = "Quit All Buffers" })

vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { noremap = true, desc = "Save All Buffers" })

vim.keymap.set("n", "<leader>wQ", "<cmd>wqa<cr>", { noremap = true, desc = "Save and Quit All Buffers" })

vim.keymap.set("n", "gB", "<cmd>%bd|e#|bd#<CR>", { noremap = true, desc = "Clear All Buffers" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ popup_opts = { border = "rounded", focusable = false } })
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ popup_opts = { border = "rounded", focusable = false } })
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
		popup_opts = { border = "rounded", focusable = false },
	})
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
		popup_opts = { border = "rounded", focusable = false },
	})
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.WARN,
		popup_opts = { border = "rounded", focusable = false },
	})
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.WARN,
		popup_opts = { border = "rounded", focusable = false },
	})
	vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set("n", "<leader>do", function()
	vim.diagnostic.open_float({
		border = "rounded",
	}, { desc = "Open Diagnostic Float" })
end)

-- Exit terminal more easily
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cn", ":cnext<cr>zz")
vim.keymap.set("n", "<leader>cb", ":cprevious<cr>zz")
vim.keymap.set("n", "<leader>co", ":copen<cr>zz")
vim.keymap.set("n", "<leader>cc", ":cclose<cr>zz")

vim.keymap.set("n", "<space>", "<nop>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "<leader>p", "pgvy=']")

-- Center vertically after large movements
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("v", "y", "ygv<ESC>")

vim.keymap.set("i", "<A-i>", "<ESC>I")
vim.keymap.set("i", "<A-a>", "<ESC>A")

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "x", "_x")
vim.keymap.set("n", "<leader>dB", "<cmd>bdelete!<cr>", { desc = "Delete current buffer without saving" })
