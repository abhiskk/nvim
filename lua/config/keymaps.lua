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
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
-- map("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
-- map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

-- Neotree toggle shortcut
map("n", "<leader>t", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })

-- Telescope buffers shortcut
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

-- gitsigns hunk
map("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", { noremap = true, silent = true })

-- gitsigns navigate hunks
map("n", "<leader>c", "<cmd>Gitsigns next_hunk<cr>", { noremap = true, silent = true })
map("n", "<leader>C", "<cmd>Gitsigns prev_hunk<cr>", { noremap = true, silent = true })

-- jump to neo-tree
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { noremap = true, silent = true })

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command WA wa")
cmd("command Wa wa")
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

-- Copy full path of current file to clipboard
map(
  "n",
  "<leader>fp",
  "<cmd>let @+ = expand('%:p')<CR>",
  { noremap = true, silent = true, desc = "Copy full path to clipboard" }
)

-- LSP related keymaps
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "Go to declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Show hover information" })
map(
  "n",
  "gi",
  "<cmd>lua vim.lsp.buf.implementation()<CR>",
  { noremap = true, silent = true, desc = "Go to implementation" }
)
map(
  "n",
  "<C-k>",
  "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  { noremap = true, silent = true, desc = "Show signature help" }
)
map("n", "<leader>vd", ":vertical diffsplit ", { noremap = true, silent = false, desc = "Vertical diffsplit" })
-- map(
--   "n",
--   "<leader>gt",
--   '<cmd>0Gllog --pretty=format:"%h %ad %s" --date=short<CR>',
--   { noremap = true, silent = true, desc = "Git log with date" }
-- )
map(
  "n",
  "<leader>gt",
  '<cmd>0Gllog --pretty=format:"%h %ad %an: %s" --date=short<CR>',
  { noremap = true, silent = true, desc = "Git log with date and author" }
)
map("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true, desc = "FZF Files" })
map(
  "n",
  "<leader>lg",
  "<cmd>lua require('fzf-lua').live_grep()<CR>",
  { noremap = true, silent = true, desc = "FZF Live Grep" }
)
map(
  "n",
  "<leader>bb",
  "<cmd>lua require('fzf-lua').buffers()<CR>",
  { noremap = true, silent = true, desc = "FZF Buffers" }
)
map(
  "n",
  "<leader>fh",
  "<cmd>lua require('fzf-lua').help_tags()<CR>",
  { noremap = true, silent = true, desc = "FZF Help Tags" }
)
map("n", "<leader>fm", "<cmd>lua require('fzf-lua').marks()<CR>", { noremap = true, silent = true, desc = "FZF Marks" })
map(
  "n",
  "<leader>fc",
  "<cmd>lua require('fzf-lua').git_commits()<CR>",
  { noremap = true, silent = true, desc = "FZF Git Commits" }
)
