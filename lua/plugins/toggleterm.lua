return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<M-3>]],
    direction = "float",
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = false,
    },
    active = true,
    shade_terminals = true,
  },
}
