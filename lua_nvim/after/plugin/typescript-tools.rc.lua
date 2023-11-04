local status, ts_tools = pcall(require, "typescript-tools")

if not status then
  return
end

local api = require("typescript-tools.api")

ts_tools.setup {
  on_attach = function(client, bufnr)
    local filetype = vim.bo.filetype
    local filetypes = { "javascript", "svelte", 'js' }
    if vim.tbl_contains(filetypes, filetype) then
      client.stop()
      --    if vim.bo[bufnr].filetype == "svelte" then
      --      client.stop()
      --    end
      --    if vim.bo[bufnr].filetype == "javascript" then
      --      client.stop()
      -- vim.api.nvim_echo({ { "Stopped LSP server for file type: " .. filetype, "WarningMsg" } }, true, {})
    end
  end,
  handlers = {
    ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
    -- Ignore 'CommonJS convert' diagnostics.
      { 80001 }
    ),
  },
}
