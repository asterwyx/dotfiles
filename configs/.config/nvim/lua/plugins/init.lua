return {
  -- overrides
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig").defaults()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "configs.gitsigns"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },

  {
    "numToStr/Comment.nvim",
    init = function()
      require("Comment.ft").set("qmljs", "//%s")
    end,
  },

  -- add plugins to here
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
    event = "BufWritePre",
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      vim.g["suda#prompt"] = "Enter administrator password: "
    end,
  },

  {
    "ibhagwan/smartyank.nvim",
    event = "BufReadPost",
    config = function(_, opts)
      require("smartyank").setup(opts)
    end,
  },
  {
    "jcdickinson/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function(_, opts)
      require("codeium").setup(opts)
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    ft = { "plantuml" },
    opts = require "configs.plantuml",
    dependencies = {
      "javiorfo/nvim-nyctophilia",
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  {
    "folke/noice.nvim",
    event = "UIEnter",
    opts = require "configs.noice",
    config = function(_, opts)
      require("noice").setup(opts)
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#1D1536",
        },
        config = function(_, opts)
          require("notify").setup(opts)
          vim.notify = require "notify"
        end,
      },
    },
  },

  {
    "dnlhc/glance.nvim",
    opts = {
      border = {
        enable = true,
      },
    },
    event = "LspAttach",
  },

  {
    "echasnovski/mini.indentscope",
    event = { "CursorMoved" },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost" },
    config = function(_, opts)
      require("mini.trailspace").setup(opts)
    end,
  },

  {
    "echasnovski/mini.animate",
    event = { "CursorMoved", "WinNew", "WinClosed" },
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
  },

  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    version = "^4",
  },

  {
    "Saecki/crates.nvim",
    event = "BufReadPost Cargo.toml",
    opts = require "configs.crates",
    config = function(_, opts)
      require("crates").setup(opts)
    end,
  },
}
