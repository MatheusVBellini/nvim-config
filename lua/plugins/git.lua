return {
	{
		"tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", {}) -- git status <gs -> git + status>
      vim.keymap.set("n", "<leader>gc", ":Git commit ", {}) -- git commit <gc -> git + commit>
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {}) -- git blame <gb -> git + blame>
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", {}) -- git log <gl -> git + log>
      vim.keymap.set("n", "<leader>gP", ":Git push<CR>", {}) -- git push <gp -> git + push>
      vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", {}) -- git pull <gP -> git + pull>
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", {}) -- git add <ga -> git + add>
    end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- keybindings
			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {}) -- preview hunk <gp -> git + hunk>
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {}) -- inline git blame <gb -> git + toggle>
		end,
	},
}
