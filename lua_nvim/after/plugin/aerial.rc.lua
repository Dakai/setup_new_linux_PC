local status, aerial = pcall(require, "aerial")
if (not status) then return end

aerial.setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "]", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", ";a", "<cmd>AerialToggle!<CR>")
