return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
    vim.lsp.config("basedpyright", {
      root_markers = { "pyproject.toml", ".git" },
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",
            -- autoImportCompletions = true
            -- autoSearchPaths = true
            -- useLibraryCodeForTypes = true
          }
        }
      }
    })
    vim.lsp.enable("basedpyright")
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        }
      }
    })
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("cssls")
    vim.lsp.config("svelte", {
      filetypes = { "svelte" },
    })
    vim.lsp.enable("svelte")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("emmet_ls")
    vim.lsp.enable("jdtls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.config("terraformls", {
      filetypes = { "hcl", "tf", "tfvars", "terraform", "terraform-vars" }
    })
    vim.lsp.enable("terraformls")

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "See Code Actions"
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Rename Object"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "See Code Actions"
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Show Line Diagnostics"
			keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)

			opts.desc = "Go To Previous Diagnostic"
			keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, opts)

			opts.desc = "Go To Next Diagnostic"
			keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, opts)

			opts.desc = "Go To Previous Error"
			keymap.set("n", "[e", function()
        vim.diagnostic.jump({ count = -1, severity = { vim.diagnostic.severity.ERROR }, float = true })
      end, opts)

			opts.desc = "Go To Next Error"
			keymap.set("n", "]e", function()
        vim.diagnostic.jump({ count = 1, severity = { vim.diagnostic.severity.ERROR }, float = true })
      end, opts)

			opts.desc = "Go To Previous Warning"
			keymap.set("n", "[w", function()
        vim.diagnostic.jump({ count = -1, severity = { vim.diagnostic.severity.WARN }, float = true })
      end, opts)

			opts.desc = "Go To Next Warning"
			keymap.set("n", "]w", function()
        vim.diagnostic.jump({ count = 1, severity = { vim.diagnostic.severity.WARN }, float = true })
      end, opts)

			opts.desc = "Go To Previous Info Diagnostic"
			keymap.set("n", "[i", function()
        vim.diagnostic.jump({ count = -1, severity = { vim.diagnostic.severity.INFO }, float = true })
      end, opts)

			opts.desc = "Go To Next Info Diagnostic"
			keymap.set("n", "]i", function()
        vim.diagnostic.jump({ count = 1, severity = { vim.diagnostic.severity.INFO }, float = true })
      end, opts)

			opts.desc = "Go To Previous Hint"
			keymap.set("n", "[h", function()
        vim.diagnostic.jump({ count = -1, severity = { vim.diagnostic.severity.HINT }, float = true })
      end, opts)

			opts.desc = "Go To Next Hint"
			keymap.set("n", "]h", function()
        vim.diagnostic.jump({ count = 1, severity = { vim.diagnostic.severity.HINT }, float = true })
      end, opts)

			opts.desc = "Hover Definition"
			keymap.set("n", "gh", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = on_attach
    })

		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    vim.g.have_nerd_font = true
    vim.diagnostic.config({
        severity_sort = true,
        float = {
            border = "rounded",
            source = "if_many",
        },
        underline = {
            severity = vim.diagnostic.severity.ERROR
        },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋼 ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
          },
        } or {},
        virtual_text = {
            source = "if_many",
            spacing = 2,
            format = function(diagnostic)
                local diagnostic_message = {
                    [vim.diagnostic.severity.ERROR] = diagnostic.message,
                    [vim.diagnostic.severity.WARN] = diagnostic.message,
                    [vim.diagnostic.severity.INFO] = diagnostic.message,
                    [vim.diagnostic.severity.HINT] = diagnostic.message
                }
                return diagnostic_message[diagnostic.severity]
            end
          },
    })

  end
}
