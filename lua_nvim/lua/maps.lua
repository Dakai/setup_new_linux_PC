local keymap = vim.keymap

-- new Leader key
vim.g.mapleader = ";"

-- Do not yank with x
-- keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwords
keymap.set("n", "dw", 'vb"_d')
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
-- Move window
keymap.set("n", "sh", "<C-w>h") -- left
keymap.set("n", "sl", "<C-w>l") -- right
keymap.set("n", "sk", "<C-w>k") -- up
keymap.set("n", "sj", "<C-w>j") -- down

-- Resize window
keymap.set("n", "<C-w>k", "<C-w><")
keymap.set("n", "<C-w>i", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- map <Space>w to save file
vim.api.nvim_set_keymap("n", "<Space>w", ":w<CR>", { noremap = true })

-- map <Space>q to quit neovim
--vim.api.nvim_set_keymap("n", "<Space>q", ":q<CR>", { noremap = true })

-- map <Space>d to delele buffer
--vim.api.nvim_set_keymap("n", "<Space>d", ":bd<CR>", { noremap = true })

function Delete_buffer_or_exit()
  local buflisted = vim.fn.getbufinfo({ buflisted = 1 })
  if #buflisted > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('q')
  end
end

-- Map <Space>q to the delete_buffer_or_exit function in normal mode
vim.api.nvim_set_keymap("n", "<Space>q", ":lua Delete_buffer_or_exit()<CR>", { silent = true })

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

-- Map gt to next buff
-- The problem with this mapping is it goes to next buffer by buffnr, not tab position
--vim.api.nvim_set_keymap('n', 'gT', ':bp<CR>', { noremap = true, silent = true })
-- Map gT to previous buff
--vim.api.nvim_set_keymap('n', 'gt', ':bn<CR>', { noremap = true, silent = true })

-- Map gt to next buffer or gT directly to certain buffer
vim.keymap.set('n', 'gt', function()
  return ('<Plug>(cokeline-focus-%s)'):format(vim.v.count > 0 and vim.v.count or 'next')
end, { silent = true, expr = true })

vim.keymap.set('n', 'gT', function()
  return ('<Plug>(cokeline-focus-%s)'):format(vim.v.count > 0 and vim.v.count or 'prev')
end, { silent = true, expr = true })


-- From ThePrimeagen

-- move highlighted text up and down"
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.o.lazyredraw = false
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<Space>y", [["+y]])
-- vim.keymap.set("n", "<Space>Y", [["+Y]])
