local function getCWDName()
	local dir = vim.fn.getcwd()
	local dirName = string.match(dir, ".*/(.*)$")
	if dirName == nil then
		return ""
	end
	return dirName
end

local function getVimMode()
    local mode = vim.fn.mode()
    if mode == "n" then
        return ""
    elseif mode == "i" then
        return ""
    elseif mode == "v" or mode == "V" or mode == "^V" then
        return ""
    elseif mode == "r" then
        return "󰓡"
    elseif mode == "c" then
        return "󰍹"
    else
        return ""
    end
end


return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
                lualine_a = { getVimMode, "mode"  },
				lualine_c = { getCWDName, "filename" },
			},
		})
	end,
}
