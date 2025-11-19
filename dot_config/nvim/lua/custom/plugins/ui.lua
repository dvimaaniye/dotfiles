return {
	{
		require("custom.colorschemes.catppuccin"),
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},

	{
		"norcalli/nvim-colorizer.lua",
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			stages = "static",
			render = "wrapped-compact",
			max_width = 60,
		},
	},

	{
		"smjonas/inc-rename.nvim",
		opts = {},
		config = function()
			require("inc_rename").setup({})
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"refractalize/oil-git-status.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = true,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			views = {
				cmdline_popup = {
					position = {
						row = "10%",
						col = "50%",
					},
				},
			},
			-- messages = {
			-- 	view = "messages",
			-- },
			routes = {
				{
					view = "mini",
					filter = { event = "msg_showmode" },
				},
			},
			lsp = {
				hover = {
					silent = true,
				},
				message = {
					view = "mini",
				},
			},
			-- signature = {
			-- 	enabled = true,
			-- 	auto_open = {
			-- 		enabled = true,
			-- 		trigger = true,
			-- 		luasnip = true,
			-- 		throttle = 50,
			-- 	},
			-- },
			presets = {
				command_palette = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function(_, opts)
			require("noice").setup(opts)

			local noicelsp = require("noice.lsp")
			vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
				if not noicelsp.scroll(4) then
					return "<c-f>"
				end
			end, { silent = true, expr = true })

			vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
				if not noicelsp.scroll(-4) then
					return "<c-b>"
				end
			end, { silent = true, expr = true })
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			preset = "helix",
			delay = 100,
		},
	},

	{
		"tjdevries/express_line.nvim",
		config = function()
			require("custom.statusline").setup()
		end,
	},

	{
		"laytan/cloak.nvim",
		event = { "BufReadPre" },
		opts = {
			-- cloak_length = 8,
			cloak_on_leave = false,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				multiwindow = true, -- Enable multiwindow support.
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
		end,
	},
}
