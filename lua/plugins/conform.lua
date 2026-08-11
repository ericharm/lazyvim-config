return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cF", false },
  },
  opts = {
    autoformat = true,
    formatters_by_ft = {
      python = { "ruff_organize_imports", "ruff_format" },
      odin = { "odinfmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
}
