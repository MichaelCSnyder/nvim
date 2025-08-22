-- adds fuzzy finder/search capabilities
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"sharkdp/fd",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-frecency.nvim",
			version = "*",
		},
		-- "folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				layout_strategy = "horizontal",
				-- show preview no matter the terminal column width
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_cutoff = 0,
					},
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, -- "smart" will add everything to quickfix if nothing is selected or just selections if they are present
						["<C-h>"] = "which_key",
					},
					n = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				frecency = {
					enable_prompt_mappings = true,
					matcher = "default", -- options: "fuzzy" | "default"
					workspaces = {
						["code"] = vim.fn.expand("~/Code/RF-SMART/netsuite"),
						["unit"] = vim.fn.expand("~/Code/RF-SMART/test/unit"),
						["int"] = vim.fn.expand("~/Code/RF-SMART/test/integration"),
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("frecency")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>ff", function()
			telescope.extensions.frecency.frecency({
				workspace = "CWD",
			})
		end)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find grep string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find document symbols" })
		keymap.set("n", "<leader>fb", builtin.git_bcommits, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope: view git status for all files" })
		keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "Telescope: view all commits for current file" })
		-- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
