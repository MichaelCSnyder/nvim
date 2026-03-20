return {
	"folke/snacks.nvim",
	opts = {
		-- Disable everything else
		bigfile = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		styles = {},

		-- Only enable the picker
		picker = { enabled = true },
	},
	keys = {
		-- Set up the keybinding for git log of current file
		-- {
		-- 	"<leader>gB",
		-- 	function()
		-- 		Snacks.picker.git_branches()
		-- 	end,
		-- 	desc = "Git Branches",
		-- },
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log (current file)",
		},
	},
}
