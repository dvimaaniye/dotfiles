return {
	{
		require("themes.current"),
	},

	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {
			extra_groups = {},
		},
	},

	{
		"nvim-mini/mini.icons",
		version = "*",
		opts = {},
	},

	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			css = {
				css = true,
			},
		},
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
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			views = {
				cmdline_popup = {
					position = {
						row = "30%",
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
			require("config.statusline").setup()
		end,
	},

	{
		"laytan/cloak.nvim",
		event = { "BufReadPre" },
		opts = {
			-- cloak_length = 8,
			cloak_on_leave = true,
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
			-- vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "TreesitterContext" })
			-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = require("config.lsp").setup,
	},

	{
		"dvimaaniye/mason.nvim",
		-- dir = "~/projects/mason.nvim",
		-- dev = true,
		opts = {
			ui = {
				border = "single",
				backdrop = 0,
				height = 0.8,
				width = function()
					local cols = vim.o.columns
					if cols < 150 then
						return 0.8
					end
					return 110
				end,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Mason UI" })
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"dvimaaniye/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{
				"<leader>gs",
				"<cmd>tab Git<CR>",
				desc = "Git status",
			},
		},
	},

	{
		"NeogitOrg/neogit",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"folke/snacks.nvim",
		},
		config = function()
			local neogit = require("neogit")

			vim.keymap.set("n", "<leader>gs", function()
				neogit.open({ kind = "replace" })
			end, { desc = "Neo[g]it [s]tatus" })
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
			},
			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				local gitsigns = require("gitsigns")
				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk)
				map("n", "<leader>hr", gitsigns.reset_hunk)

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				map("n", "<leader>hS", gitsigns.stage_buffer)
				map("n", "<leader>hR", gitsigns.reset_buffer)
				map("n", "<leader>hp", gitsigns.preview_hunk)
				map("n", "<leader>hi", gitsigns.preview_hunk_inline)

				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end)

				map("n", "<leader>hd", gitsigns.diffthis)

				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end)

				map("n", "<leader>hQ", function()
					gitsigns.setqflist("all")
				end)
				map("n", "<leader>hq", gitsigns.setqflist)

				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
				map("n", "<leader>tw", gitsigns.toggle_word_diff)

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk)
			end,
		},
	},

	{
		"mistweaverco/kulala.nvim",
		enabled = false,
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = false,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},

	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
				vim.cmd.UndotreeToggle,
				desc = "Toggle undotree",
			},
		},
		config = function()
			vim.g.undotree_WindowLayout = 3
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			autochdir = true,
			direction = "float",
			open_mapping = "<c-_>", -- <C-/> it is
			float_opts = {
				border = "rounded",
				width = function()
					if vim.o.columns < 120 then
						return math.floor(vim.o.columns * 0.8)
					end
					return 110
				end,
				height = function()
					return math.floor(vim.o.lines * 0.6)
				end,
				winblend = 0,
			},
		},
	},

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		init = function()
			local ls = require("luasnip")

			vim.keymap.set({ "i" }, "<C-o>", function()
				ls.expand()
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				ls.jump(1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-e>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},

	{
		"dvimaaniye/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		init = function()
			vim.schedule(function()
				if vim.bo.ft == "lazy" then
					vim.cmd.quit()
				end

				if vim.fn.argc() == 0 then
					if require("persistence").load() == false then
						vim.cmd("Oil")
					end
				end
			end)
		end,
	},

	{
		"kndndrj/nvim-dbee",
		enabled = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup()
		end,
	},

	{
		"mfussenegger/nvim-dap",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"igorlfs/nvim-dap-view",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = require("config.debugging").setup,
	},

	{
		"igorlfs/nvim-dap-view",
		enabled = false,
		---@module 'dap-view'
		---@type dapview.Config
		opts = {
			winbar = {
				controls = {
					enabled = true,
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = require("config.languages").ensure_installed,
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				modules = {},

				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 1024 * 1024 -- 1 MB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = true,
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
			ignore = function(bufnr)
				if vim.bo[bufnr].filetype == "markdown" then
					return false
				end
				return true
			end,
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", ":TmuxNavigateLeft<CR>" },
			{ "<C-j>", ":TmuxNavigateDown<CR>" },
			{ "<C-k>", ":TmuxNavigateUp<CR>" },
			{ "<C-l>", ":TmuxNavigateRight<CR>" },
			{ "<C-\\>", ":TmuxNavigatePrevious<CR>" },
		},
	},

	{ "kevinhwang91/nvim-bqf", ft = "qf", dependencies = { "junegunn/fzf" } },

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			CustomOilBar = function()
				local path = vim.fn.expand("%")
				path = path:gsub("oil://", "")

				return "  " .. vim.fn.fnamemodify(path, ":.")
			end

			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				columns = {
					"icon",
				},
				win_options = {
					signcolumn = "yes:2",
					winbar = "%{v:lua.CustomOilBar()}",
				},
				view_options = {
					show_hidden = true,
				},
				lsp_file_methods = {
					enabled = true,
					timeout_ms = 1000,
					autosave_changes = true,
				},
				float = {
					padding = 2,
					max_width = 0.7,
					max_height = 0.8,
				},
				confirmation = { border = "single" },
				preview_win = {
					update_on_cursor_moved = true,
					preview_method = "fast_scratch",
					disable_preview = function(filename)
						local stat = vim.loop.fs_stat(filename)

						if not stat then
							return false
						end

						if stat.type == "directory" then
							return false
						end

						local max_filesize = 100 * 1024
						if stat.type == "file" then
							local basename = vim.fn.fnamemodify(filename, ":t")
							if basename:match("^%.env") or stat.size > max_filesize then
								return true
							end
						end

						return false
					end,
				},
				watch_for_changes = true,
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<C-r>"] = "actions.refresh",
					["<C-q>"] = "actions.close",
				},
			})

			vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

			-- vim.api.nvim_create_autocmd("User", {
			-- 	pattern = "OilActionsPost",
			-- 	callback = function(event)
			-- 		if event.data.actions.type == "move" then
			-- 			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
			-- 		end
			-- 	end,
			-- })

			-- vim.g.loaded_netrw = 1
			-- vim.g.loaded_netrwPlugin = 1
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({
				settings = {
					save_on_toggle = true,
				},
			})
			local harpoon_extensions = require("harpoon.extensions")
			harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add to harpoon" })

			vim.keymap.set("n", "<leader>hl", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon list" })

			for i = 1, 9, 1 do
				vim.keymap.set("n", string.format("<leader>%d", i), function()
					harpoon:list():select(i)
				end, { desc = string.format("Harpoon item %d", i) })

				vim.keymap.set("n", string.format("<leader>0%d", i), function()
					harpoon:list():replace_at(i)
				end, { desc = string.format("Harpoon replace item %d", i) })
			end

			vim.keymap.set("n", "<leader>h[", function()
				harpoon:list():prev()
			end, { desc = "Harpoon list prev" })

			vim.keymap.set("n", "<leader>h]", function()
				harpoon:list():next()
			end, { desc = "Harpoon list next" })
		end,
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {},
			indent = {
				animate = {
					enabled = false,
				},
			},
		},
		keys = {
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
			-- find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			-- {
			-- 	"<leader>sd",
			-- 	function()
			-- 		Snacks.picker.diagnostics()
			-- 	end,
			-- 	desc = "Diagnostics",
			-- },
			-- {
			-- 	"<leader>sD",
			-- 	function()
			-- 		Snacks.picker.diagnostics_buffer()
			-- 	end,
			-- 	desc = "Buffer Diagnostics",
			-- },
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>si",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sM",
				function()
					Snacks.picker.man()
				end,
				desc = "MansPages",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			-- Todo comments
			{
				"<leader>st",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>sT",
				function()
					Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"gai",
				function()
					Snacks.picker.lsp_incoming_calls()
				end,
				desc = "C[a]lls Incoming",
			},
			{
				"gao",
				function()
					Snacks.picker.lsp_outgoing_calls()
				end,
				desc = "C[a]lls Outgoing",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			{
				"<leader>E",
				function()
					Snacks.picker.explorer()
				end,
				desc = "File Explorer",
			},
		},
	},

	{
		"stevearc/conform.nvim",
		dependencies = { "dvimaaniye/mason.nvim" },
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>mp",
				function()
					require("conform").format()
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
		end,
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				bash = { "beautysh" },
				csh = { "beautysh" },
				ksh = { "beautysh" },
				sh = { "beautysh" },
				zsh = { "beautysh" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "black" },
				html = { "prettierd", "prettier", stop_after_first = true },
				htm = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				astro = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				jsonc = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			"onsails/lspkind.nvim",
			"nvim-treesitter/nvim-treesitter",
			"xzbdmw/colorful-menu.nvim",
		},
		config = require("config.completions").setup,
	},

	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},

	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = true,
	},

	{
		"tpope/vim-surround",
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"nvim-mini/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup({
				treesitter = { suffix = "" },
			})
		end,
	},
}
