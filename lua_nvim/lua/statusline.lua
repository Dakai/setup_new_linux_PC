local group = vim.api.nvim_create_augroup("StatusLine", { clear = true })

local icons = {
  diagnostics = {
    --error = "",
    --warning = "",
    --hint = "",
    --info = "",
    error = ' ',
    warning = '⚠ ',
    info = ' ',
    hint = ' '

  },
  buffers = {
    readonly = "󰌾",
    modified = "+",
    unsaved_others = "○",
  },
}

local diagnostics_attrs = {
  { "Error", icons.diagnostics.error },
  { "Warn",  icons.diagnostics.warning },
  { "Hint",  icons.diagnostics.hint },
  { "Info",  icons.diagnostics.info },
}

local diagnostics = ""
local function diagnostics_section()
  local results = {}

  for _, attr in pairs(diagnostics_attrs) do
    local n = vim.diagnostic.get(0, { severity = attr[1] })
    if #n > 0 then
      table.insert(results, string.format(" %d %s", #n, attr[2]))
    end
  end

  return table.concat(results)
end

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufWinEnter" }, {
  group = group,
  callback = function()
    diagnostics = diagnostics_section()
  end,
})

local function unsaved_buffers()
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_get_current_buf() == buf then
      goto continue
    end
    if vim.api.nvim_buf_get_option(buf, "modified") then
      return string.format(" %s ", icons.buffers.unsaved_others)
    end
    ::continue::
  end

  return ""
end

local function file_section()
  local name, ext = vim.fn.expand "%:t", vim.fn.expand "%:e"
  local attr, icon = "", ""

  local ok, nvim_devicons = pcall(require, "nvim-web-devicons")
  if ok then
    icon = nvim_devicons.get_icon("", ext, { default = true })
  end

  if vim.bo.modified and vim.bo.readonly then
    attr = icons.buffers.modified .. " " .. icons.buffers.readonly
  elseif vim.bo.readonly then
    attr = icons.buffers.readonly
  elseif vim.bo.modified then
    attr = icons.buffers.modified
  end

  if attr ~= "" then
    attr = " " .. attr
  end

  if name == "" then
    name = "No Name"
  end

  return string.format("%s %s%s", icon, name, attr) .. ' ' .. ''
end

local function left_section()
  return file_section() .. unsaved_buffers() .. diagnostics
end

local function right_section()
  return "%l:%L"
end

_G.set_statusline = function()
  return " " .. left_section() .. "%=" .. right_section() .. " "
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = group,
  command = "setlocal statusline=%!v:lua.set_statusline()",
})
