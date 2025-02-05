return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/trouble.nvim",
    name="trouble",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "AckslD/swenv.nvim",
  },
  {
    "stevearc/resession.nvim",
    opts = {},
    config = function()
      local resession = require "resession"
      resession.setup()
      -- Resession does NOTHING automagically, so we have to set up some keymaps
      vim.keymap.set("n", "<Leader>r1", resession.save, {})
      vim.keymap.set("n", "<Leader>r2", resession.load, {})
      vim.keymap.set("n", "<Leader>r1", resession.delete, {})
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
      autoinstall = true,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup {
        stay_on_this_version = true,
      }
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "jedrzejboczar/possession.nvim",
    name = "possession",
    config = function()
      require("possession").setup {
        autosave = {
          current = false, -- or fun(name): boolean
          cwd = false, -- or fun(): boolean
          tmp = false, -- or fun(): boolean
          tmp_name = "tmp", -- or fun(): string
          on_load = true,
          on_quit = true,
        },
        autoload = false,
        commands = {
          save = "SSave",
          load = "SLoad",
          delete = "SDelete",
          list = "SList",
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim" ,
    name = "diffview",
  },
}
