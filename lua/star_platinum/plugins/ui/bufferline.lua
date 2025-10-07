vim.api.nvim_set_hl(0, "BufferLineDevIconOil", { fg = "#ff8800" })
vim.api.nvim_set_hl(0, "BufferLineDevIconGit", { fg = "#f1502f" })
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      -- Custom icon for oil.nvim buffers
      get_element_icon = function(element)
        if element.filetype == "oil" then
          return "󰁴", "BufferLineDevIconOil" -- icon, highlight group
        elseif element.filetype == "fugitive" then
          return "", "BufferLineDevIconGit" -- icon, highlight group
        end
        -- fallback to default icon
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = true })
        return icon, hl
      end,
      -- Custom title for oil.nvim buffers
      name_formatter = function(buf)
        local filetype = vim.api.nvim_buf_get_option(buf.bufnr, 'filetype')
        if filetype == "oil" then
          return "oil"
        elseif filetype == "fugitive" then
          return "git"
        end
        -- fallback to default name
        return nil
      end,
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local ret = (diag.error and "󰅚 " .. diag.error .. " " or "")
            .. (diag.warning and "󰀪 " .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "snacks_picker_list",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
      ---@param opts bufferline.IconFetcherOpts
      -- get_element_icon = function(opts)
      --   return LazyVim.config.icons.ft[opts.filetype]
      -- end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
