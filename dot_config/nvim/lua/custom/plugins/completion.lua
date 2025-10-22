return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "v1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				-- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
				-- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
		},
	},
}
