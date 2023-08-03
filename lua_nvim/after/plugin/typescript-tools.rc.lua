local status, ts_tools = pcall(require, "typscript-tools")

if not status then
  return
end

ts_tools.setup {
  filetypes = { "typescript", "javascript", "svelte" },
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "svelte" then
      client.stop()
    end
  end
}
