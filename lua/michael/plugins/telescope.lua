-- adds fuzzy finder/search capabilities
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- {
		-- 	"nvim-telescope/telescope-fzf-native.nvim",
		-- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		-- },
		"nvim-tree/nvim-web-devicons",
		"sharkdp/fd",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-h>"] = "which_key",
					},
				},
			},
		})

		-- telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find grep string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", builtin.git_bcommits, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope: view git status for all files" })
		keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "Telescope: view all commits for current file" })
	end,
}
