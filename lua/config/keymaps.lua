-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- NOTE: I manually commented out several keymaps in the <leader>c group
-- from lazyvim/plugins/lsp/keymaps.lua
-- I could not figure out how else to disable them
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")

vim.keymap.del("n", "<leader>cf")
vim.keymap.del("n", "<leader>cd")

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")

vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>S")
