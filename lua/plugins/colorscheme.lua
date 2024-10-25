return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        term_colors = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          -- Add other integrations as needed
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "morhetz/gruvbox",
  },
  {
    "scottmckendry/cyberdream.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        -- variant = "moon", -- 'auto', 'main', 'moon', or 'dawn'
        variant = "moon", -- 'auto', 'main', 'moon', or 'dawn'
        dark_variant = "moon",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,
        -- ... other options
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("nightfox").setup({
  --       -- Optionally, you can add configuration options here
  --       -- For example:
  --       -- options = {
  --       --   styles = {
  --       --     comments = "italic",
  --       --     keywords = "bold",
  --       --     types = "italic,bold",
  --       --   }
  --       -- },
  --     })
  --     vim.cmd("colorscheme carbonxfox")
  --   end,
  -- },
  {
    "vim-scripts/tango.vim",
    name = "vim-tango",
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = false,
        terminal_colors = true,
        devicons = true,
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        -- Override default colors
        colors = {
          -- Adjust colors here if needed
        },
        -- Override highlight groups
        highlight_groups = {
          -- Adjust highlight groups here if needed
        },
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
}
