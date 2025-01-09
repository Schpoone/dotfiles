require("mason-lspconfig").setup {
  ensure_installed = {
    "rust-analyzer",
    "pyright",
  },
  automatic_installation = true,
}
