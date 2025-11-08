return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.surround").setup({ silent = true })
		require("mini.pairs").setup()
		require("mini.bracketed").setup({
			treesitter = { suffix = "" },
		})
	end,
}
