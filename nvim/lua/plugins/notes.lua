return {
  {
    "3rd/image.nvim",
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_forward_search_on_start = false
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "/home/user/.texfiles/",
        out_dir = "/home/user/.texfiles",
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
  },
}
