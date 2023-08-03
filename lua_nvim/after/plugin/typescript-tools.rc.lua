local status, ts_tools = pcall(require, "typscript-tools")

if not status then
  return
end

ts_tools.setup {
  filetypes = { "typescript", "javascript" },
}
