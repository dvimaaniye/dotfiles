return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		"onsails/lspkind.nvim",
		"nvim-treesitter/nvim-treesitter",
		"xzbdmw/colorful-menu.nvim",
	},
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
				-- docs = { auto_open = false },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol",
						show_labelDetails = true,
						max_width = {
							menu = 80,
							abbr = 50,
						},
						ellipsis_char = "...",
					})(entry, vim.deepcopy(vim_item))
					local highlights_info = require("colorful-menu").cmp_highlights(entry)

					-- highlight_info is nil means we are missing the ts parser, it's
					-- better to fallback to use default `vim_item.abbr`. What this plugin
					-- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
					if highlights_info ~= nil then
						vim_item.abbr_hl_group = highlights_info.highlights
						vim_item.abbr = highlights_info.text
					end
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					vim_item.kind = (strings[1] or "")
					vim_item.menu = ""

					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
		})
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})
	end,
}
