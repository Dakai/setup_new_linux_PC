local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

function yamlfmt()
  local fileName = vim.api.nvim_buf_get_name(0)
  vim.cmd(":!yamlfmt " .. fileName)
end

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    -- php = formatter.lsp,
    css = formatters.lsp,
    html = formatters.lsp,
    java = formatters.lsp,
    -- javascript = formatters.lsp,
    -- typescript = formatters.lsp,
    svelte = formatters.lsp,
    -- svelte = formatters.prettierd,
    json = formatters.lsp,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    javascript = formatters.prettierd,
    openscad = formatters.lsp,
    python = formatters.lsp,
    rust = formatters.lsp,
    scad = formatters.lsp,
    scss = formatters.lsp,
    sh = formatters.lsp,
    terraform = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    -- yaml = formatters.lsp,
    yaml = yamlfmt,
    -- Optional: fallback formatter to use when no formatters match the current filetype
    fallback_formatter = {
      formatters.remove_trailing_whitespace,
      formatters.remove_trailing_newlines,
      formatters.prettierd,
    }
  },
  -- run_with_sh = false,
})
