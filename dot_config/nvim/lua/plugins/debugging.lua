return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"igorlfs/nvim-dap-view",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = require("config.debugging").setup,
	},
	{
		"igorlfs/nvim-dap-view",
		---@module 'dap-view'
		---@type dapview.Config
		opts = {
			winbar = {
				controls = {
					enabled = true,
				},
			},
		},
	},
}
