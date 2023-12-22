-- [[ general configs ]]
vim.cmd("set expandtab"); -- tabs are 2 spaces
vim.cmd("set tabstop=2");
vim.cmd("set softtabstop=2");
vim.cmd("set shiftwidth=2");

vim.g.mapleader = " " -- space is leader symbol
vim.o.mouse = 'a' -- mouse reporting for all modes

vim.opt.number = true        -- Enables line numbers
vim.opt.relativenumber = true -- Sets line numbers to be relative

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

-- [[ import plugins ]]
require("lazy").setup("plugins")

-- [[ telescope setup ]]
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/ryanoasis/nerd-fonts
local builtin_ff = require("telescope.builtin")
local builtin_fb = require("telescope").load_extension "file_browser"
vim.keymap.set('n', '<leader>ff', builtin_ff.find_files, {}) -- open file search
vim.keymap.set('n', '<leader>fg', builtin_ff.live_grep, {}) -- open live-grep on files
vim.keymap.set('n', '<leader>fb', builtin_fb.file_browser, {}) -- open file browser

-- [[ neotree setup ]]
vim.keymap.set('n', '<leader>ft', ':Neotree filesystem toggle left<CR>', {})

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

vim.keymap.set('n', '<leader>wh', ':split<CR>', { noremap = true, silent = true }) -- split window horizontally
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { noremap = true, silent = true }) -- split window vertically

vim.api.nvim_set_keymap('n', '<leader>w<Right>', '<C-w>l', { noremap = true, silent = true }) -- move cursor right
vim.keymap.set('n', '<leader>w<Left>', '<C-w>h', { noremap = true, silent = true }) -- move cursor left
vim.keymap.set('n', '<leader>w<Up>', '<C-w>k', { noremap = true, silent = true }) -- move cursor up
vim.keymap.set('n', '<leader>w<Down>', '<C-w>j', { noremap = true, silent = true }) -- move cursor down

vim.api.nvim_set_keymap('n', '<leader>wh', '<C-W>H', { noremap = true, silent = true }) -- move window left
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-W>J', { noremap = true, silent = true }) -- move window down
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-W>K', { noremap = true, silent = true }) -- move window up
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-W>L', { noremap = true, silent = true }) -- move window right

vim.api.nvim_set_keymap('n', '<leader>w=', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w-', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w]', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w[', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- [[ colorscheme setup ]]
vim.cmd.colorscheme "gruber-darker"

