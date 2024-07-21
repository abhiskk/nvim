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
api.nvim_command([[set background=dark]])
api.nvim_command([[colorscheme gruvbox]])

-- Set NeoTree background
api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })

-- Disable Treesitter highlighting for specific file types
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.txt", "*.md", "*.py" }, -- Add the file patterns you want to disable Treesitter for
  callback = function()
    vim.cmd("TSBufDisable highlight")
  end,
})

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

-- Custom command for Telescope live_grep with configurable folder name
vim.api.nvim_create_user_command("Fg", function(opts)
  local folder = opts.args
  require("telescope.builtin").live_grep({
    cwd = folder,
  })
end, { nargs = 1 })

-- Set clipboard to use OSC52
vim.opt.clipboard = "unnamedplus"
