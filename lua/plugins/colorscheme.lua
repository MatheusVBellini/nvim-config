-- colorstheme
return {
  --vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]],
  --vim.cmd[[hi NonText guibg=NONE ctermbg=NONE]],

  {
    "blazkowolf/gruber-darker.nvim",
  },

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
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

}
