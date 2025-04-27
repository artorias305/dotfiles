return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({ transparent = true })
    end,
  },
}
