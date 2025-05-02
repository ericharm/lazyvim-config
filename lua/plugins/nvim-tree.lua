return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  opts = {
    sync_root_with_cwd = false,
    respect_buf_cwd = false,
    renderer = {
      full_name = false,
      root_folder_label = ":t",
    },
  },
}
