local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

vim.api.nvim_set_keymap(
  "n",
  "<Space>s",
  "<Cmd>lua require('telescope').extensions.smart_open.smart_open()<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", ";f", function()
  builtin.find_files({
    respect_gitignore = false,
    no_ignore = true,
    hidden = true,
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".next",
      ".lock",
      "package-lock.json",
      ".jpg",
      "jpeg",
      "png",
      "PNG",
      "JPEG",
      "JPG"
    },
  })
end)
vim.keymap.set("n", "<Space>t", function()
  builtin.find_files({
    respect_gitignore = false,
    no_ignore = true,
    hidden = true,
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".next",
      ".lock",
      "package-lock.json",
      ".jpg",
      "jpeg",
      "png",
      "PNG",
      "JPEG",
      "JPG",
    },
  })
end)
vim.keymap.set("n", "<Space>g", function()
  builtin.live_grep({
    respect_gitignore = false,
    no_ignore = true,
    hidden = false,
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".next",
      ".lock",
      "package-lock.json",
      ".jpg",
      "jpeg",
      "png",
      "PNG",
      "JPEG",
      "JPG",
    },
  })
end)
vim.keymap.set("n", "<Space>b", function()
  builtin.buffers()
end)
vim.keymap.set("n", "<Space>h", function()
  builtin.help_tags()
end)
vim.keymap.set("n", "<Space>r", function()
  builtin.resume()
end)
vim.keymap.set("n", "<Space>e", function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end)
vim.keymap.set("n", ";r", function()
  builtin.live_grep()
end)
vim.keymap.set("n", "\\\\", function()
  builtin.buffers()
end)
vim.keymap.set("n", ";h", function()
  builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
  builtin.resume()
end)
vim.keymap.set("n", ";e", function()
  builtin.diagnostics()
end)
-- Show Todos in Trouble
vim.keymap.set("n", ";t", ":TodoTelescope<Return>", { silent = true })

-- prevent insert mode when open file from telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/2027#issuecomment-1561836585
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})
