-- file tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function ()
    vim.keymap.set('n', '<leader>ft', ':Neotree filesystem toggle left<CR>', {}) -- <ft -> file + tree>
  end

}
