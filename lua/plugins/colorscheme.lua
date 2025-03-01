-- colorstheme
return {
	--vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]],
	--vim.cmd[[hi NonText guibg=NONE ctermbg=NONE]],

	{
		"blazkowolf/gruber-darker.nvim",
	},

  {
    "fcpg/vim-farout",
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

	{
	  "Mofiqul/dracula.nvim",
		name = "dracula",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
	  "rose-pine/neovim",
		name = "rose-pine",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"Shatur/neovim-ayu",

		config = function()
			local colors = require("ayu.colors")
			colors.generate() -- Pass `true` to enable mirage

			require("ayu").setup({
				mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
				terminal = true, -- Set to `false` to let terminal manage its own colors.
				overrides = function()
					return { Comment = { fg = colors.comment } }
				end, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
			})
		end,
	},
}
