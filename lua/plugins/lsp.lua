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
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    opts = {
      diagnostics = {
        virtual_text = {
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
      servers = {
        pyright = {
          cmd = { "/home/akadian/.conda/envs/testenv00/bin/pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_dir = function(filename)
            local util = require("lspconfig.util")
            return util.find_git_ancestor(filename) or util.path.dirname(filename)
          end,
          settings = {
            python = {
              -- pythonPath = vim.fn.expand("~/conda-envs/xlfcde/conda/bin/python"),
              -- pythonPath = vim.fn.expand("~/conda-envs/xlfmcd/conda/bin/python"),
              pythonPath = vim.fn.expand("~/conda-envs/xlformers_llama4_conda/conda/bin/python"),
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
              },
            },
          },
          single_file_support = true,
          on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            -- Mappings.
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

            -- Add shortcut for formatting with Black
            vim.keymap.set("n", "<leader>bf", function()
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == "null-ls"
                end,
                timeout_ms = 5000,
              })
            end, { noremap = true, silent = true, buffer = bufnr, desc = "Format with Black" })

            -- Apply current diagnostics state
            if vim.g.pyright_diagnostics_active == false then
              vim.diagnostic.disable(bufnr)
            end
          end,
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      -- Setup servers
      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(server_opts)
      end

      -- Set up null-ls for Black formatting
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black.with({
            runtime_condition = function(params)
              if params.root then
                local has_pyproject = vim.fn.filereadable(params.root .. "/pyproject.toml") == 1
                return not has_pyproject
              end
              return true
            end,
            command = vim.fn.expand("~/conda-envs/xlfmcd/conda/bin/black"),
          }),
        },
        debug = true,
      })

      -- Function to check active LSP servers and their Python paths
      local function check_lsp_python_path()
        local clients = vim.lsp.get_active_clients()
        for _, client in ipairs(clients) do
          if client.name == "pyright" then
            local python_path = client.config.settings.python.pythonPath
            print(string.format("Pyright is using Python at: %s", python_path))

            -- Test go-to-definition
            local result, err =
              client.request_sync("textDocument/definition", vim.lsp.util.make_position_params(), 1000, 0)
            if err then
              print("Error testing go-to-definition:", err)
            elseif result and result.result then
              print("Go-to-definition seems to be working")
            else
              print("Go-to-definition test returned no results")
            end
          elseif client.name == "null-ls" then
            print("Black formatter is active")
          end
        end
      end

      -- Create user commands
      vim.api.nvim_create_user_command("CheckLSP", check_lsp_python_path, {})

      -- Function to toggle Pyright diagnostics
      _G.toggle_pyright_diagnostics = function(enable)
        vim.g.pyright_diagnostics_active = enable
        if enable then
          vim.diagnostic.enable()
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[bufnr].filetype == "python" then
              vim.diagnostic.enable(bufnr)
            end
          end
          print("Pyright diagnostics enabled")
        else
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[bufnr].filetype == "python" then
              vim.diagnostic.disable(bufnr)
            end
          end
          vim.diagnostic.reset()
          print("Pyright diagnostics disabled")
        end
      end
    end,
  },
}
