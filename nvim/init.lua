vim.g.mapleader = " "
require("config.lazy")

local lsp = require("lspconfig")
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

lsp.pyright.setup({})
lsp.bashls.setup({
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
  filetypes = { "sh", "bash", "zsh" },
})

lsp.clangd.setup({})

lsp.rust_analyzer.setup({
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})
