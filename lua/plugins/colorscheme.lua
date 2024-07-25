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
}
