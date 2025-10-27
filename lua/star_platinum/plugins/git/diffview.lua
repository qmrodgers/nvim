return {
  "sindrets/diffview.nvim",
  config = function()
    -- Lua
    local actions = require("diffview.actions")

    require("diffview").setup({
      diff_binaries = false, -- Show diffs for binaries
      enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
      git_cmd = { "git" },   -- The git executable followed by default args.
      hg_cmd = { "hg" },     -- The hg executable followed by default args.
      use_icons = true,      -- Requires nvim-web-devicons
      show_help_hints = true, -- Show hints for how to open the help panel
      watch_index = true,    -- Update views and index buffers when the git index changes.
      icons = {              -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          disable_diagnostics = false,
          winbar_info = false,    -- See |diffview-config-view.x.winbar_info|
        },
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = "diff3_horizontal",
          disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = true,    -- See |diffview-config-view.x.winbar_info|
        },
        file_history = {
          -- Config for changed files in file history views.
          layout = "diff2_horizontal",
          disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = false,    -- See |diffview-config-view.x.winbar_info|
        },
      },
      file_panel = {
        listing_style = "tree",       -- One of 'list' or 'tree'
        tree_options = {              -- Only applies when listing_style is 'tree'
          flatten_dirs = true,        -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = {                -- See |diffview-config-win_config|
          position = "left",
          width = 35,
          win_opts = {},
        },
      },
      file_history_panel = {
        log_options = { -- See |diffview-config-log_options|
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
          hg = {
            single_file = {},
            multi_file = {},
          },
        },
        win_config = { -- See |diffview-config-win_config|
          position = "bottom",
          height = 16,
          win_opts = {},
        },
      },
      commit_log_panel = {
        win_config = {}, -- See |diffview-config-win_config|
      },
      default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},             -- See |diffview-config-hooks|
      keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
          -- The `view` bindings are active in the diff buffers, only when the current
          -- tabpage is a Diffview.
          {
            "n",
            "<tab>",
            actions.select_next_entry,
            { desc = "Open the diff for the next file" },
          },
          {
            "n",
            "<s-tab>",
            actions.select_prev_entry,
            { desc = "Open the diff for the previous file" },
          },
          {
            "n",
            "[F",
            actions.select_first_entry,
            { desc = "Open the diff for the first file" },
          },
          {
            "n",
            "]F",
            actions.select_last_entry,
            { desc = "Open the diff for the last file" },
          },
          {
            "n",
            "gf",
            actions.goto_file_edit,
            { desc = "Open the file in the previous tabpage" },
          },
          {
            "n",
            "<C-w><C-f>",
            actions.goto_file_split,
            { desc = "Open the file in a new split" },
          },
          {
            "n",
            "<C-w>gf",
            actions.goto_file_tab,
            { desc = "Open the file in a new tabpage" },
          },
          {
            "n",
            "<leader>e",
            actions.focus_files,
            { desc = "Bring focus to the file panel" },
          },
          { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel." } },
          {
            "n",
            "g<C-x>",
            actions.cycle_layout,
            { desc = "Cycle through available layouts." },
          },
          {
            "n",
            "[x",
            actions.prev_conflict,
            { desc = "In the merge-tool: jump to the previous conflict" },
          },
          {
            "n",
            "]x",
            actions.next_conflict,
            { desc = "In the merge-tool: jump to the next conflict" },
          },
          {
            "n",
            "<leader>co",
            actions.conflict_choose("ours"),
            { desc = "Choose the OURS version of a conflict" },
          },
          {
            "n",
            "<leader>ct",
            actions.conflict_choose("theirs"),
            { desc = "Choose the THEIRS version of a conflict" },
          },
          {
            "n",
            "<leader>cb",
            actions.conflict_choose("base"),
            { desc = "Choose the BASE version of a conflict" },
          },
          {
            "n",
            "<leader>ca",
            actions.conflict_choose("all"),
            { desc = "Choose all the versions of a conflict" },
          },
          {
            "n",
            "dx",
            actions.conflict_choose("none"),
            { desc = "Delete the conflict region" },
          },
          {
            "n",
            "<leader>cO",
            actions.conflict_choose_all("ours"),
            { desc = "Choose the OURS version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cT",
            actions.conflict_choose_all("theirs"),
            { desc = "Choose the THEIRS version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cB",
            actions.conflict_choose_all("base"),
            { desc = "Choose the BASE version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cA",
            actions.conflict_choose_all("all"),
            { desc = "Choose all the versions of a conflict for the whole file" },
          },
          {
            "n",
            "dX",
            actions.conflict_choose_all("none"),
            { desc = "Delete the conflict region for the whole file" },
          },
        },
        diff1 = {
          -- Mappings in single window diff layouts
          { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
        },
        diff2 = {
          -- Mappings in 2-way diff layouts
          { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
        },
        diff3 = {
          -- Mappings in 3-way diff layouts
          {
            { "n",                                                            "x" },
            "2do",
            actions.diffget("ours"),
            { desc = "Obtain the diff hunk from the OURS version of the file" },
          },
          {
            { "n",                                                              "x" },
            "3do",
            actions.diffget("theirs"),
            { desc = "Obtain the diff hunk from the THEIRS version of the file" },
          },
          { "n", "g?", actions.help({ "view", "diff3" }), { desc = "Open the help panel" } },
        },
        diff4 = {
          -- Mappings in 4-way diff layouts
          {
            { "n",                                                            "x" },
            "1do",
            actions.diffget("base"),
            { desc = "Obtain the diff hunk from the BASE version of the file" },
          },
          {
            { "n",                                                            "x" },
            "2do",
            actions.diffget("ours"),
            { desc = "Obtain the diff hunk from the OURS version of the file" },
          },
          {
            { "n",                                                              "x" },
            "3do",
            actions.diffget("theirs"),
            { desc = "Obtain the diff hunk from the THEIRS version of the file" },
          },
          { "n", "g?", actions.help({ "view", "diff4" }), { desc = "Open the help panel" } },
        },
        file_panel = {
          {
            "n",
            "j",
            actions.next_entry,
            { desc = "Bring the cursor to the next file entry" },
          },
          {
            "n",
            "<down>",
            actions.next_entry,
            { desc = "Bring the cursor to the next file entry" },
          },
          {
            "n",
            "k",
            actions.prev_entry,
            { desc = "Bring the cursor to the previous file entry" },
          },
          {
            "n",
            "<up>",
            actions.prev_entry,
            { desc = "Bring the cursor to the previous file entry" },
          },
          {
            "n",
            "<cr>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "o",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "l",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "<2-LeftMouse>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "-",
            actions.toggle_stage_entry,
            { desc = "Stage / unstage the selected entry" },
          },
          {
            "n",
            "s",
            actions.toggle_stage_entry,
            { desc = "Stage / unstage the selected entry" },
          },
          { "n", "S", actions.stage_all,   { desc = "Stage all entries" } },
          { "n", "U", actions.unstage_all, { desc = "Unstage all entries" } },
          {
            "n",
            "X",
            actions.restore_entry,
            { desc = "Restore entry to the state on the left side" },
          },
          {
            "n",
            "L",
            actions.open_commit_log,
            { desc = "Open the commit log panel" },
          },
          { "n", "zo",    actions.open_fold,          { desc = "Expand fold" } },
          { "n", "h",     actions.close_fold,         { desc = "Collapse fold" } },
          { "n", "zc",    actions.close_fold,         { desc = "Collapse fold" } },
          { "n", "za",    actions.toggle_fold,        { desc = "Toggle fold" } },
          { "n", "zR",    actions.open_all_folds,     { desc = "Expand all folds" } },
          { "n", "zM",    actions.close_all_folds,    { desc = "Collapse all folds" } },
          { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
          {
            "n",
            "<c-f>",
            actions.scroll_view(0.25),
            { desc = "Scroll the view down" },
          },
          {
            "n",
            "<tab>",
            actions.select_next_entry,
            { desc = "Open the diff for the next file" },
          },
          {
            "n",
            "<s-tab>",
            actions.select_prev_entry,
            { desc = "Open the diff for the previous file" },
          },
          {
            "n",
            "[F",
            actions.select_first_entry,
            { desc = "Open the diff for the first file" },
          },
          {
            "n",
            "]F",
            actions.select_last_entry,
            { desc = "Open the diff for the last file" },
          },
          {
            "n",
            "gf",
            actions.goto_file_edit,
            { desc = "Open the file in the previous tabpage" },
          },
          {
            "n",
            "<C-w><C-f>",
            actions.goto_file_split,
            { desc = "Open the file in a new split" },
          },
          {
            "n",
            "<C-w>gf",
            actions.goto_file_tab,
            { desc = "Open the file in a new tabpage" },
          },
          {
            "n",
            "i",
            actions.listing_style,
            { desc = "Toggle between 'list' and 'tree' views" },
          },
          {
            "n",
            "f",
            actions.toggle_flatten_dirs,
            { desc = "Flatten empty subdirectories in tree listing style" },
          },
          {
            "n",
            "R",
            actions.refresh_files,
            { desc = "Update stats and entries in the file list" },
          },
          {
            "n",
            "<leader>e",
            actions.focus_files,
            { desc = "Bring focus to the file panel" },
          },
          {
            "n",
            "<leader>b",
            actions.toggle_files,
            { desc = "Toggle the file panel" },
          },
          {
            "n",
            "g<C-x>",
            actions.cycle_layout,
            { desc = "Cycle available layouts" },
          },
          {
            "n",
            "[x",
            actions.prev_conflict,
            { desc = "Go to the previous conflict" },
          },
          {
            "n",
            "]x",
            actions.next_conflict,
            { desc = "Go to the next conflict" },
          },
          { "n", "g?", actions.help("file_panel"), { desc = "Open the help panel" } },
          {
            "n",
            "<leader>cO",
            actions.conflict_choose_all("ours"),
            { desc = "Choose the OURS version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cT",
            actions.conflict_choose_all("theirs"),
            { desc = "Choose the THEIRS version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cB",
            actions.conflict_choose_all("base"),
            { desc = "Choose the BASE version of a conflict for the whole file" },
          },
          {
            "n",
            "<leader>cA",
            actions.conflict_choose_all("all"),
            { desc = "Choose all the versions of a conflict for the whole file" },
          },
          {
            "n",
            "dX",
            actions.conflict_choose_all("none"),
            { desc = "Delete the conflict region for the whole file" },
          },
        },
        file_history_panel = {
          { "n", "g!", actions.options,         { desc = "Open the option panel" } },
          {
            "n",
            "<C-A-d>",
            actions.open_in_diffview,
            { desc = "Open the entry under the cursor in a diffview" },
          },
          {
            "n",
            "y",
            actions.copy_hash,
            { desc = "Copy the commit hash of the entry under the cursor" },
          },
          { "n", "L",  actions.open_commit_log, { desc = "Show commit details" } },
          {
            "n",
            "X",
            actions.restore_entry,
            { desc = "Restore file to the state from the selected entry" },
          },
          { "n", "zo", actions.open_fold,       { desc = "Expand fold" } },
          { "n", "zc", actions.close_fold,      { desc = "Collapse fold" } },
          { "n", "h",  actions.close_fold,      { desc = "Collapse fold" } },
          { "n", "za", actions.toggle_fold,     { desc = "Toggle fold" } },
          { "n", "zR", actions.open_all_folds,  { desc = "Expand all folds" } },
          { "n", "zM", actions.close_all_folds, { desc = "Collapse all folds" } },
          {
            "n",
            "j",
            actions.next_entry,
            { desc = "Bring the cursor to the next file entry" },
          },
          {
            "n",
            "<down>",
            actions.next_entry,
            { desc = "Bring the cursor to the next file entry" },
          },
          {
            "n",
            "k",
            actions.prev_entry,
            { desc = "Bring the cursor to the previous file entry" },
          },
          {
            "n",
            "<up>",
            actions.prev_entry,
            { desc = "Bring the cursor to the previous file entry" },
          },
          {
            "n",
            "<cr>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "o",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "l",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "<2-LeftMouse>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
          { "n", "<c-f>", actions.scroll_view(0.25),  { desc = "Scroll the view down" } },
          {
            "n",
            "<tab>",
            actions.select_next_entry,
            { desc = "Open the diff for the next file" },
          },
          {
            "n",
            "<s-tab>",
            actions.select_prev_entry,
            { desc = "Open the diff for the previous file" },
          },
          {
            "n",
            "[F",
            actions.select_first_entry,
            { desc = "Open the diff for the first file" },
          },
          {
            "n",
            "]F",
            actions.select_last_entry,
            { desc = "Open the diff for the last file" },
          },
          {
            "n",
            "gf",
            actions.goto_file_edit,
            { desc = "Open the file in the previous tabpage" },
          },
          {
            "n",
            "<C-w><C-f>",
            actions.goto_file_split,
            { desc = "Open the file in a new split" },
          },
          {
            "n",
            "<C-w>gf",
            actions.goto_file_tab,
            { desc = "Open the file in a new tabpage" },
          },
          {
            "n",
            "<leader>e",
            actions.focus_files,
            { desc = "Bring focus to the file panel" },
          },
          { "n", "<leader>b", actions.toggle_files,               { desc = "Toggle the file panel" } },
          { "n", "g<C-x>",    actions.cycle_layout,               { desc = "Cycle available layouts" } },
          { "n", "g?",        actions.help("file_history_panel"), { desc = "Open the help panel" } },
        },
        option_panel = {
          { "n", "<tab>", actions.select_entry,         { desc = "Change the current option" } },
          { "n", "q",     actions.close,                { desc = "Close the panel" } },
          { "n", "g?",    actions.help("option_panel"), { desc = "Open the help panel" } },
        },
        help_panel = {
          { "n", "q",     actions.close, { desc = "Close help menu" } },
          { "n", "<esc>", actions.close, { desc = "Close help menu" } },
        },
      },
    })
    vim.keymap.set("n", "<leader>g<leader>", function()
      local Snacks = require("snacks")
      local Job = require("plenary.job")

      local function get_rev_list()
        local rl = Job:new({
          command = "git",
          args = { "rev-list", "--first-parent", "HEAD" },
        }):sync()

        for i, line in ipairs(rl) do
          rl[i] = line:sub(1, 7)
        end

        return rl
      end

      local function get_commits()
        return Job:new({
          command = "git",
          args = { "log", "--all", "--pretty=format:%h|%p|%s" },
        }):sync()
      end

      local function get_branches()
        local map = {}

        local branches = Job:new({
          command = "git",
          args = { "for-each-ref", "--format=%(refname:short)" },
        }):sync()

        for _, branch in ipairs(branches) do
          local revs = Job:new({
            command = "git",
            args = { "rev-list", "--first-parent", branch },
          }):sync()

          for _, sha in ipairs(revs) do
            sha = sha:sub(1, 7)
            map[sha] = map[sha] or {}
            table.insert(map[sha], branch)
          end
        end

        return map
      end

      local function get_tag_map()
        local map = {}
        Job:new({
          command = "git",
          args = { "show-ref", "--tags" },
          on_stdout = function(_, line)
            local hash, ref = line:match("([^%s]+)%s+([^%s]+)")
            if hash and ref then
              hash = hash:sub(1, 7)
              local tag = ref:match("refs/tags/(.+)")
              map[hash] = tag
            end
          end,
        }):sync()
        return map
      end

      local function get_head_map()
        local map = {}
        local rev_list = get_rev_list()
        for i, sha in ipairs(rev_list) do
          if i == 1 then
            map[sha] = "HEAD"
          else
            map[sha] = "HEAD~" .. (i - 1)
          end
        end
        return map
      end

      local function get_items()
        local commits = get_commits()
        local rel_map = get_head_map()
        local branch_map = get_branches()
        local tag_map = get_tag_map()
        local items = {}

        for _, line in ipairs(commits) do
          local hash, parents, message = line:match("([^|]+)|([^|]*)|(.+)")
          local parent1, parent2 = parents:match("(%w+)%s*(%w*)")
          local is_merge = parent2 and parent2 ~= ""

          local rel = rel_map[hash] or ""
          local branches = branch_map[hash] or {}
          local tag = tag_map[hash]

          local branch_str = ""
          local full_branch_str = ""
          if #branches > 0 then
            if is_merge then
              local source = branch_map[parent2]
              local target = branch_map[parent1]
              local source_branch = source and source[1] or "?"
              local target_branch = target and target[1] or "?"

              branch_str = "[" .. source_branch .. " -> " .. target_branch .. "]"
              full_branch_str = branch_str
            else
              full_branch_str = "[" .. table.concat(branches, ", ") .. "]"
              local origin = branches[1]
              local width = vim.fn.strdisplaywidth(origin)
              if width >= 18 then
                origin = origin:sub(1, 21) .. "..."
              end
              if #branches > 1 then
                branch_str = "[" .. origin .. "+" .. "]"
              else
                branch_str = "[" .. (origin or "") .. "]"
              end
            end
          end

          table.insert(items, {
            text = hash
                .. " "
                .. message
                .. " "
                .. full_branch_str
                .. " "
                .. rel
                .. " "
                .. (tag or ""),
            hash = "󰜘 " .. hash,
            commit = hash,
            rel = rel,
            tag = tag or "",
            full_branch_str = full_branch_str,
            branch = branch_str,
            message = message,
          })
        end
        return items
      end

      local function open_picker()
        local commits = {}
        local items = get_items()

        local function format_line(item)
          return {
            { string.format("%-14s", item.hash),                      "SnacksPickerGitCommit" },
            { string.format("%-12s", item.rel or ""),                 "SnacksPickerComment" },
            { string.format("%-30s", (item.branch or ""):sub(1, 30)), "SnacksPickerIdx" },
            { item.message,                                           "SnacksPickerBold" },
          }
        end

        local function open_diff()
          if #commits == 1 then
            vim.cmd("DiffviewOpen " .. commits[1])
          elseif #commits == 2 then
            vim.cmd("DiffviewOpen " .. commits[1] .. ".." .. commits[2])
          else
            vim.cmd("DiffviewOpen")
          end
        end

        local function pick_commit(prompt)
          local commit_picked = false
          Snacks.picker({
            title = prompt,
            items = items,
            format = format_line,
            layout = "telescope",
            preview = function(ctx)
              local item = ctx.item

              local lines = {
                "Relative: " .. (item.rel or "N/A"),
                "Branches: " .. (item.full_branch_str or "?"),
                "Tag: " .. (item.tag or ""),
              }

              local cmd = {
                "git",
                "-c",
                "delta." .. vim.o.background .. "=true",
                "show",
                item.commit,
              }
              local pathspec = item.files or item.file
              pathspec = type(pathspec) == "table" and pathspec or { pathspec }
              if #pathspec > 0 then
                cmd[#cmd + 1] = "--"
                vim.list_extend(cmd, pathspec)
              end

              Job:new({
                command = cmd[1],
                args = vim.list_slice(cmd, 2),
                on_exit = function(j)
                  vim.schedule(function()
                    local git_lines = j:result()
                    vim.list_extend(lines, git_lines)
                    local ns = vim.api.nvim_create_namespace("diff_picker_preview")
                    ctx.preview:set_lines(lines)

                    -- set highlight for custom metadata
                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 0, 0, {
                      end_col = 9,
                      hl_group = "gitKeyword",
                    })
                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 0, 10, {
                      end_col = #lines[1],
                      hl_group = "Comment",
                    })

                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 1, 0, {
                      end_col = 9,
                      hl_group = "gitKeyword",
                    })
                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 1, 10, {
                      end_col = #lines[2],
                      hl_group = "Type",
                    })

                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 2, 0, {
                      end_col = 5,
                      hl_group = "gitKeyword",
                    })
                    vim.api.nvim_buf_set_extmark(ctx.preview.win.buf, ns, 2, 5, {
                      end_col = #lines[3],
                      hl_group = "Macro",
                    })
                    ctx.preview:highlight({ ft = "git" })
                  end)
                end,
              }):start()
            end,
            confirm = function(picker, item)
              commit_picked = true
              table.insert(commits, item.commit)
              picker:close()
              if #commits < 2 then
                pick_commit("Select next commit")
              else
                open_diff()
              end
            end,
            on_close = vim.schedule_wrap(function()
              if not commit_picked and #commits > 0 then
                open_diff()
              end
            end),
          })
        end

        pick_commit("Select first commit")
      end

      local open = vim.fn.confirm("Browse commits?", "&Yes\n&No", 1)
      if open == 1 then
        open_picker()
      else
        vim.cmd("DiffviewOpen")
      end
    end)
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen ", { desc = "Open Diffview" })
    vim.keymap.set("n", "<leader>gD", ":tabclose<CR>", { desc = "Close Diffview" })
    vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Open Diffview Current File History" })
    vim.keymap.set("n", "<leader>gH", ":DiffviewFileHistory ", { desc = "Prepare Diffview File History" })
    vim.opt.diffopt = {
      "internal",
      "filler",
      "closeoff",
      "context:12",
      "algorithm:histogram",
      "linematch:200",
      "indent-heuristic",
      -- "iwhite"
    }
  end,

}
