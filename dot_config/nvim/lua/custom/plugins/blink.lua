return {
	"saghen/blink.cmp",
	enabled = false,
	dependencies = "rafamadriz/friendly-snippets",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
		},

		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = true,
		},

		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			menu = {
				max_height = 12,
				border = "single",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
					},
				},
			},
			list = { selection = { preselect = false, auto_insert = true } },
			ghost_text = {
				enabled = true,
				-- show_without_selection = true
			},
		},

		-- signature = { enabled = true },

		sources = {
			per_filetype = {
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},
	},
}
