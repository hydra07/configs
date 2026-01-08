return {
  -- { "folke/nui.nvim", otp = {} },
  -- {
  --   "akinsho/bufferline.nvim",
  --   -- event = "VeryLazy",
  --   keys = {
  --     { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  --     { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  --   },
  --   opts = {
  --     options = {
  --       mode = "tabs",
  --       always_show_bufferline = true,
  --       -- show_buffer_close_icons = true,
  --
  --       -- separator_style = "slant",
  --       -- show_close_icon = false,
  --     },
  --   },
  -- },
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     cmdline = {
  --       enable = true,
  --       view = "cmdline",
  --     },
  --   },
  -- },
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
}
