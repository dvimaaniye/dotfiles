return {
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
		-- "mason-org/mason.nvim",
		dir = "~/projects/mason.nvim",
		dev = true,
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
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
