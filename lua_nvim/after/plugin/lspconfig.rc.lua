local status, nvim_lsp = pcall(require, "lspconfig")

if not status then
  return
end
-- https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2#5f0e
-- signs at line number
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set("n", "<Space>f", function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      found_float = true
    end
  end

  if found_float then
    return
  end

  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { desc = "Toggle Diagnostics" })

nvim_lsp.svelte.setup {
  filetypes = { 'typescript', 'javascript', 'svelte', 'html', 'css' },
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "+page.server.ts", "+page.ts", "+layout.server.ts", "+layout.ts" },
      command = "LspRestart svelte",
    })
  end
}

-- nvim_lsp.tsserver.setup({
--   handlers = {
--     ["textDocument/publishDiagnostics"] = function(
--       _,
--       result,
--       ctx,
--       config
--     )
--       if result.diagnostics == nil then
--         return
--       end
--
--       -- ignore some tsserver diagnostics
--       local idx = 1
--       while idx <= #result.diagnostics do
--         local entry = result.diagnostics[idx]
--
--         local formatter = require('format-ts-errors')[entry.code]
--         entry.message = formatter and formatter(entry.message) or entry.message
--
--         -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
--         if entry.code == 80001 then
--           -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
--           table.remove(result.diagnostics, idx)
--         else
--           idx = idx + 1
--         end
--       end
--
--       vim.lsp.diagnostic.on_publish_diagnostics(
--         _,
--         result,
--         ctx,
--         config
--       )
--     end,
--   },
-- })
