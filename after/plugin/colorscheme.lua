local function set_custom_diff_colors()

  local colorscheme = vim.g.colors_name

  if colorscheme == "catppuccin-mocha" then
    -- Palette colors
    local green   = "#a6e3a1" -- DiffAdd
    local yellow  = "#f9e2af" -- DiffChange
    local red     = "#f38ba8" -- DiffDelete
    local blue    = "#89b4fa" -- DiffText
    local fg = "#313244" -- Background for contrast

    -- vim.api.nvim_set_hl(0, "DiffAdd",    { fg = fg, bg = "#a6e3a1", bold = true })
    -- vim.api.nvim_set_hl(0, "DiffChange", { fg = fg, bg = "#f9e2af", bold = true })
    -- vim.api.nvim_set_hl(0, "DiffDelete", { fg = fg, bg = "#f38ba8", bold = true })
    -- vim.api.nvim_set_hl(0, "DiffText",   { fg = fg, bg = "#89b4fa" , bold = true })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_custom_diff_colors,
})

set_custom_diff_colors()
