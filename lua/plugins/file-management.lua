return {

	{ -- file finder
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- open file search <ff -> file + find>
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- open live-grep on files <fg -> file + grep>
		end,
	},

	{ -- file browser
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope").load_extension("file_browser")
			vim.keymap.set("n", "<leader>fb", builtin.file_browser, {}) -- open file browser <fb -> file + browser>
		end,
	},

	{ -- better ui
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},

	{ -- file tree
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},

		config = function()
			vim.keymap.set("n", "<leader>ft", ":Neotree filesystem toggle left<CR>", {}) -- <ft -> file + tree>
		end,
	},
}
