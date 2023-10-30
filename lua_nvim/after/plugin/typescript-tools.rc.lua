local status, ts_tools = pcall(require, "typscript-tools")

if not status then
  return
end

local api = require("typescript-tools.api")

ts_tools.setup {
  filetypes = { "typescript", "javascript", "svelte" },
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "svelte" then
      client.stop()
    end
  end,
  handlers = {
    ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
    -- Ignore 'CommonJS convert' diagnostics.
      { 80001 }
    ),
  },
}
