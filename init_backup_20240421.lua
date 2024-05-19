-- ---------------------------------------
-- lazy package manager
vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
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

require("lazy").setup({
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",
  "ggandor/lightspeed.nvim",
  "nvim-treesitter/nvim-treesitter",
  "sheerun/vim-polyglot",
  "tjdevries/colorbuddy.nvim",
  "bkegley/gloombuddy",
  "tanvirtin/monokai.nvim",
  "ojroques/nvim-osc52",
  "morhetz/gruvbox",
  "sainnhe/gruvbox-material",
  "rebelot/kanagawa.nvim",
  "savq/melange-nvim",
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- {
  --   dir = "/usr/share/fb-editor-support/nvim",
  --   name = "meta.nvim",
  --   import = "meta.lazyvim",
  -- },
})

-- require("meta.lsp")
-- local servers = { "rust-analyzer@meta", "pyls@meta", "pyre@meta", "thriftlsp@meta", "cppls@meta" }
-- for _, lsp in ipairs(servers) do
--   require("lspconfig")[lsp].setup {
--     on_attach = on_attach,
--   }
-- end

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false
      }
    }
  },
  filters = {
    dotfiles = true,
  },
})

-- require('gitsigns').setup()

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'powerline',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- require("meta")

-- require('gruvbox-material')

-- -- ---------------------------------------
vim.opt.compatible = false
vim.opt.number = true
vim.opt.syntax = 'on'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('x', '<leader>c', require('osc52').copy_visual)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>i', 'o<Esc>o<Esc>ko', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fy', ':let @+=expand("%")<CR>', { noremap = true, silent = true })
vim.opt.signcolumn = "no"

local vim = vim
local api = vim.api

api.nvim_command [[filetype off]]
api.nvim_command [[filetype plugin indent on]]
api.nvim_command [[highlight Comment cterm=bold]]
-- colorscheme
api.nvim_command [[set t_Co=256]]
-- api.nvim_command [[colorscheme gruvbox]]
-- api.nvim_command [[colorscheme kanagawa-dragon]]
-- api.nvim_command [[colorscheme melange]]
-- link vim clipboard with the system clipboard
api.nvim_command [[set clipboard=unnamedplus]]
-- remap x to only delete and not cut
api.nvim_command [[nnoremap x "_x]]
api.nvim_command [[xnoremap x "_x]]
api.nvim_command [[set nostartofline]]
-- increase scroll speed
api.nvim_command [[nnoremap <silent> <C-e> 5<C-e>]]
api.nvim_command [[nnoremap <silent> <C-y> 5<C-y>]]

api.nvim_command [[colorscheme gruvbox]]
-- api.nvim_command [[set background=dark]]
-- api.nvim_command [[let g:gruvbox_material_background = 'hard']]
-- api.nvim_command [[let g:gruvbox_material_foreground = 'mix']]

