return {
  {
    "liuchengxu/vista.vim",
    lazy = true,
    cmd = "Vista",
    config = function()
      vim.g.vista_default_executive = "nvim_lsp"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          -- Truncate diagnostic messages to the first line.
          format = function(diagnostic)
            local new_line_location = diagnostic.message:find("\n")

            if new_line_location ~= nil then
              return diagnostic.message:sub(1, new_line_location)
            else
              return diagnostic.message
            end
          end,
        },
      },
      -- format = {
      --   -- `arc lint` can take a bit to run.
      --   timeout_ms = 2500,
      -- },
      servers = {
        pylsp = {
          cmd = { "pylsp" },
          filetypes = { "python" },
          root_dir = function(filename)
            return vim.fn.getcwd()
          end,
          settings = {
            pylsp = {
              plugins = {
                jedi_completion = {
                  enabled = true,
                },
                jedi_definition = {
                  enabled = true,
                },
                jedi_hover = {
                  enabled = true,
                },
                jedi_references = {
                  enabled = true,
                },
                jedi_signature_help = {
                  enabled = true,
                },
                rope_completion = {
                  enabled = false,
                },
                pyls_black = {
                  enabled = false,
                },
                pyls_isort = {
                  enabled = false,
                },
                autopep8 = {
                  enabled = false,
                },
                yapf = {
                  enabled = false,
                },
                pycodestyle = {
                  enabled = false,
                },
                pydocstyle = {
                  enabled = false,
                },
                pyflakes = {
                  enabled = true,
                },
                pylint = {
                  enabled = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
