return {
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
		config = function()
			require("config.completions").setup()
		end,
	},
}
