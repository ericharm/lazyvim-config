-- Register JetBrains kotlin-lsp before lspconfig loads
local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")

if not configs.kotlin_lsp then
  configs.kotlin_lsp = {
    default_config = {
      cmd = { "kotlin-lsp", "--stdio" },
      filetypes = { "kotlin" },
      root_dir = lspconfig.util.root_pattern("settings.gradle", "settings.gradle.kts", ".git"),
    },
  }
end

return {
  -- Prevent mason-lspconfig from auto-installing kotlin_language_server
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = {
        exclude = { "kotlin_language_server" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {}, -- disable ruby-lsp
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        -- Disable the old fwcd kotlin_language_server
        kotlin_language_server = false,
        -- Enable JetBrains kotlin-lsp
        kotlin_lsp = {
          capabilities = {
            textDocument = {
              diagnostic = {
                dynamicRegistration = true,
              },
            },
          },
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
