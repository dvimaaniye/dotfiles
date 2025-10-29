return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "single",
				backdrop = 100,
				height = 0.8,
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
				"bashls",
				"ts_ls",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
