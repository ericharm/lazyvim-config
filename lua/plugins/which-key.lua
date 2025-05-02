return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    win = {
      border = "rounded", -- none, single, double, shadow
      no_overlap = false,
    },
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        {
          "<leader>;",
          function()
            Snacks.dashboard()
          end,
          desc = "Dashboard",
          icon = { icon = "󰡃", color = "cyan" },
        },
        { "<leader>w", "<cmd>w<cr>", desc = "Save", icon = { icon = "", color = "cyan" } },
        {
          "<leader>c",
          function()
            Snacks.bufdelete()
          end,
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
        -- move all the LSP stuff under a different letter than the default 'c'
        { "<leader>l", group = "LSP", icon = { icon = "󰙅", color = "blue" } },
        {
          "<leader>lf",
          function()
            LazyVim.format({ force = true })
          end,
          desc = "Format",
        },
        { "<leader>ld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
        {
          "<leader>li",
          function()
            Snacks.picker.lsp_config()
          end,
          desc = "Lsp Info",
        },
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
        { "<leader>lc", vim.lsp.codelens.run, desc = "Run Codelens" },
        {
          "<leader>lC",
          vim.lsp.codelens.refresh,
          desc = "Refresh & Display Codelens",
        },
        {
          "<leader>lR",
          function()
            Snacks.rename.rename_file()
          end,
          desc = "Rename File",
        },
        { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>lA", LazyVim.lsp.action.source, desc = "Source Action" },
      },
    },
  },
}
