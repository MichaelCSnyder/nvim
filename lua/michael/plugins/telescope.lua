-- adds fuzzy finder/search capabilities
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"sharkdp/fd",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- "folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

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
			},
		})

		telescope.load_extension("fzf") -- fuzzy finder sorting algorithm that replace default lua sorter
	end,
}
