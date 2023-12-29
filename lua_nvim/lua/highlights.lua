vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
-- Set the background color of the TabLineFill highlight group to black
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1d1b2f" })
