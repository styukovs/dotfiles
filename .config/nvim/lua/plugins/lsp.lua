return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { 'saghen/blink.cmp' }
    },
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            configurationPreference = "filesystemFirst"
          }
        }
      })
      vim.lsp.enable('ruff')
      vim.lsp.config('pyright', {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      })
      vim.lsp.enable('pyright')
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
    end,
  }
}
