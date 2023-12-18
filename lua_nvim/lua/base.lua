-- Speed up loading Lua modules in Neovim to improve startup time.
vim.loader.enable()
-- disable netrw at the very start of your init.lua per nvim-tree/nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- display relative line number
vim.wo.relativenumber = true

-- remove all previously defined autocmds and start with a clean slate
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- enables line numbering only for the current window
vim.wo.number = true
vim.opt.title = true

-- Neovim will automatically add spaces or tabs to new lines to match the existing indentation level
vim.opt.autoindent = true
-- highlight all matching search patterns
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1

-- individual status line for split window
vim.opt.laststatus = 2
-- space is used instead of real tab
vim.opt.expandtab = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.shell = 'zsh'
vim.opt.backupskip = { "*.bak", "*/tmp/*" }
-- incremental search in split window
vim.opt.inccommand = 'split'
-- ignore case when searching for a pattern
vim.opt.ignorecase = true
-- Vim will automatically use a mix of spaces and tabs for indentation, depending on the current context.
vim.opt.smarttab = true
-- Show a visual indication of wrapped lines in Vim
vim.opt.breakindent = true
-- set the number of spaces to be used for each level of indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- Auto indent
vim.opt.ai = true
-- Smart indent
vim.opt.si = true
-- No wrap lines
vim.opt.wrap = false
-- vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
-- "\e[4:3m" is an ANSI escape sequence for underlining text with a 1-pixel thick line
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})
-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

--"remove trailing on save
--vim.cmd([[
--  augroup TrimWhitespace
--    autocmd!
--    autocmd BufWritePre * %s/\s\+$//e
--  augroup END
--]])

-- Enable 'splitright' option
vim.opt.splitright = true

-- vim.opt.conceallevel = 3
-- Neorg setup
vim.opt.conceallevel = 3
