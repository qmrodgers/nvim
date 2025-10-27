return {
	{
		"mfussenegger/nvim-dap",
		config = function()
        local dap = require("dap")
        local dap_ui = require("dapui")
        local dap_vt = require("nvim-dap-virtual-text")
        local dap_python = require("dap-python")

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ DAP Python Integration Setup                             │
        -- ╰──────────────────────────────────────────────────────────╯
        local debugpyspec = "python"
        if vim.fn.has('win32') == 1 then
          debugpyspec = os.getenv("PYTHON_ENV_PATH") or "python"
        end
        dap_python.setup(debugpyspec)
        table.insert(dap.configurations.python, {
          justMyCode = false,
          request = 'launch',
          name = 'custom config',
          program = '${file}',
          type = 'python',
        })


        -- ╭──────────────────────────────────────────────────────────╮
        -- │ DAP Virtual Text Setup                                   │
        -- ╰──────────────────────────────────────────────────────────╯

        dap_vt.setup({
          enabled = true,                        -- enable this plugin (the default)
          enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
          highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
          highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
          show_stop_reason = true,               -- show stop reason when stopped for exceptions
          commented = false,                     -- prefix virtual text with comment string
          only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
          all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
          filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
          -- Experimental Features:
          virt_text_pos = "eol",                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
          all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
          virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
          virt_text_win_col = nil,               -- position the virtual text at a fixed window column (starting from the first text column) ,
        })

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ DAP UI Setup                                             │
        -- ╰──────────────────────────────────────────────────────────╯

        dap_ui.setup({
          icons = { expanded = "▾", collapsed = "▸" },
          mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          -- Expand lines larger than the window
          -- Requires >= 0.7
          expand_lines = vim.fn.has("nvim-0.7"),
          -- Layouts define sections of the screen to place windows.
          -- The position can be "left", "right", "top" or "bottom".
          -- The size specifies the height/width depending on position. It can be an Int
          -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
          -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
          -- Elements are the elements shown in the layout (in order).
          -- Layouts are opened in order so that earlier layouts take priority in window sizing.
          layouts = {
            {
              elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "watches",
              },
              size = 40, -- 40 columns
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 0.25, -- 25% of total lines
              position = "bottom",
            },
          },
          floating = {
            max_height = nil,                             -- These can be integers or a float between 0 and 1.
            max_width = nil,                              -- Floats will be treated as percentage of your screen.
            border = "rounded", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil, -- Can be integer or nil.
          },
        })


        -- ╭──────────────────────────────────────────────────────────╮
        -- │ DAP Setup
        -- ╰──────────────────────────────────────────────────────────╯

        dap.set_log_level("TRACE")

        -- Automatically open UI
        dap.listeners.before.attach["dapui_config"] = function()
          dap_ui.open()
        end
        dap.listeners.before.launch["dapui_config"] = function()
          dap_ui.open()
        end
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dap_ui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dap_ui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dap_ui.close()
        end

        vim.g.dap_virtual_text = true

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Icons                                                    │
      -- ╰──────────────────────────────────────────────────────────╯
      -- Define highlight group for breakpoints with transparency
      vim.fn.sign_define("DapBreakpoint", { text = "◉", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      -- local highlight = vim.api.nvim_get_hl(0, { name = "Special" })
      -- vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = string.format("#%06x", highlight.fg), blend = 30 })
      vim.fn.sign_define("DapStopped", { text = "★", texthl = "Special", linehl = "@comment.error", numhl = "", culhl = "" })

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Keybindings                                              │
      -- ╰──────────────────────────────────────────────────────────╯
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      keymap("n", "<Leader>da", "<CMD>lua require('dap').continue()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Continue"}))
      keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Toggle Breakpoint" }))
      keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Continue" }))
      keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Evaluate" }))
      keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step Into"}))
      keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step Out"}))
      keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step Over"}))
      keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Terminate"}))
      keymap("n", "<Leader>du", "<CMD>lua require('dapui').open()<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Open"}))
      keymap("n", "<Leader>dc", "<CMD>lua require('dapui').close()<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Close"}))
      keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Float Watches" }))
      keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Float Scopes" }))
      keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", vim.tbl_extend("force", opts, { desc = "DAP_UI: Float Repl" }))

			keymap("n", "<F9>", function()
				dap.toggle_breakpoint()
			end, vim.tbl_extend("force", opts, { desc = "DAP: Toggle Breakpoint" }))
			keymap("n", "<F5>", function()
				dap.continue()
			end, vim.tbl_extend("force", opts, { desc = "DAP: Continue" }))
			keymap("n", "<F11>", function()
				dap.step_into()
			end, vim.tbl_extend("force", opts, { desc = "DAP: Step Into" }))
			keymap("n", "<F12>", function()
				dap.step_over()
			end, vim.tbl_extend("force", opts, { desc = "DAP: Step Over" }))
			keymap("n", "<F8>", function()
				dap.repl.open()
			end, vim.tbl_extend("force", opts, { desc = "DAP: REPL" }))
		end,
		dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      {
        "mfussenegger/nvim-dap-python",
        dependencies = {
          "mfussenegger/nvim-dap"
        }
      }
		},
	},
}
