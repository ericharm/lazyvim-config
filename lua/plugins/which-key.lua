return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    layout = {
      height = { min = 1, max = 10 }, -- Adjust max height to fit content
      width = { min = 20, max = 50 }, -- Adjust width as needed
      spacing = 3, -- Adjust spacing between columns
      align = "center", -- Align content
    },
    -- remove presets for windows
    plugins = {
      marks = false,
      registers = false,
      spelling = false,
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },

    win = {
      no_overlap = false,
    },

    spec = {
      mode = { "n", "v" },
      {
        "<leader>w",
        "<cmd>w<cr>",
        desc = "Save",
        icon = { icon = "", color = "blue" },
      },
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "File Explorer",
        icon = { icon = "", color = "green" },
      },
      {
        -- IT TURNS OUT you can do this in LazyVim with <leader>ur
        "<leader>h",
        "<cmd>nohlsearch<cr>",
        desc = "No Highlight",
        icon = { icon = "", color = "red" },
      },
      {
        "<leader><space>",
        "<esc>",
        hidden = true,
      },
    },
  },
}
