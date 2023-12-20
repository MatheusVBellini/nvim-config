-- [[ tabs are 2 spaces long ]]
vim.cmd("set expandtab");
vim.cmd("set tabstop=2");
vim.cmd("set softtabstop=2");
vim.cmd("set shiftwidth=2");

-- [[ leader key for macros ]]
vim.g.mapleader = " "

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

  { "nvim-telescope/telescope-file-browser.nvim", -- file browser
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- tree syntax identifier

}
local opts = {}

require("lazy").setup(plugins, opts)

-- [[ telescope setup ]]
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/ryanoasis/nerd-fonts
local builtin_ff = require("telescope.builtin")
local builtin_fb = require("telescope").load_extension "file_browser"
vim.keymap.set('n', '<leader>ff', builtin_ff.find_files, {}) -- open file search
vim.keymap.set('n', '<leader>fg', builtin_ff.live_grep, {}) -- open live-grep on files
vim.keymap.set('n', '<leader>fb', builtin_fb.file_browser, {}) -- open file browser

-- [[ treesitter setup ]]
-- https://github.com/nvim-treesitter/nvim-treesitter
local languages = {"lua", "vim", "python", "c", "cpp"}
local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = languages,
  highlight = { enable = true },
  indent = { enable = true },  
})

-- [[ general macros ]]
vim.keymap.set('n', '<leader>fs', ':w<CR>', { noremap = true, silent = true }) -- save
vim.keymap.set('n', '<leader>fq', ':q<CR>', { noremap = true, silent = true }) -- save and quit

-- [[ colorscheme setup ]]
vim.cmd.colorscheme "gruber-darker"

