local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "xiyaowong/nvim-transparent" },
  {
    "dakai/embark-theme-vim",
    config = function()
      vim.cmd("colorscheme embark")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    config = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  {
    "williamboman/mason.nvim",
    build = function()
      vim.cmd("MasonUpdate")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { 'saadparwaiz1/cmp_luasnip' },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "nvim-treesitter/nvim-treesitter" },
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-autopairs" },
  { "nvim-telescope/telescope.nvim" },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- },
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {}
    end,
  },
  { "karb94/neoscroll.nvim" },
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter',
    config = function()
      vim.g.codeium_no_map_tab = 1
      vim.keymap.set("i", "<M-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<M-i>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<M-k>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<M-j>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true })
    end,
  },
  -- { 'davidosomething/format-ts-errors.nvim' },
  { "elentok/format-on-save.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("codegpt.config")
      vim.g["codegpt_commands_defaults"] = {
        model = 'gpt-4-1106-preview'
      }
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'RRethy/vim-illuminate' },
  -- {
  --   'echasnovski/mini.animate',
  --   version = '*',
  --   config = function()
  --     require('mini.animate').setup()
  --   end,
  -- },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "gw",
        mode = { "n" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = { --[[ things you want to change go here]] },
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        direction = 'horizontal',
        hide_numbers = true,  -- hide the number column in toggleterm buffers
        autochdir = false,    -- when neovim changes it current directory the terminal will change it's own when next it's opened
        persist_mode = true,  -- if set to true (default) the previous terminal mode will be remembered
        close_on_exit = true, -- close the terminal window when the process exits
        auto_scroll = true,   -- automatically scroll to the bottom on terminal output

      }
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Sync/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "yuchanns/phpfmt.nvim",
    config = function()
      require("phpfmt").setup({
        -- Default configs
        cmd = "phpcbf",
        standard = "PSR12",
        auto_format = true,
      })
    end
  },
  {
    "rcarriga/nvim-notify",
  },
  --  {
  --    "stevearc/dressing.nvim"
  --  },
  --{
  --  "kiyoon/jupynium.nvim",
  --  build = "pipx install .",
  --  dependencies = {
  --    "rcarriga/nvim-notify",
  --    "stevearc/dressing.nvim"
  --  }
  --  -- build = "conda run --no-capture-output -n jupynium pip install .",
  --  -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  --},
  --{
  {
    'cljoly/telescope-repo.nvim',
    'airblade/vim-rooter',
    config = function()
      g['rooter_cd_cmd'] = 'lcd'
    end
  },
})
