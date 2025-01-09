require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Tmux
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Lspconfig
map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "LSP definition" })
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "LSP hover" })
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })
map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })
map("n", "<leader>D", function()
  vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })
map("n", "<leader>ra", function()
  require("nvchad.renamer").open()
end, { desc = "LSP rename" })
map({ "n", "v" }, "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code action" })
map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "LSP references" })
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = "rounded" } }
end, { desc = "Goto prev" })
map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = "rounded" } }
end, { desc = "Goto next" })
map("n", "<leader>ds", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })

-- Gitsigns
map("n", "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end, { desc = "Blame line" })
