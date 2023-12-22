-- file finder
return { 
  'nvim-telescope/telescope.nvim', tag = '0.1.5', 
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function() 
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- open file search
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- open live-grep on files
  end

}
