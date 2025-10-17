return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" }, -- directories you want to ignore
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
		keymap.set("n", "<leader>wa", "<cmd>AutoSession search<CR>", { desc = "Search all sessions" }) -- search all sessions
	end,
}
