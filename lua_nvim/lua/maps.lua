local keymap = vim.keymap

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwords
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "g<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
-- Move window
keymap.set("n", "sj", "<C-w>h") -- left
keymap.set("n", "sl", "<C-w>l") -- right
keymap.set("n", "si", "<C-w>k") -- up
keymap.set("n", "sk", "<C-w>j") -- down

-- Resize window
keymap.set("n", "<C-w>k", "<C-w><")
keymap.set("n", "<C-w>i", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- map <Space>w to save file
vim.api.nvim_set_keymap("n", "<Space>w", ":w<CR>", { noremap = true })

-- map <Space>q to quit neovim
vim.api.nvim_set_keymap("n", "<Space>q", ":q<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Space>m", "<Plug>MarkdownPreviewToggle", {})

-- From https://www.reddit.com/r/neovim/comments/13y3thq/whats_a_very_simple_config_change_that_you_cant/
-- Remap y to ygv<esc> in visual mode so the cursor does not jump back to where you started the selection.
-- vnoremap y ygv<esc>
vim.api.nvim_set_keymap("v", "y", "ygv<esc>", { noremap = true })

vim.api.nvim_set_keymap("n", "<A-BS>", "bved", { desc = "Atl+BS delete entire word" })

vim.api.nvim_set_keymap(
  "n",
  "<cr>",
  "ciw",
  { desc = "Enter in normal mode to delete entire word and into insert mode" }
)

-- move highlighted text up and down"
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", {})
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", {})

-- Map gt to next buff
vim.api.nvim_set_keymap('n', 'gT', ':bp<CR>', { noremap = true, silent = true })

-- Map gT to previous buff
vim.api.nvim_set_keymap('n', 'gt', ':bn<CR>', { noremap = true, silent = true })
