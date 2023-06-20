local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', "<C-a>")
keymap.set('n', '-', "<C-x>")

-- Delete a word backwords
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'g<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', 'sj', '<C-w>h') -- left
keymap.set('n', 'sl', '<C-w>l') -- right
keymap.set('n', 'si', '<C-w>k') -- up
keymap.set('n', 'sk', '<C-w>j') -- down

-- Resize window
keymap.set('n', '<C-w>k', '<C-w><')
keymap.set('n', '<C-w>i', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- map <Space>w to save file
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true })

-- map <Space>q to quit neovim
vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Space>m', '<Plug>MarkdownPreviewToggle', {})
