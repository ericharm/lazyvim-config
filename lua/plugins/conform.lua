return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cF", false },
  },
  opts = {
    autoformat = true,
    formatters_by_ft = {
      python = { "isort", "black" },
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
    },
  },
}
