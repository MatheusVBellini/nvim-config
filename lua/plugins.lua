return {

  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', -- file finder
    dependencies = { 'nvim-lua/plenary.nvim' } },

  { "nvim-telescope/telescope-file-browser.nvim", -- file browser
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } },

  { "nvim-neo-tree/neo-tree.nvim", -- file tree
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    } },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- tree syntax identifier

}
