return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    otps = function()
      return {
        transparent = true,
      }
    end,
  },
}
