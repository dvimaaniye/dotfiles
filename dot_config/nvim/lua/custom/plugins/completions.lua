return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "v1.*",

		opts = {
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},

			completion = {
				menu = {
					border = "single",
					-- draw = {
					-- 	columns = {
					-- 		{ "kind_icon", "label", gap = 1 },
					-- 		{ "label_description" },
					-- 	},
					-- },
				},
				list = { selection = { preselect = false, auto_insert = true } },
				ghost_text = { enabled = true },
			},
			signature = { enabled = true },
		},
	},
}
