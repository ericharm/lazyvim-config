return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = { adapter = "openai" },
      inline = { adapter = "copilot" },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
}
