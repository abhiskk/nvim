-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- reset scrolling mode shortcut of nvim
map("n", "<C-p>", "<C-b>", { noremap = true })

-- map arrow keys to pane shifts.
map("n", "<Up>", "<C-w><C-k>", { noremap = true })
map("n", "<Down>", "<C-w><C-j>", { noremap = true })
map("n", "<Left>", "<C-w><C-h>", { noremap = true })
map("n", "<Right>", "<C-w><C-l>", { noremap = true })

-- Telescope file finder shortcut
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

-- Neotree toggle shortcut
map("n", "<leader>t", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })

-- Telescope buffers shortcut
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

-- gitsigns hunk
map("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", { noremap = true, silent = true })

-- gitsigns navigate hunks
map("n", "<leader>c", "<cmd>Gitsigns next_hunk<cr>", { noremap = true, silent = true })
map("n", "<leader>C", "<cmd>Gitsigns prev_hunk<cr>", { noremap = true, silent = true })

-- python lsp server jumpt to definition
-- map("n", "<C-d>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- using Meta/Alt can result in <Esc> being interpreted as Meta/Alt, which makes
-- for odd behaviors when quickly pressing <Esc> sometimes, so disable Meta
-- chords.
-- https://github.com/neovim/neovim/issues/20064
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

vim.api.nvim_set_keymap("n", "s", "<Plug>Lightspeed_s", {})
vim.api.nvim_set_keymap("n", "S", "<Plug>Lightspeed_S", {})
