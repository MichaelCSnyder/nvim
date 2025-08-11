-- set leader key to space
vim.g.mapleader = " "

vim.opt.startofline = true

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "Open netrw project view" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p')

-- clear search highlights
vim.keymap.set("n", "<leader><leader>", ":nohl<CR>", { desc = "Clear search highlights" })

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<C-k>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<C-j>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<A-k>", "<cmd>+tabm<CR>", { desc = "Move tab to the right" }) --  go to previous tab
vim.keymap.set("n", "<A-j>", "<cmd>-tabm<CR>", { desc = "Move tab to the left" }) --  go to previous tab
-- testing adding back in shortcuts I'm used to. Might as well try something else.
-- vim.keymap.set("n", "<C-S-PageDown>", "<cmd>+tabm<CR>", { desc = "Move tab to the right" }) --  go to previous tab
-- vim.keymap.set("n", "<C-S-PageUp>", "<cmd>-tabm<CR>", { desc = "Move tab to the left" }) --  go to previous tab
vim.keymap.set("n", "<leader>td", "<cmd>tabnew %<CR>", { desc = "Duplicate current buffer in new tab" }) --  move current buffer to new tab

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>du", function()
	vim.cmd("windo diffupdate")
	vim.cmd("windo redraw")
end, { desc = "Fix diff view alignment" })
