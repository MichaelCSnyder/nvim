return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- javascript = { "prettierd" },
				-- typescript = { "prettierd" },
				-- javascriptreact = { "prettierd" },
				-- typescriptreact = { "prettierd" },
				-- css = { "prettierd" },
				-- html = { "prettierd" },
				-- json = { "prettierd" },
				-- markdown = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_format = "fallback",
				-- lsp_format = "first",
				timeout_ms = 200,
				-- filter = function(client)
				-- 	if client.name == "eslint" then
				-- 		print("linting yo")
				-- 	end
				-- 	return client.name == "eslint"
				-- end,
			},
		})
		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 200,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
