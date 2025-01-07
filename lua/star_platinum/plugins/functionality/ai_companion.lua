local prefix = "<leader>a"
local user = vim.env.USER or "User"

vim.api.nvim_create_autocmd("User", {
	pattern = "CodeCompanionChatAdapter",
	callback = function(args)
		if args.data.adapter == nil or vim.tbl_isempty(args.data) then
			return
		end
		vim.g.llm_name = args.data.adapter.name
	end,
})
local config = {
	{
		"olimorris/codecompanion.nvim",
		cmd = {
			"CodeCompanion",
			"CodeCompanionActions",
			"CodeCompanionToggle",
			"CodeCompanionAdd",
			"CodeCompanionChat",
		},
		opts = {
			prompt_library = {
				["Generate a Commit Message"] = {
					strategy = "chat",
					description = "Generate a commit message",
					opts = {
						index = 10,
						is_default = true,
						is_slash_cmd = true,
						short_name = "commit",
						auto_submit = true,
					},
					prompts = {
						{
							role = "user",
							content = function()
								local git_diff = vim.fn.system("git diff --no-ext-diff --staged")
								return string.format(
									[[You are an expert at following the Conventional Commit specification. Given the provided conventional commit format, unicode gitmoji mappings, and git diff listed below, please generate a commit message for me:

                  ```conventional commit format
                    <unicode gitmoji> <type>[optional scope]: <description>

                    [optional body]

                    [optional footer(s)]
                  ```

                  ```unicode gitmoji mappings: (type) -> (gitmoji)
                    feat -> ✨
                    fix -> 🐛
                    docs -> 📚
                    style -> 💄
                    refactor -> 🎨
                    perf -> ⚡
                    test -> 🚨
                    build -> 🏗️
                    ci -> 🚀
                    chore -> 🔧
                    revert -> ⏪
                  ```

                  ```diff
                  %s
                  ```
                ]],
									git_diff
								)
							end,
							opts = {
								contains_code = true,
							},
						},
					},
				},
				["Short Commit"] = {
					strategy = "chat",
					description = "Ask for a short commit message",
					opts = {
						index = 10,
						is_default = true,
						is_slash_cmd = true,
						short_name = "short_commit",
						auto_submit = true,
					},
					prompts = {
						{
							role = "user",
							content = function()
								local git_diff = vim.fn.system("git diff --no-ext-diff --staged")
								return string.format(
									[[
                  You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a one-liner git message for me, using the following format, gitmoji mappings, and diff:

                  ```conventional commit format
                    <unicode gitmoji> <type>[optional scope]: <description>
                  ```

                  ```unicode gitmoji mappings: (type) -> (gitmoji)
                    feat -> ✨
                    fix -> 🐛
                    docs -> 📚
                    style -> 💄
                    refactor -> 🎨
                    perf -> ⚡
                    test -> 🚨
                    build -> 🏗️
                    ci -> 🚀
                    chore -> 🔧
                    revert -> ⏪
                  ```

                  ```diff
                  %s
                  ```
                  ]],
									git_diff
								)
							end,
						},
					},
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
					roles = {
						llm = "  CodeCompanion",
						user = " " .. user:sub(1, 1):upper() .. user:sub(2),
					},
					keymaps = {
						close = { modes = { n = "q", i = "<C-e>" } },
						stop = { modes = { n = "<C-c>" } },
					},
				},
				inline = { adapter = "copilot" },
				agent = { adapter = "copilot" },
			},
			display = {
				chat = {
					show_settings = true,
					render_headers = false,
				},
			},
		},
		keys = {
			{ prefix .. "a", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Action Palette" },
			{ prefix .. "c", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New Chat" },
			{ prefix .. "A", "<cmd>CodeCompanionAdd<cr>", mode = "v", desc = "Add Code" },
			{ prefix .. "i", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline Prompt" },
			{ prefix .. "t", "<cmd>CodeCompanionChat Toggle<cr>", mode = "n", desc = "Toggle Chat" },
		},
	},
}
if vim.fn.has("win32") == 1 then
else
end
return config
