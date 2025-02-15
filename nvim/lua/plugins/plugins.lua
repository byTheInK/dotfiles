return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  },

  "iamcco/markdown-preview.nvim",
  "nvim-telescope/telescope.nvim",
  "neovim/nvim-lspconfig",
  "andweeb/presence.nvim",
  "Civitasv/cmake-tools.nvim",
}
