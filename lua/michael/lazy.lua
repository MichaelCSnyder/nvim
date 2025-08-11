local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- disable confirmation message when plugin files are saved
require("lazy").setup("michael.plugins", {
	-- checks for plugin updates and allows for lualine to display pending plugin updates
	-- checker = {
	-- 	enabled = false,
	-- 	notify = false,
	-- },
	change_detection = {
		notify = false, -- assure Lazy doesn't provide alert when it detects new or updated plugins
	},
})
