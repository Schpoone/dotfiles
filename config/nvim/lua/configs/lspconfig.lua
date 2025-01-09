local configs = require "nvchad.configs.lspconfig"
configs.defaults()

local lspconfig = require "lspconfig"

local servers = {
  html = {},
  awk_ls = {},
  rust_analyzer = {
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern "Cargo.toml",
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
  pyright = {
    filetypes = { "python" },
  },
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end
