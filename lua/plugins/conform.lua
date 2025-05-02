return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cF", false },
  },
  opts = {
    formatters_by_ft = {
      python = { "black" },
      ruby = { "rubocop" },
    },
  },
}
