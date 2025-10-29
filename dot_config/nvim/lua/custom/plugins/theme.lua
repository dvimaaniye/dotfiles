return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			require("onedark").setup({
				transparent = true,
				style = "darker",
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})

			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				flavour = "mocha",
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				transparent_mode = true,
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
