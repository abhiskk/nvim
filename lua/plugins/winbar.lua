return {
  "fgheng/winbar.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Function to set winbar content
    local function set_winbar()
      -- Get the current filename
      local filename = vim.fn.expand("%:t")

      -- If the filename is empty (e.g., no file is opened), set winbar to an empty string
      if filename == "" then
        return ""
      end

      -- Return the filename as the winbar content
      return filename
    end

    -- Auto-command to update winbar when entering a window
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.wo.winbar = set_winbar()
      end,
    })

    -- Auto-command to update winbar when changing buffers
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        vim.wo.winbar = set_winbar()
      end,
    })
  end,
}
