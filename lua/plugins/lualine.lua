local window_width_limit = 100

local conditions = {
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
}

local components = {
  lsp = {
    function()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local unique_client_names = table.concat(buf_client_names, ", ")
      return string.format("[%s]", unique_client_names)
    end,
  },
  color = { gui = "bold" },
  cond = conditions.hide_in_width,
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "lunar",
      disabled_filetypes = { "NvimTree", "packer", "TelescopePrompt", "TelescopeResults" },
      section_separators = { "", "" },
      component_separators = { "", "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { components.lsp, "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lua_line_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
