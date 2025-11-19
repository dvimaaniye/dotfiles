return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},

	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = true,
	},

	{
		"tpope/vim-surround",
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
