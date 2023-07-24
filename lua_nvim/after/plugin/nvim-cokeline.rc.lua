local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close
local get_hex = require("cokeline/utils").get_hex

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_4
local space = { text = " " }
-- local dark = get_hex("Normal", "bg")
-- local text = get_hex("Comment", "fg")
local grey = get_hex("ColorColumn", "bg")
local light = get_hex("Comment", "fg")
-- local high = "#a6d120"
local high = "#63f2f1"
local text = "#caddaf"
local dark = "#2d2b40"

--local function get_second_to_last_dir(path)
--  local dirs = {}
--  for dir in string.gmatch(path, "([^/]+)") do
--    table.insert(dirs, dir)
--  end
--
--  local name = dirs[#dirs - 1]
--  return name .. "/"
--end

local function get_second_to_last_dir(path)
  local dirs = {}
  for dir in string.gmatch(path, "([^/]+)") do
    table.insert(dirs, dir)
  end

  local name = dirs[#dirs - 1]
  if name ~= nil then
    if name:match("%[id%]") then
      name = dirs[#dirs - 2] .. '/' .. name
    end
    return name .. "/"
  end
end

local function processFilePath(filePath)
  local apiDirectory = "/api/"
  local svelteExtension = ".svelte"

  -- Extract directory and file information from file path
  local directory, fileNameWithExt = filePath:match("(.*/)(.*)")
  local fileName, fileExtension = fileNameWithExt:match("(.*)(%.%w+)")

  -- Extract the last directory from the directory path
  local lastDir = directory:match(".*/(.*)/")

  if fileExtension == svelteExtension and directory:find(apiDirectory) then
    -- File is a Svelte file and contains the API directory
    return apiDirectory .. lastDir
  elseif fileExtension == svelteExtension then
    -- File is a Svelte file only
    return lastDir .. "/" .. fileName
  else
    -- Any other file type
    return lastDir .. "/" .. fileNameWithExt
  end
end

local function get_path_parts(path)
  local dirs = {}
  for dir in string.gmatch(path, "([^/]+)") do
    table.insert(dirs, dir)
  end

  local filename = dirs[#dirs]
  if filename ~= nil then
    local ext = filename:match("^.+(%..+)$")
    if ext ~= nil then
      filename = filename:gsub("%." .. ext, "")
    end

    if path:match("api") and filename == "+server.ts" then
      local api_index = 0
      for i, dir in ipairs(dirs) do
        if dir == "api" then
          api_index = i
        end
      end
      local api_next_dir = dirs[api_index + 1]
      return "api/" .. api_next_dir
    elseif ext == ".svelte" then
      local last_dir = dirs[#dirs - 1]
      filename = filename:gsub("%.svelte$", "") -- strip .svelte
      if last_dir == '[id]' then
        local id_index = 0
        for i, dir in ipairs(dirs) do
          if dir == "[id]" then
            id_index = i
          end
        end
        local new_dir = dirs[id_index - 1]
        return new_dir .. "/" .. filename
      elseif last_dir == '[slug]' then
        local id_index = 0
        for i, dir in ipairs(dirs) do
          if dir == "[slug]" then
            id_index = i
          end
        end
        local new_dir = dirs[id_index - 1]
        return new_dir .. "/" .. filename
      else
        return last_dir .. "/" .. filename
      end
    elseif ext == nil then
      local last_dir = dirs[#dirs - 1]
      return last_dir .. "/" .. filename
    else
      local last_dir = dirs[#dirs - 1]
      return last_dir .. "/" .. filename
    end
  end
end

require("cokeline").setup(
  {
    sidebar = {
      filetype = 'NvimTree',
      components = {
        {
          text = "  NvimTree",
          fg = dark,
          bg = high,
          style = 'bold'
        } }
    },
    default_hl = {
      fg = function(buffer)
        if buffer.is_focused then
          return dark
        end
        return text
      end,
      bg = function(buffer)
        if buffer.is_focused then
          return high
        end
        return grey
      end
    },
    components = {
      {
        text = function(buffer)
          if buffer.index ~= 1 then
            return ""
          end
          return ""
        end,
        bg = function(buffer)
          if buffer.is_focused then
            return high
          end
          return grey
        end,
        fg = dark
      },
      space,
      {
        text = function(buffer)
          if is_picking_focus() or is_picking_close() then
            return buffer.pick_letter .. " "
          end

          return buffer.devicon.icon
        end,
        fg = function(buffer)
          if is_picking_focus() then
            return yellow
          end
          if is_picking_close() then
            return red
          end

          if buffer.is_focused then
            return dark
          else
            return light
          end
        end,
        style = function(_)
          return (is_picking_focus() or is_picking_close()) and "italic,bold" or nil
        end
      },
      {
        text = function(buffer)
          -- return buffer.unique_prefix .. buffer.filename .. "⠀"
          -- return buffer.path .. buffer.filename .. "⠀"
          if get_path_parts(buffer.path) ~= nil then
            return get_path_parts(buffer.path) .. "⠀"
          else
            return buffer.filename .. "⠀"
          end
        end,
        style = function(buffer)
          return buffer.is_focused and "bold" or nil
        end
      },
      {
        text = "",
        fg = function(buffer)
          if buffer.is_focused then
            return high
          end
          return grey
        end,
        bg = dark
      }
    }
  }
)
