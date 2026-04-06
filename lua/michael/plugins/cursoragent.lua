return {
	"aug6th/cursoragent.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("cursoragent").setup({})

		-- vim.keymap.set("n", "<leader>aa", "<cmd>CursorAgent<CR>", { noremap = true, silent = true })
	end,
}
