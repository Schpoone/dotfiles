local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python", "rust" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   ft = { "python", "rust" },
  --   opts = function()
  --     return require "configs.null-ls"
  --   end,
  -- },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    ft = { "python", "rust" },
    opts = function()
      return require "configs.null-ls"
    end,
    config = {
      ensure_installed = { "mypy", "ruff", "black" },
      automatic_installation = true,
    },
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = function()
  --     return require "configs.rust-tools"
  --   end,
  --   config = function(_, opts)
  --     require("configs.rust-tools").setup(opts)
  --   end,
  -- },
}
return plugins
