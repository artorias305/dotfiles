return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    version = "1.*",
    opts = {},
  },
  {
    "Myriad-Dreamin/tinymist",
    ft = "typst",
    config = function()
      require("lspconfig").tinymist.setup({})
    end,
  },
}
