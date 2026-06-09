return {
	"folke/snacks.nvim",
	config = function()
		require("snacks").setup({
			bigfile = { enabled = false },
			notifier = { enabled = false },
			quickfile = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			styles = {},

			picker = {
				enabled = true,
				win = {
					input = {
						keys = {
							["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<C-k>"] = { "list_up", mode = { "i", "n" } },
							["<C-j>"] = { "list_down", mode = { "i", "n" } },
							["<C-q>"] = { "qflist", mode = { "i", "n" } },
						},
					},
				},
			},
		})

		-- snacks.picker reads preview files with Lua's file:lines(), which
		-- keeps the trailing \r on CRLF files (e.g. RF-SMART), rendering as
		-- ^M. Strip CR at the single choke point all preview content flows
		-- through, before highlighting is applied.
		local ok_preview, Preview = pcall(require, "snacks.picker.core.preview")
		if ok_preview and type(Preview.set_lines) == "function" and not Preview.__crlf_patched then
			local orig_set_lines = Preview.set_lines
			Preview.set_lines = function(self, lines, offset)
				local cleaned = vim.split((table.concat(lines, "\n")):gsub("\r", ""), "\n", { plain = true })
				return orig_set_lines(self, cleaned, offset)
			end
			Preview.__crlf_patched = true
		end
	end,
	keys = {
		-- File pickers
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files (frecency)",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},

		-- Search
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live Grep (with rg args)",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Word Under Cursor",
		},

		-- LSP
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Document Symbols",
		},

		-- Git
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
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
