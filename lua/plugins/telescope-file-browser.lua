-- file browser 
return { 
  "nvim-telescope/telescope-file-browser.nvim", 
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  config = function() 
    local builtin = require("telescope").load_extension "file_browser"
    vim.keymap.set('n', '<leader>fb', builtin.file_browser, {}) -- open file browser
  end

}
