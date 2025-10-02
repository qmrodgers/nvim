return {
  {
    "xzbdmw/colorful-menu.nvim",
    config = function()
      require("colorful-menu").setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },

    }
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    }
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      "fang2hou/blink-copilot",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
      "mikavilpas/blink-ripgrep.nvim",
      {
        "Dynge/gitmoji.nvim",
      },
      {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
          tabkey = "<Tab>",
        },
      },
    },
    version = "1.*",

    --module 'blink.cmp'
    --@type blink.cmp.Config
    opts = {
      snippets = {
        preset = 'luasnip',
      },
      keymap = {
        preset = 'default',
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<Tab>"] = { function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_next()
          end
        end, 
        "snippet_forward", 
        "fallback"
        },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Enter>"] = { "accept", "fallback" },
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-d>"] = { "show_documentation", "hide_documentation" }
      },
      appearance = {
        nerd_font_variant = "mono"
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0
        },
        ghost_text = {
          enabled = false 
        },
        list = {
          selection = { preselect = false, auto_insert = true }
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local mini_icon = MiniIcons.get('default', ctx.label)
                    if mini_icon then
                      icon = mini_icon
                    end
                  else
                    local lsp_icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol"
                    })
                    if lsp_icon ~= "" then
                      icon = lsp_icon
                    end
                  end

                  return icon .. ctx.icon_gap
                end,

                highlight = function(ctx)
                  local hl = "BlinkCmpKind" .. ctx.kind
                    or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local mini_icon, mini_hl = MiniIcons.get('default', ctx.label)
                    
                    if mini_hl then
                      hl = mini_hl
                    end
                  end
                  return hl
                end
              }
            }
          }
        }
      },
      sources = {
        default = { "copilot", "lsp", "path", "snippets", "buffer", "gitmoji", "ripgrep" },
        providers = {
          gitmoji = {
            name = "gitmoji",
            module = "gitmoji.blink",
            opts = {
              filetypes = { "gitcommit", "markdown" },  
            }
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              kind = "Copilot",
              kind_name = "CP"
            }
          },
          ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          -- the options below are optional, some default values are shown
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {},
          -- (optional) customize how the results are displayed. Many options
          -- are available - make sure your lua LSP is set up so you get
          -- autocompletion help
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              -- example: append a description to easily distinguish rg results
              item.labelDetails = {
                description = "(rg)",
              }
            end
            return items
          end,
        },
        }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
