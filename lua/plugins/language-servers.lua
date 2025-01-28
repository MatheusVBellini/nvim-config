local servers = { "bashls", "clangd", "cmake", "jsonls", "jdtls", "lua_ls", "marksman", "jedi_language_server", "verible" }
local formatters = { "stylua", "prettier", "black" }
local linters = { "actionlint", "checkstyle", "verible" }
local formatters_null_ls = { "clang_format", "cmake_format" }
local linterts_null_ls = { "clazy", "cmake_lint" }
local formatters_mason = { "clang-format" }
local linters_mason = { "eslint_d" }

local format_and_lint = {}
for i = 1, #formatters do
	table.insert(format_and_lint, formatters[i])
end
for i = 1, #formatters_mason do
	table.insert(format_and_lint, formatters_mason[i])
end
for i = 1, #linters do
	table.insert(format_and_lint, linters[i])
end
for i = 1, #linters_mason do
	table.insert(format_and_lint, linters_mason[i])
end

return {
	{ -- [[ language server fetcher ]]
		-- callable with :Mason
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{ -- [[ language server fetching ]]
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				auto_update = true,
				run_on_start = true,
			})
		end,
	},

	{ -- [[ language formatters and linters fetching ]]
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = format_and_lint,
				auto_update = true,
				run_on_start = true,
			})
		end,
	},

	{ -- [[ auto-completion ]]
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
					["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
					-- C-b (back) C-f (forward) for snippet placeholder navigation.
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})
		end,
	},

	{ -- [[ language server activation ]]
		"neovim/nvim-lspconfig",
		dependencies = "hrsh7th/cmp-nvim-lsp",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			-- special keybindings
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {}) -- show code documentation <ch -> code + hover>
			vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {}) -- show code implementation  <ci -> code + implementation>
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {}) -- show code definition <cd -> code + definition>
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {}) -- rename token <cr -> code + rename>
			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.references, {}) -- find token references <cf -> code + find>
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- open code actions menu <ca -> code + action>
		end,
	},

	{ -- [[ Linting and Formatting ]]

		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local sources = {}
			for _, formatter in ipairs(formatters) do
				if null_ls.builtins.formatting[formatter] then
					table.insert(sources, null_ls.builtins.formatting[formatter])
				end
			end
			for _, linter in ipairs(linters) do
				if null_ls.builtins.diagnostics[linter] then
					table.insert(sources, null_ls.builtins.diagnostics[linter])
				end
			end
			for _, formatter in ipairs(formatters_null_ls) do
				table.insert(sources, null_ls.builtins.formatting[formatter])
			end
			for _, linter in ipairs(linterts_null_ls) do
				table.insert(sources, null_ls.builtins.diagnostics[linter])
			end

			null_ls.setup({
				sources = sources,
			})

			-- special keybindings
			vim.keymap.set("n", "<leader>format", vim.lsp.buf.format, {}) -- format code <format>
		end,
	},
}
