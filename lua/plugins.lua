return {
  -- Add your plugins here
  {
    "ggandor/lightspeed.nvim",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = false,
        },
        sticky_increment = {
          enable = false,
        },
      })
    end,
  },
  {
    "sheerun/vim-polyglot",
    lazy = false,
  },
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
  },
  {
    "bkegley/gloombuddy",
    lazy = false,
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
  },
  {
    "ojroques/nvim-osc52",
    lazy = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
  },
  {
    "morhetz/gruvbox",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          untracked = { hl = "GitSignsAdd", text = "●", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        },
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors").setup()

      scrollbar.setup({
        show = true,
        handle = {
          text = " ",
          -- color = colors.bg_highlight,
          color = "#ffd700",
          hide_if_all_visible = false,
          -- length = 4, -- Reduce the length of the scrollbar handle
        },
        marks = {
          Search = { color = "#ffd700" },
          Misc = { color = "#ffd700" },
          GitAdd = { text = "▎", color = "#50fa7b" }, -- Green for added lines
          GitChange = { text = "▎", color = "#ffb86c" }, -- Orange for changed lines
          GitDelete = { text = "▎", color = "#ff5555" }, -- Red for deleted lines
        },
        handlers = {
          diagnostic = true,
          search = true,
          gitsigns = true,
        },
      })
    end,
  },
  -- {
  --   "karb94/neoscroll.nvim",
  --   lazy = false,
  --   config = function()
  --     require("neoscroll").setup({
  --       -- All these keys will be mapped to their corresponding default scrolling animation
  --       mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  --       hide_cursor = true, -- Hide cursor while scrolling
  --       stop_eof = true, -- Stop at <EOF> when scrolling downwards
  --       use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  --       respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = nil, -- Default easing function
  --       pre_hook = nil, -- Function to run before the scrolling animation starts
  --       post_hook = nil, -- Function to run after the scrolling animation ends
  --     })
  --   end,
  -- },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "always",
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true, -- Follow the current file
          use_libuv_file_watcher = true, -- Use the file watcher
        },
        window = {
          width = 25, -- Set the default width here
        },
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
              "container",
              content = {
                { "name", zindex = 10 },
                {
                  "symlink_target",
                  zindex = 10,
                  highlight = "NeoTreeSymbolicLinkTarget",
                },
                { "clipboard", zindex = 10 },
                { "diagnostics", errors_only = true, zindex = 20, align = "right" },
              },
            },
          },
          file = {
            { "indent" },
            { "icon" },
            {
              "container",
              content = {
                {
                  "name",
                  zindex = 10,
                },
                -- { "git_status", zindex = 20, align = "right" },
                {
                  "diagnostics",
                  zindex = 20,
                  align = "right",
                },
              },
            },
          },
        },
      })
    end,
  },

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "kyazdani42/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     require("neo-tree").setup({
  --       filesystem = {
  --         follow_current_file = true, -- Follow the current file
  --         use_libuv_file_watcher = true, -- Use the file watcher
  --       },
  --       window = {
  --         width = 25, -- Set the default width here
  --       },
  --       default_component_configs = {
  --         git_status = {
  --           symbols = {
  --             untracked = "U",
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}

-- local vim = vim
-- local execute = vim.api.nvim_command
-- local fn = vim.fn
-- -- ensure that packer is installed
-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--     execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
--     execute 'packadd packer.nvim'
-- end
-- vim.cmd('packadd packer.nvim')
-- local packer = require'packer'
-- local util = require'packer.util'
-- packer.init({
--   package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
-- })
-- --- startup and add configure plugins
-- packer.startup(function()
--   local use = use
--   -- use 'neovim/nvim-lspconfig'
--   use 'ggandor/lightspeed.nvim'
--   use 'nvim-treesitter/nvim-treesitter'
--   use 'sheerun/vim-polyglot'
--   use 'tjdevries/colorbuddy.nvim'
--   use 'bkegley/gloombuddy'
--   -- use 'ggandor/leap.nvim'
--   use 'tanvirtin/monokai.nvim'
--   -- use 'gruvbox-community/gruvbox'
--   use {'ojroques/nvim-osc52'}
--   use {
--     'nvim-lualine/lualine.nvim',
--     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
--   }
--   use ({ 'projekt0n/github-nvim-theme' })
--   use 'morhetz/gruvbox'
--   end
-- )
