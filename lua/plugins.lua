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
    "terrortylor/nvim-comment",
    lazy = false,
    config = function()
      require("nvim_comment").setup({
        -- Configuration options here
      })
    end,
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
    "nvim-lualine/lualine.nvim",
    -- dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
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
		  add = { text = "┃" },
		  change = { text = "┃" },
		  delete = { text = "_" },
		  topdelete = { text = "‾" },
		  changedelete = { text = "~" },
		  untracked = { text = "┆" },
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
          text = "",
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
      -- "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        window = {
          width = 25,
        },
        -- Add these lines to disable icons
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
          },
        },
        renderers = {
          file = {
            { "indent" },
            { "name", use_git_status_colors = true },
            -- Remove the icon component here
          },
          directory = {
            { "indent" },
            { "name", use_git_status_colors = true },
            -- Remove the icon component here
          },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        signs = false, -- Disable the signs/icons
      })
    end,
  },
}
