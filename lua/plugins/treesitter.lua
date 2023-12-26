-- tree syntax identifier
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local languages = {"lua", "vim", "python", "c", "cpp"}
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = languages,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}
