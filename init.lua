-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.wrap = true
vim.opt.list = false
vim.opt.linespace = 10

vim.lsp.handlers["textDocument/documentHighlight"] = function() end

local vim = vim
local api = vim.api

-- change visual highlight color
-- api.nvim_set_hl(0, "Visual", { bg = "#FF9900" })
api.nvim_set_hl(0, "Visual", { bg = "#A0522D" })

-- autosave
-- api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--   pattern = "*",
--   command = "silent! write",
--   nested = true,
-- })

-- remap x to only delete and not cut
api.nvim_command([[nnoremap x "_x]])
api.nvim_command([[xnoremap x "_x]])
api.nvim_command([[set nostartofline]])

--increase scroll speed
api.nvim_command([[nnoremap <silent> <C-e> 5<C-e>]])
api.nvim_command([[nnoremap <silent> <C-y> 5<C-y>]])

--change the highlight background
api.nvim_set_hl(0, "Search", { bg = "#A0522D" })

-- api.nvim_command([[colorscheme kanagawa-wave]])
api.nvim_command([[set background=light]])
api.nvim_command([[colorscheme gruvbox]])
-- api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
-- api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.txt", "*.md", "*.py" }, -- Add the file patterns you want to disable Treesitter for
  callback = function()
    vim.cmd("TSBufDisable highlight")
  end,
})

-- Custom command for Telescope live_grep with configurable folder name
vim.api.nvim_create_user_command("Fg", function(opts)
  local folder = opts.args
  require("telescope.builtin").live_grep({
    cwd = folder,
  })
end, { nargs = 1 })

-- Shortcut for opening ~/scripts/mast_run.sh
vim.cmd([[command! Vxlf edit ~/scripts/mast_run.sh]])

-- Lint on
vim.api.nvim_create_user_command("Linton", function()
  require("lspconfig").pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = true },
          pycodestyle = { enabled = false },
          mccabe = { enabled = true },
          rope_completion = { enabled = false },
          pyls_black = { enabled = false },
          pyls_sort = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          pylint = { enabled = false },
        },
      },
    },
  })
end, {})

-- Lint off
vim.api.nvim_create_user_command("Lintoff", function()
  require("lspconfig").pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },
          rope_completion = { enabled = false },
          pyls_black = { enabled = false },
          pyls_sort = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          pylint = { enabled = false },
        },
      },
    },
  })
end, {})

-- setup shortcut for deleting buffers in telescope
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = "delete_buffer", -- Map Ctrl+d to delete buffer in insert mode
      },
      n = {
        ["dd"] = "delete_buffer", -- Map dd to delete buffer in normal mode
      },
    },
  },
})
