return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup({
				preset = "modern",
				delay = 100,
			})
		end,
	},
}
