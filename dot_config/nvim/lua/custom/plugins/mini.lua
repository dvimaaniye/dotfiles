return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.statusline").setup({ use_icons = true })
		require("mini.surround").setup({ silent = true })
		require("mini.pairs").setup()
		require("mini.bracketed").setup()
	end,
}
