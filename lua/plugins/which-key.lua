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
          "<leader>qq",
          "<cmd>q<cr>",
          desc = "Quit",
        },
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
          "<leader>h",
          "<cmd>nohlsearch<cr>",
          desc = "Remove Highlights",
          icon = { icon = "", color = "green" },
        },
        { "<leader>bx", "<cmd>cclose<cr>", desc = "Close Quickfix", icon = { icon = "󰅚", color = "red" } },
        { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy", icon = { icon = "󰒲", color = "blue" } },
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
