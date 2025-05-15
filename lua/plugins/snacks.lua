local header = [[
▗▖  ▗▖▗▄▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖
▐▛▚▖▐▌▐▌   ▐▌ ▐▌▐▌  ▐▌  █  ▐▛▚▞▜▌
▐▌ ▝▜▌▐▛▀▀▘▐▌ ▐▌▐▌  ▐▌  █  ▐▌  ▐▌
▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘ ▝▚▞▘ ▗▄█▄▖▐▌  ▐▌
]]

return {
  {
    "willothy/snacks.nvim",
    opts = function(_, opts)
      -- Find and modify the "New File" keybinding
      for _, item in ipairs(opts.dashboard.preset.keys) do
        if item.key == "n" then
          item.action = ":ene" -- removes `startinsert`
          break
        end
      end
      opts.dashboard.preset.header = header
    end,
  },
}
