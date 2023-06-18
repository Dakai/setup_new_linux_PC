local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#100E23', -- separator background
      -- bg = '#002b36',
      bg = '#100E23', -- separator color
    },
    separator_selected = {
      fg = '#100E23', -- selected buffer background
      bg = '#9feed5', -- separator color
    },
    background = {
      fg = '#fdf6e3', -- not seleceted font color
      bg = '#100E23'  -- not selected background color
    },
    buffer_selected = {
      fg = '#100E23', -- tab font
      bg = '#9feed5', -- selected background color
      bold = true,
    },
    fill = {
      bg = '#100e23' -- whole background
    }
  },
})
-- vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
-- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
