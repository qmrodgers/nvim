local function getCWDName()
  -- returns root directory name and current file
  -- not needed with a breadcrumb, tab plugin
	local dir = vim.fn.getcwd()
	local dirName = string.match(dir, ".*/(.*)$")
	if dirName == nil then
		return ""
	end
	return dirName
end

local getVimMode = function()
	local mode = vim.fn.mode()
	if mode == "n" then
		return ""
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

local getCurrentSearchTerm = function()
  local search = vim.fn.getreg('/')
  if string.len(search) > 20 then
    return " " .. string.sub(search, 1, 20) .. "..."
  end
    return " " .. search
end

local getSystemClipboard = function()
  local clip = vim.fn.getreg('+')
  if string.len(clip) > 20 then
    return " " .. string.sub(clip, 1, 20) .. "..."
  end
    return " " .. clip
end


local getPopularPasteRegisters = function()
  -- update table below with registers you want to display contents of
  local output = ""
  for _, register in pairs({"a", "b", "c", "d", "e", "f"}) do
    local register_contents = vim.fn.getreg(register)
    if string.len(register_contents) > 0 then
      local output_slice = ""
      if string.len(output) > 0 then
        output_slice = output_slice .. " | "
      end
      output_slice = output_slice .. "" .. register .. ": "
      if string.len(register_contents) > 20 then
        output_slice = output_slice .. string.sub(register_contents, 1, 20) .. "..."
      else
        output_slice = output_slice .. register_contents
      end
        output = output .. output_slice
    end
  end

  return "Paste Registers: " .. output
end

return {
	"nvim-lualine/lualine.nvim",
	config = function()
    -- vim.cmd("colorscheme nightfox")
		require("lualine").setup({
			options = {
        globalstatus = true,
				-- theme = "auto",
			},
			sections = {
				lualine_a = { getVimMode, "mode" },
				lualine_b = { "branch", "diff", getCWDName, "filename" },
				lualine_c = { getCurrentSearchTerm, getSystemClipboard },
				lualine_x = { getPopularPasteRegisters },
			},
	})
	end,
}
