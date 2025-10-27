# Neovim

This repository contains my Neovim configuration (built for MacOS/Linux)

## Requirements

- **Neovim** >= 0.11.4
- **Python** (required for `nvim-dap-python`)
- **Node.js**, **npm**, or **yarn** (required for `markdown-preview`)
- **fzf** (recommended for fuzzy finding)

## Optional Environment Variables

- `NVIM_MASON_GITHUB_URL`: Set to a GitHub URL (with authentication if needed) to override Mason's default GitHub API endpoint.
- `NVIM_TS_PREFER_GIT`: Set to `true` to use git for Tree-sitter parser downloads instead of HTTP.

## Setup

Clone this repository and symlink the configuration files to your Neovim config directory:

```sh
git clone <your-repo-url> ~/.config/nvim
```

Or set an alias to set an environment variable prior to running neovim

```sh
# uses ~/.config/your_app_name
NVIM_APPNAME=your_app_name nvim
```
