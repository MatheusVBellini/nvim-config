-- [[ settings ]]
vim.cmd("set expandtab"); -- tabs are 2 spaces
vim.cmd("set tabstop=2");
vim.cmd("set softtabstop=2");
vim.cmd("set shiftwidth=2");

vim.g.mapleader = " " -- space is leader symbol
vim.o.mouse = 'a' -- mouse reporting for all modes

vim.opt.number = true -- Enables line numbers
vim.opt.relativenumber = true -- Sets line numbers to be relative

vim.opt.ignorecase = true -- case insensitive ctrl+f
vim.opt.smartcase = true -- case sensitive if uppercase
vim.opt.hlsearch = true -- highlight when searching
vim.opt.incsearch = true -- search while typing

-- [[ macros ]]
vim.keymap.set('n', '<leader>fs', ':w<CR>', { noremap = true, silent = true }) -- save <fs -> file + save>
vim.keymap.set('n', '<leader>fq', ':q<CR>', { noremap = true, silent = true }) -- save and quit <fq -> file + quit>

vim.keymap.set('n', '<leader>ws', ':split<CR>', { noremap = true, silent = true }) -- split window horizontally <ws -> window + split>
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { noremap = true, silent = true }) -- split window vertically <wv -> window + vertical>

vim.api.nvim_set_keymap('n', '<leader>w<Right>', '<C-w>l', { noremap = true, silent = true }) -- move cursor right
vim.keymap.set('n', '<leader>w<Left>', '<C-w>h', { noremap = true, silent = true }) -- move cursor left
vim.keymap.set('n', '<leader>w<Up>', '<C-w>k', { noremap = true, silent = true }) -- move cursor up
vim.keymap.set('n', '<leader>w<Down>', '<C-w>j', { noremap = true, silent = true }) -- move cursor down

vim.api.nvim_set_keymap('n', '<leader>wh', '<C-W>H', { noremap = true, silent = true }) -- move window left
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-W>J', { noremap = true, silent = true }) -- move window down
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-W>K', { noremap = true, silent = true }) -- move window up
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-W>L', { noremap = true, silent = true }) -- move window right

vim.api.nvim_set_keymap('n', '<leader>w=', ':resize +5<CR>', { noremap = true, silent = true }) -- increase window height
vim.api.nvim_set_keymap('n', '<leader>w-', ':resize -5<CR>', { noremap = true, silent = true }) -- decrease window height
vim.api.nvim_set_keymap('n', '<leader>w]', ':vertical resize +5<CR>', { noremap = true, silent = true }) -- increase window width
vim.api.nvim_set_keymap('n', '<leader>w[', ':vertical resize -5<CR>', { noremap = true, silent = true }) -- decrease window width

vim.api.nvim_set_keymap('n', '<leader>tf', '/', { noremap = true, silent = true }) -- search word <tf -> text + find>
vim.api.nvim_set_keymap('n', '<leader>th', ':noh<CR>', { noremap = true, silent = true }) -- unhighlight sought word <th -> text + highlight>

