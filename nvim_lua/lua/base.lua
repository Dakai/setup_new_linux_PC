vim.cmd('autocmd!') -- remove all previously defined autocmds and start with a clean slate

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true -- enables line numbering only for the current window

vim.opt.title = true 
vim.opt.autoindent = true -- Neovim will automatically add spaces or tabs to new lines to match the existing indentation level

vim.opt.hlsearch = true -- highlight all matching search patterns
vim.opt.backup = false 
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2 -- individual status line for split window 
vim.opt.expandtab = true -- space is used instead of real tab        
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*'
vim.opt.inccommand = 'split' -- incremental search in split window
vim.opt.ignorecase = true
vim.opt.smarttab = true
