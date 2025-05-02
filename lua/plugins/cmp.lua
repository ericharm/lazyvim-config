return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Load when entering insert mode
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer", -- Buffer completion
    "hrsh7th/cmp-path", -- Path completion
    "hrsh7th/cmp-cmdline", -- Command-line completion
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completion
  },
  opts = function()
    local cmp = require("cmp")
    local cmp_window = require("cmp.config.window")
    -- local cmp_mapping = require("cmp.config.mapping")
    local icons = require("icons")
    local source_names = {
      nvim_lsp = "(LSP)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      cmp_tabnine = "(Tabnine)",
      vsnip = "(Snippet)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      tmux = "(TMUX)",
      copilot = "(Copilot)",
      treesitter = "(TreeSitter)",
    }

    return {
      formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        kind_icons = icons.kind,
        duplicates = {
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        },
        duplicates_default = 0,
        format = function(entry, vim_item)
          local max_width = 400
          if max_width ~= 0 and #vim_item.abbr > max_width then
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
          end
          if true then
            vim_item.kind = icons.kind[vim_item.kind]

            if entry.source.name == "copilot" then
              vim_item.kind = icons.git.Octoface
              vim_item.kind_hl_group = "CmpItemKindCopilot"
            end

            if entry.source.name == "cmp_tabnine" then
              vim_item.kind = icons.misc.Robot
              vim_item.kind_hl_group = "CmpItemKindTabnine"
            end

            if entry.source.name == "crates" then
              vim_item.kind = icons.misc.Package
              vim_item.kind_hl_group = "CmpItemKindCrate"
            end

            if entry.source.name == "lab.quick_data" then
              vim_item.kind = icons.misc.CircuitBoard
              vim_item.kind_hl_group = "CmpItemKindConstant"
            end

            if entry.source.name == "emoji" then
              vim_item.kind = icons.misc.Smiley
              vim_item.kind_hl_group = "CmpItemKindEmoji"
            end
          end
          vim_item.menu = source_names[entry.source.name]
          return vim_item
        end,
      },
      window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
      },
      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Move down
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab cycles forward
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift-Tab cycles backward
        ["<Up>"] = cmp.mapping.select_prev_item(), -- Shift-Tab cycles backward
        ["<Down>"] = cmp.mapping.select_next_item(), -- Tab cycles forward
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" },
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
        end,
      },
    }
  end,
}
