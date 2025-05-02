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
    },
  },
}
