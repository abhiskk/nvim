-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.wrap = true
vim.opt.list = false
vim.opt.linespace = 10
vim.opt.foldmethod = "manual"

-- Disable LSP semantic highlighting
vim.lsp.handlers["textDocument/documentHighlight"] = function() end

local vim = vim
local api = vim.api

-- change visual highlight color
api.nvim_set_hl(0, "Visual", { bg = "#A0522D" })

-- remap x to only delete and not cut
api.nvim_command([[nnoremap x "_x]])
api.nvim_command([[xnoremap x "_x]])
api.nvim_command([[set nostartofline]])

-- increase scroll speed
api.nvim_command([[nnoremap <silent> <C-e> 5<C-e>]])
api.nvim_command([[nnoremap <silent> <C-y> 5<C-y>]])

-- change the highlight background
api.nvim_set_hl(0, "Search", { bg = "#A0522D" })

-- Set Gruvbox colorscheme
vim.o.termguicolors = true
-- api.nvim_command([[set background=light]])
-- api.nvim_command([[colorscheme catppuccin]])
api.nvim_command([[colorscheme gruvbox]])

-- Set NeoTree background
-- api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
-- api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })

-- Disable Treesitter highlighting for specific file types
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.txt", "*.md", "*.py" }, -- Add the file patterns you want to disable Treesitter for
  callback = function()
    vim.cmd("TSBufDisable highlight")
  end,
})

-- Shortcut for opening ~/scripts/mast_run.sh
vim.cmd([[command! Vxlf edit ~/scripts/mast_run.sh]])

-- Initialize the global variable for Pyright diagnostics state
vim.g.pyright_diagnostics_active = true

-- Update these commands at the end of your init.lua file
vim.api.nvim_create_user_command("Linton", function()
  _G.toggle_pyright_diagnostics(true)
end, {})

vim.api.nvim_create_user_command("Lintoff", function()
  _G.toggle_pyright_diagnostics(false)
end, {})

--
-- vim.api.nvim_create_user_command("Linton", function()
--   require("lspconfig").pylsp.setup({
--     settings = {
--       pylsp = {
--         plugins = {
--           pyflakes = { enabled = true },
--           pycodestyle = { enabled = false },
--           mccabe = { enabled = true },
--           rope_completion = { enabled = false },
--           pyls_black = { enabled = false },
--           pyls_sort = { enabled = false },
--           autopep8 = { enabled = false },
--           yapf = { enabled = false },
--           pylint = { enabled = false },
--         },
--       },
--     },
--   })
-- end, {})
--
-- -- Lint off
-- vim.api.nvim_create_user_command("Lintoff", function()
--   require("lspconfig").pylsp.setup({
--     settings = {
--       pylsp = {
--         plugins = {
--           pyflakes = { enabled = false },
--           pycodestyle = { enabled = false },
--           mccabe = { enabled = false },
--           rope_completion = { enabled = false },
--           pyls_black = { enabled = false },
--           pyls_sort = { enabled = false },
--           autopep8 = { enabled = false },
--           yapf = { enabled = false },
--           pylint = { enabled = false },
--         },
--       },
--     },
--   })
-- end, {})

-- Function for Black formatting
local function format_with_black()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    timeout_ms = 5000,
  })
end

-- Create the BlackFMT command
vim.api.nvim_create_user_command("BFMT", format_with_black, {})

local telescope = require("telescope")
local actions = require("telescope.actions")

local function remove_icons_from_entry(entry)
  return string.format("%s", entry.value)
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {},
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["dd"] = actions.delete_buffer,
      },
    },
    -- Disable icons
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    icon_width = 0, -- Set to 0 to completely remove the width reserved for icons
    file_sorter = require("telescope.sorters").get_fzy_sorter,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      -- Disable devicons for find_files
      entry_maker = function(entry)
        local maker = require("telescope.make_entry").gen_from_file()
        local item = maker(entry)
        item.display = remove_icons_from_entry
        return item
      end,
    },
    buffers = {
      -- Disable devicons for buffers
      entry_maker = function(entry)
        local maker = require("telescope.make_entry").gen_from_buffer()
        local item = maker(entry)
        item.display = remove_icons_from_entry
        return item
      end,
    },
  },
})

-- require("meta").setup()
--
-- require("meta.lsp")
-- local servers = { "rust-analyzer@meta", "pyls@meta", "pyre@meta", "thriftlsp@meta", "cppls@meta" }
-- for _, lsp in ipairs(servers) do
--   require("lspconfig")[lsp].setup({
--     on_attach = on_attach,
--   })
-- end
--
-- local meta = require("meta")
-- local null_ls = require("null-ls")
-- null_ls.setup({
--   on_attach = on_attach,
--   sources = {
--     meta.null_ls.diagnostics.arclint,
--     meta.null_ls.formatting.arclint,
--     meta.null_ls.diagnostics.rust_clippy,
--   },
-- })

-- Custom command for Telescope live_grep with configurable folder name
vim.api.nvim_create_user_command("Fg", function(opts)
  local folder = opts.args
  require("telescope.builtin").live_grep({
    cwd = folder,
  })
end, { nargs = 1 })

local llm_terminal_buf = nil

vim.api.nvim_create_user_command("RLC", function()
  if llm_terminal_buf and vim.api.nvim_buf_is_valid(llm_terminal_buf) then
    -- If the buffer exists, display it in a vertical split
    vim.cmd("vsplit | buffer " .. llm_terminal_buf)
  else
    -- Create a new terminal buffer
    vim.cmd("vsplit | terminal bash ~/scripts/llm.sh")
    llm_terminal_buf = vim.api.nvim_get_current_buf()
  end
  vim.cmd("startinsert")
end, {})

-- Command to reattach to the LLM terminal
vim.api.nvim_create_user_command("RLCAttach", function()
  if llm_terminal_buf and vim.api.nvim_buf_is_valid(llm_terminal_buf) then
    vim.cmd("vsplit | buffer " .. llm_terminal_buf)
    vim.cmd("startinsert")
  else
    print("No active LLM terminal. Use :RLC to start a new one.")
  end
end, {})

-- Keybinding to call the command
-- Set clipboard to use OSC52
vim.opt.clipboard = "unnamedplus"
