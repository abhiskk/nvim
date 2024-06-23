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
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        -- yadm = {
        --   enable = false,
        -- },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha", -- Changed to latte for light theme
      background = { -- :h background
        light = "latte",
        dark = "mocha", -- Added dark option for completeness
      },
      transparent_background = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" }, -- Added italic comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
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
}
