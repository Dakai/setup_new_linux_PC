local status, transparent = pcall(require, "transparent")
if (not status) then return end

transparent.setup({ -- Optional, you don't have to run setup.
  groups = {        -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {},                                 -- table: additional groups that should be cleared
  exclude_groups = { 'CursorLine', 'CursorLineNr' }, -- table: groups you don't want to clear
})
