return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",

					layout_strategy = "bottom_pane",
					layout_config = {
						height = 25,
					},

					border = true,
					borderchars = {
						prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
						results = { " " },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
				},
				extensions = {
					fzf = {},
				},
			})

			require("telescope").load_extension("fzf")

			vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
			vim.keymap.set("n", "<space>en", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end)
			require("custom.telescope.multigrep").setup()
		end,
	},
}
