local M = {}

-- This is used in plugins/lsp to change some default bindings
-- that are otherwise tough to get at which are defined in
-- lazyvim/plugins/lsp/keymaps.lua
-- The purpose is to yield the <leader>c group for which-key
-- so I can use it in my Close Buffer keymap
-- stylua: ignore
M.keys =  {
  { "<leader>li", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
  { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
  { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
  { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
  { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
  { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
  { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help", has = "signatureHelp" },
  {
    "gl",
    function()
      local float = vim.diagnostic.config().float

      if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"

        vim.diagnostic.open_float(config)
      end
    end,
    desc = "Show line diagnostics",
  },
  -- { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help", has = "signatureHelp" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
  { "<leader>lc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" },
  { "<leader>lC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, has = "codeLens" },
  { "<leader>lR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode ={"n"}, has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
  { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
  { "<leader>lA", LazyVim.lsp.action.source, desc = "Source Action", has = "codeAction" },
  { "]]", function() Snacks.words.jump(vim.v.count1) end, has = "documentHighlight",
    desc = "Next Reference", cond = function() return Snacks.words.is_enabled() end },
  { "[[", function() Snacks.words.jump(-vim.v.count1) end, has = "documentHighlight",
    desc = "Prev Reference", cond = function() return Snacks.words.is_enabled() end },
  { "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, has = "documentHighlight",
    desc = "Next Reference", cond = function() return Snacks.words.is_enabled() end },
  { "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, has = "documentHighlight",
    desc = "Prev Reference", cond = function() return Snacks.words.is_enabled() end },
}

return M
