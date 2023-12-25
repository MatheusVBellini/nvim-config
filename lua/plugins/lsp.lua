-- language servers
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- fetch language servers
      local servers = {"bashls", "clangd", "cmake", "jsonls", "jdtls", "lua_ls", "marksman",  "jedi_language_server"}
      require("mason-lspconfig").setup({
        ensure_installed = servers
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- activate language servers
      lspconfig.bashls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.jedi_language_server.setup({})

      -- special keybindings
      vim.keymap.set('n', '<leader>cd', vim.lsp.buf.hover, {}) -- show code documentation <cd -> code + documentation>
      vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, {}) -- show code  <ci -> code + implementation>
    end
  },

}
