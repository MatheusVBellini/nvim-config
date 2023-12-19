-- [[ tabs are 2 spaces long ]]
vim.cmd("set expandtab");
vim.cmd("set tabstop=2");
vim.cmd("set softtabstop=2");
vim.cmd("set shiftwidth=2");

-- [[ lazy.nvim package manager ]]
-- callable with :Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local plugins = {
  { "blazkowolf/gruber-darker.nvim" }, -- gruber-darker colorstheme

  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', -- file finder
    dependencies = { 'nvim-lua/plenary.nvim' } },

}
local opts = {}

require("lazy").setup(plugins, opts)

-- [[ telescope setup ]]
local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<C-p>', builtin.find_files(), {})

-- [[ colorscheme setup ]]
vim.cmd.colorscheme "gruber-darker"
