return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch="main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    lazy = vim.fn.argc(-1) == 0,
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "git_rebase",
        "query",
        "vim",
        "vimdoc",
        "javascript",
        "python",
        "rust",
        "cpp",
        "json",
        "jsonc",
        "typescript",
        "tsx",
        "yaml",
        "svelte",
        "gitignore",
        "regex",
      },
    },
    config = function()
      if os.getenv("NVIM_TS_PREFER_GIT") == "true" then
        require("nvim-treesitter.install").prefer_git = true
      end
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true,
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
  }
}
