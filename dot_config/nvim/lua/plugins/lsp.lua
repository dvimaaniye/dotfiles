require("config.lsp").setup()

return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "single",
				backdrop = 100,
				height = 0.8,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Mason UI" })
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	{
		"pmizio/typescript-tools.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
