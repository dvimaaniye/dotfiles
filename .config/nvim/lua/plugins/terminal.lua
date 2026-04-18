return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
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
			autochdir = true,
		},
	},
}
