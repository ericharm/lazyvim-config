return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {}, -- disable ruby-lsp
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
        },
      },
      setup = {
        ["*"] = function(_, _)
          local keymaps = require("lazyvim.plugins.lsp.keymaps")
          keymaps._keys = require("config.lsp-remaps")
        end,
      },
    },
  },
}
