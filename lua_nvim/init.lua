require('base')
require('highlights')
require('maps')
require('plugins')
-- require('statusline')

-- prevent insert mode when open file from telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/2027#issuecomment-1561836585
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})
