return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    win = {
      border = "rounded",
      no_overlap = false,
    },
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        {
          "<leader>;",
          -- stylua: ignore
          function() Snacks.dashboard() end,
          desc = "Dashboard",
          icon = { icon = "󰡃", color = "cyan" },
        },
        { "<leader>w", "<cmd>w<cr>", desc = "Save", icon = { icon = "", color = "cyan" } },
        {
          "<leader>c",
          -- stylua: ignore
          function() Snacks.bufdelete() end,
          desc = "Close Buffer",
          icon = { icon = "", color = "orange" },
        },
        {
          "<leader>f?",
          "<cmd>echo expand('%:p')<cr>",
          desc = "Where am I?",
          icon = { icon = "󰈞", color = "yellow" },
        },
        -- move some LSP stuff under a different letter than the default 'c'
        -- The rest of it is explained in config.lsp
        { "<leader>l", group = "LSP", icon = { icon = "󰙅", color = "blue" } },
        -- stylua: ignore
        { "<leader>lf", function() LazyVim.format({ force = true }) end, desc = "Format" },
        { "<leader>ld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      },
    },
  },
}
