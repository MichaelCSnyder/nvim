-- see default configuration section of repo for full list of config options
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	opts = {
		mode = "legacy", -- use "agentic" for multi-file, multi-step abstract tasks
		instructions_file = "avante-instructions.md",
		hints = {
			enabled = false, -- Disable inline hints
		},
		provider = "bedrock",
		providers = {
			bedrock = {
				-- model = "
				-- model = "us.anthropic.claude-opus-4-5-20251101-v1:0", -- best but slowest
				model = "us.anthropic.claude-sonnet-4-5-20250929-v1:0", -- best balance: Nearly Opus quality, much faster
				-- model = "us.anthropic.claude-haiku-4-5-20251001-v1:0", -- fastest but less capable
				aws_profile = "rfs-ai",
				aws_region = "us-east-1",
				extra_request_body = {
					max_tokens = 4096,
					temperature = 0.3,
				},
			},
		},
		selection = {
			enabled = false, -- turn off visual mode hints
		},
		windows = {
			---@type "right" | "left" | "top" | "bottom"
			position = "right", -- the position of the sidebar
			wrap = true, -- similar to vim.o.wrap
			width = 30, -- default % based on available width
			sidebar_header = {
				enabled = true, -- true, false to enable/disable the header
				align = "center", -- left, center, right for title
				rounded = true,
			},
			spinner = {
				editing = {
					"⡀",
					"⠄",
					"⠂",
					"⠁",
					"⠈",
					"⠐",
					"⠠",
					"⢀",
					"⣀",
					"⢄",
					"⢂",
					"⢁",
					"⢈",
					"⢐",
					"⢠",
					"⣠",
					"⢤",
					"⢢",
					"⢡",
					"⢨",
					"⢰",
					"⣰",
					"⢴",
					"⢲",
					"⢱",
					"⢸",
					"⣸",
					"⢼",
					"⢺",
					"⢹",
					"⣹",
					"⢽",
					"⢻",
					"⣻",
					"⢿",
					"⣿",
				},
				generating = { "·", "✢", "✳", "∗", "✻", "✽" }, -- Spinner characters for the 'generating' state
				thinking = { "🤯", "🙄" }, -- Spinner characters for the 'thinking' state
			},
			input = {
				prefix = "> ",
				height = 10, -- Height of the input window in vertical layout
			},
			edit = {
				border = "rounded",
				start_insert = true, -- Start insert mode when opening the edit window
			},
			ask = {
				floating = false, -- Open the 'AvanteAsk' prompt in a floating window
				start_insert = false, -- Start insert mode when opening the ask window
				border = "rounded",
				---@type "ours" | "theirs"
				focus_on_apply = "ours", -- which diff to focus after applying
			},
		},
	},
	keys = {
		-- { "<leader>aa", ":AvanteAsk<CR>", desc = "Avante Ask" },
	},
}
